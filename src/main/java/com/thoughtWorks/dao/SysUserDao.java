package com.thoughtWorks.dao;

import com.thoughtWorks.entity.Student;
import com.thoughtWorks.entity.Teacher;
import com.thoughtWorks.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface SysUserDao {
    List<Teacher> getList(@Param("data") Map<String, Object> data);

    Long queryPersonTotalCount();

    void add(@Param("teacher") Teacher teacher);

    Teacher checkPhone(String phone);

    Teacher checkEmail(String email);

    void addToUser(@Param("user") User user);

    void delete(String no);

    void update(@Param("teacher") Teacher teacher);

    void updateToUser(@Param("user") User user);

    Student checkPhoneByStudent(String phone);

    Student checkEmailByStudent(String email);

    Long TeacherEmailOrPhone(Teacher teacher);

    Long TeacherUserName(Teacher teacher);

    void updateTeacherToUser(@Param("user")User user);

    String selectTeacherName(Object teacher_id);

    int selectIdByName(String username);
}
