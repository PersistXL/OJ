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

def add_subject(subject,optionA,optionB,optionC,optionD,optionE,correct,subjectImg,questionsId,chapter,facility,type):
    url = "%s/subject/addSubject?subject=%s&&optionA=%s&&optionB=%s&&optionC=%s&&optionD=%s&&optionE=%s&&correct=%s&&subjectImg=%s&&questionsId=%s&&chapter=%s&&facility=%s&&type=%s" % (get_baseurl(),subject,optionA,optionB,optionC,optionD,optionE,correct,subjectImg,questionsId,chapter,facility,type)
    return get_response(url)

def test_student_subject(subject,optionA,optionB,optionC,optionD,optionE,correct,subjectImg,questionsId,chapter,facility,type):
    data = add_subject(subject,optionA,optionB,optionC,optionD,optionE,correct,subjectImg,questionsId,chapter,facility,type)

    if data['result'] != True:
        
        return False
    
    return True


def test_func(name):
    print 'thread %s start!' % name
    ret = test_student_subject('asdfasdfasdf','aasdf','aasdf','aasdf','aasdf','aasdf','E','qq',1,'111','1111','asdfasdf')
    ASSERT_TRUE(ret, 'add_subject_success')

for num in range(0, 12):
    thread.start_new_thread(test_func, ('test' + str(num), ) )

time.sleep(1111)
