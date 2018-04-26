package com.thoughtWorks.dao;

import com.thoughtWorks.entity.Student;
import com.thoughtWorks.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface StuDao {
    List<Student> getList(@Param("data") Map<String, Object> data);

    Long queryPersonTotalCount();

    //void add(@Param("teacher") Student student);

    //Student checkPhone(String phone);

    //Student checkEmail(String email);

    //void addToUser(@Param("user") User user);

    void delete(String number);

    //void update(@Param("student") Student student);
    void update(Student student);

    void updateToUser(@Param("user") User user);

    //Student checkPhoneByStudent(String phone);

    //Student checkEmailByStudent(String email);
}
