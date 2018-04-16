package com.thoughtWorks.dao;

import com.thoughtWorks.entity.Teacher;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface SysUserDao {
    List<Teacher> getList(@Param("data") Map<String, Object> data);

    Long queryPersonTotalCount();
}
