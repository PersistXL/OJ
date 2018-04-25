#-*- coding:utf-8 -*-
import urllib2
import json
import random
import string
import thread
import time

def ASSERT_NONE(a, name):
    if a == None:
        print '[OK] ' + name;
    else:
        print '[BAD] ' + name;

def ASSERT_TRUE(a, name):
    if a:
        print '[OK] ' + name;
    else:
        print '[BAD] ' + name;


def get_baseurl():
    return 'http://47.105.38.68/oj'


def get_response(url):
    try:
        jstr = urllib2.urlopen(url).read().decode(encoding='UTF-8',errors='strict')
        return json.loads(jstr)
    except:
        return None

#����ѧ������
def add_stu(no, name, phone, email, uuid):
    url = '%s/studentClass/studentRegister?no=%s&name=%s&phone=%s&email=%s&&uuid=%s' % (get_baseurl(), no, name, phone, email, uuid)
    return get_response(url)
    
def query_stu(uuid):
    url = "%s/studentClass/isStudentExists?uuid=%s" % (get_baseurl(), uuid)
    return get_response(url)



#��ѯ�༶�Ƿ����
def query_class(code):
    return get_response("%s/studentClass/isClassesExists?code=%s" % (get_baseurl(), code))


#����ѧ�����༶����
def add_stu_2_class(uuid, code):
    url = "%s/studentClass/joinClass?uuid=%s&classCode=%s" % (get_baseurl(), uuid, code)
    return get_response(url)


#��ѯѧ�����ĸ���Σ������ڶ�����
def query_stu_in_class(stuno):
    return get_response("%s/studentClass/getClasses?stuNo=%s" % (get_baseurl(), stuno))


def test_oper_stu():
    no = random.randint(1, 2000000000)  
    name = ''.join(random.sample(string.ascii_letters + string.digits, 8))
    phone = ''.join(random.sample(string.ascii_letters + string.digits, 11))
    email = ''.join(random.sample(string.ascii_letters + string.digits, 5)) + '@sohu.com'
    uuid = ''.join(random.sample(string.ascii_letters + string.digits, 16))
    jret = add_stu(no, name, phone, email, uuid)
    if None == jret:
        return False

    if jret['stateCode'] != '200':
        print '���ѧ��ʧ��'
        return False

    jret = query_stu(uuid)
    if jret['result'] != True:
        print '��ѯʧ��'
        return False

    if jret['stuInfo'][0]['no'] != str(no):
        print 'ori   no ' + str(no)
        print 'query no ' + jret['stuInfo'][0]['no']
        return False

    if jret['stuInfo'][0]['phone'] != phone:
        print 'ori   phone ' + phone
        print 'query phone ' + jret['stuInfo'][0]['phone']
        return False

    return True

def test_oper_class(classCode):
    jret = query_class(classCode)
    if jret == None:
        print '��ѯ���ʧ�� ' + classCode
        return False

    if jret['stateCode'] == '409':
        print '�ð�β����� ' + classCode
        return False


    no = random.randint(1, 2000000000)  
    name = ''.join(random.sample(string.ascii_letters + string.digits, 8))
    phone = ''.join(random.sample(string.ascii_letters + string.digits, 11))
    email = ''.join(random.sample(string.ascii_letters + string.digits, 5)) + '@sohu.com'
    uuid = ''.join(random.sample(string.ascii_letters + string.digits, 16))
    jret = add_stu(no, name, phone, email, uuid)
    if None == jret:
        return False

    if jret['stateCode'] != '200':
        print '���ѧ��ʧ��'
        return False

    jret = add_stu_2_class(uuid, classCode)
    if jret == None:
        print '�޷���ѧ������༶ %s %s' % (uuid, classCode)
        return False
    print '���ѧ�������γɹ�'


    jret = query_stu_in_class(no)
    if jret == None:
        print '��ѯѧ��ʧ�� ' + str(no)
        return False

    lst = jret['classesList']
    for l in lst:
        if l['code'] == classCode:
            return True

    print '�Ҳ���ѧ��%d �ڰ༶ %s��' % (no, classCode)
    return False


def test_func(name):
    print 'thread %s start!' % name
    ret = test_oper_stu()
    ASSERT_TRUE(ret, '����ѧ������')

    ret = test_oper_class('111111')
    ASSERT_TRUE(ret, '��β���')



for num in range(0, 300):
    thread.start_new_thread(test_func, ('test' + str(num), ) )

time.sleep(1111)
