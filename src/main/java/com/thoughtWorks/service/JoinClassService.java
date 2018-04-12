package com.thoughtWorks.service;

import com.thoughtWorks.entity.ClassesTemporary;

import java.util.List;
import java.util.Map;

public interface JoinClassService {
    void joinClass(ClassesTemporary classesTemporary);

    List<Map<String, Object>> getClassList(String stuNo);
}
