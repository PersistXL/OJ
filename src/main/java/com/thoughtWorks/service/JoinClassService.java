package com.thoughtWorks.service;

import com.thoughtWorks.entity.ClassesTemporary;
import com.thoughtWorks.entity.Student;

import java.util.List;
import java.util.Map;

public interface JoinClassService {
    void joinClass(Student student,String classCode);

    List<Map<String, Object>> getClassList(String stuNo);
}
