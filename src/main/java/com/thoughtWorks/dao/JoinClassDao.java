package com.thoughtWorks.dao;

import com.thoughtWorks.entity.Classes;
import com.thoughtWorks.entity.Student;
import com.thoughtWorks.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface JoinClassDao {
    void joinClassInStudent(@Param("student") Student student);

    void joinClassInUser(@Param("user") User user);

    List<Classes> getClassList(@Param("stuNo") String stuNo);
}
