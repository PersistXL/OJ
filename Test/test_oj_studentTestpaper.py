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

def query_stuTestpaper(classesId):
    url = "%s/studentTestpaper/studentTestpaperTitle?classesId=%s" % (get_baseurl(), classesId)
    return get_response(url)


def add_studentScore(testpaperjson):
    url = "%s/studentTestpaper/commitScore?testpaperjson=%s" % (get_baseurl(),testpaperjson)
    return get_response(url)

def test_student_testpaper(classesId):
    data = query_stuTestpaper(classesId)

    if data['result'] != True:
        print 'query failed'
        return False
    if data['data'][0]['score'] != 100.0:
        print 'QUERY FAILED'
        return False
    return True

def test_add_studentScore(testpaperjson):
    data = add_studentScore(testpaperjson)
    if data['result'] != True:
        print 'inseret failed'
        return False

    return True
    
ret = test_student_testpaper(1)
ASSERT_TRUE(ret, 'select from exam_test')

ret = test_add_studentScore("%7B'studentId':'2166','testpaperId':'22','testpaperStudentScore':99.5,'data':[%7B'id':'40','option':'D'%7D]%7D")
ASSERT_TRUE(ret,'Store student stest scores and errors')