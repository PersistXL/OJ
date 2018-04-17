package com.thoughtWorks.service;

import com.thoughtWorks.entity.Student;

import java.util.List;
import java.util.Map;

public interface JoinClassService {
    Map<String,String> joinClass(String stuNo,String classCode);

    List<Map<String, Object>> getClassList(String stuNo);

    boolean isStudentExists(String no);

    String studentRegister(Student student);
}
