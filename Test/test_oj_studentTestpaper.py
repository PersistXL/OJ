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

def query_stuTestpaper(classesId):
    url = "%s/studentTestpaper/studentTestpaperTitle?classesId=%s" % (get_baseurl(), classesId)
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


def test_func(name):
    print 'thread %s start!' % name
    ret = test_student_testpaper(1)
    ASSERT_TRUE(ret, 'select from exam_test')

for num in range(0, 300):
    thread.start_new_thread(test_func, ('test' + str(num), ) )

time.sleep(1111)
