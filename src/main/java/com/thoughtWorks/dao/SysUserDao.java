package com.thoughtWorks.dao;

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

    void delete(String phone);

    void update(@Param("teacher") Teacher teacher);

    void updateToUser(@Param("user") User user);
}
