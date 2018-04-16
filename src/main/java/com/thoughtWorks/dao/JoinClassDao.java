package com.thoughtWorks.dao;

import com.thoughtWorks.entity.Classes;
import com.thoughtWorks.entity.ClassesTemporary;
import com.thoughtWorks.entity.Student;
import com.thoughtWorks.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface JoinClassDao {
    void joinClassInStudent(@Param("classesTemporary") ClassesTemporary classesTemporary);

    List<Map<String, Object>> getClassList(@Param("stuNo") String stuNo);

    List<Classes> checkClassCode(@Param("classCode") String classCode);
}
