package com.thoughtWorks.service;

import com.thoughtWorks.entity.Classes;
import com.thoughtWorks.entity.Student;

import java.util.List;

public interface JoinClassService {
    void joinClass(Student student);

    List<Classes> getClassList(String stuNo);
}
