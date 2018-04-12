package com.thoughtWorks.dao;

import com.thoughtWorks.entity.Student;
import com.thoughtWorks.entity.User;
import org.apache.ibatis.annotations.Param;

public interface JoinClassDao {
    void joinClassInStudent(@Param("student") Student student);

    void joinClassInUser(@Param("user") User user);
}
