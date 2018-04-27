package com.thoughtWorks.service;

import com.thoughtWorks.entity.Student;
import com.thoughtWorks.util.PageUtil;

// 去 StuServiceImpl.java 中看实现代码

public interface StuService {
    PageUtil getList(PageUtil pageUtil);

    //String add(Student student);

    void delete(String number);

    String update(Student student);

}
