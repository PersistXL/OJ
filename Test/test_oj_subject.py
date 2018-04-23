#-*- coding:utf-8 -*-
import urllib2
import json
import random
import string

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
    return 'http://10.53.0.34:8080/oj'

def get_response(url):
    try:
        jstr = urllib2.urlopen(url).read().decode(encoding='UTF-8',errors='strict')
        return json.loads(jstr)
    except:
        return None

def select_subject():
    url ="%s/subject/mobileSelectSubject" % (get_baseurl())
    return get_response(url)

def test_oper_subject():
    data = select_subject()
    if None == data:
        print '����ѯ����ֵ'
        return False

    if data['result'] != True:
        print '����ѯʧ��'
        return False

    if len(data['data']) != 998:
        print '����ѯ��������'
        return False
    return True

ret = test_oper_subject()
ASSERT_TRUE(ret, '��ѯ������е��������⣡')
