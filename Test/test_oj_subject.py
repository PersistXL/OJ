#-*- coding:utf-8 -*-
import urllib2
import json
import random
import string
import thread
import time
import color
color.printYellowRed('dazweni')
color.printPink('dajiaha')

succ_count  = 0
fail_count  = 0

def ASSERT_NONE(a, name):
    if a == None:
        color.printGreen( '[OK] ' + name + '\n');
    else:
        color.printRed('[BAD] ' + name + '\n');

def ASSERT_TRUE(a, name):
    if a:
        color.printGreen( '[OK] ' + name + '\n');
    else:
        color.printRed('[BAD] ' + name + '\n');

def get_baseurl():
    return 'http://10.53.0.34:8080/oj'

def get_response(url):
    try:
        jstr = urllib2.urlopen(url, timeout = 120).read().decode(encoding='UTF-8',errors='strict')
        ret = json.loads(jstr)
        if ret == None:
            print jstr
        return ret
    except Exception, e:
        print e
        print '-----------------------'
        return None

# ��ѯ��������
def select_subject():
    url ="%s/subject/mobileSelectSubject" % (get_baseurl())
    return get_response(url)

# ��ѯ���д���ͨ��uuid
def wrong_question(uuid):
    url = "%s/wrongTitle/selectStudentWrongTitlteNo?uuid=%s" % (get_baseurl(), uuid)
    return get_response(url)

# ɾ������ͨ������id��ѧ��id
def delete_wrong(subject_id,stuId):
    url = "%s/wrongTitle/deleteWrongTitle?id=%s&stu=%s" % (get_baseurl(),subject_id,stuId)
    return get_response(url)

def select_score(stuId,classId):
    url = "%s/studentTestpaper/queryScore?stuId=%s&&classId=%s" % (get_baseurl(),stuId,classId)
    return get_response(url)

def test_oper_subject():
    global succ_count
    global fail_count
    data = select_subject()
    if None == data:
        print '����ѯ����ֵ'
        fail_count += 1
        print 'fial' + str(fail_count)      
        return False

    if data['result'] != True:
        print '����ѯʧ��'
        fail_count += 1
        print 'fial' + str(fail_count)
        return False

    
    if len(data['data']) != 50:
        print '����ѯ��������'
        fail_count += 1
        print 'fial' + str(fail_count)
        return False

    succ_count += 1
    print 'succ ' + str(succ_count)
    return True

def test_wrong_question(uuid):
    data = wrong_question(uuid)

    if data['result'] != True:
        print '�����ѯʧ��'
        return False

    if data['data'][0]['stu'] != 2166:
        print '�����ѯʧ��'
        return False

    return True


def test_delete_wrong_question(subject_id,stuId):
    data = delete_wrong(subject_id,stuId)

    if data['result'] != True:
        print 'ɾ������ʧ��'
        return False

    if data['data'] != None:
        print 'ɾ������ʧ��'
        return False

    return True

def test_select_score(stuId,classId):
    data = select_score(stuId,classId)

    if data['stateCode'] != '200':
        print '�ɼ���ѯʧ��'
        return False

    if data['data'][0]['testpaper_student_score'] != 99.5:
        print '�ɼ���ѯʧ��'
        return False

    return True


	
def test_func(name):
    print 'thread %s start!' % name
    
    '''
    ret = test_oper_subject()
    ASSERT_TRUE(ret, '��ѯ������е��������⣡')
    '''

    ret = test_wrong_question('zwaDR2StLUVGJoTd')
    ASSERT_TRUE(ret, '��ѯ���д��⣡')
    
    '''
    ret = test_delete_wrong_question(2,3)
    ASSERT_TRUE(ret, 'ɾ�����⣡')
    '''

    ret = test_select_score(2166,1)
    ASSERT_TRUE(ret, '�ɼ���ѯ!')

for num in range(0, 300):
    thread.start_new_thread(test_func, ('test' + str(num), ) )

time.sleep(1111)
