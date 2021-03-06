package com.thoughtWorks.service;

import com.thoughtWorks.entity.Classes;
import com.thoughtWorks.entity.Student;

import java.util.List;
import java.util.Map;

public interface JoinClassService {
    Map<String,String> joinClass(String uuid,String classCode);

    List<Map<String, Object>> getClassList(String stuNo);

    List<Student> isStudentExists(String uuid);

    Map<String, String> studentRegister(Student student);

    List<Classes> isClassesExists(String code);
}
