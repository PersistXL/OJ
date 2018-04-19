package com.thoughtWorks.dao;

import com.thoughtWorks.entity.Classes;
import com.thoughtWorks.entity.ClassesTemporary;
import com.thoughtWorks.entity.Student;
import com.thoughtWorks.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface JoinClassDao {

    List<Map<String, Object>> getClassList(@Param("stuNo") String stuNo);

    List<Classes> checkClassCode(@Param("classCode") String classCode);

    List<Student> isExistOfStudent(String phone);

    void addStudentInfo(@Param("student") Student student);

    void addStudentInfoToUser(@Param("user") User user);

    void addStuAndClassesContact(@Param("classId") Integer classId, @Param("studentId") Integer studentId);

    List<Student> isStudentExists(String uuid);

    void studentRegister(Student student);

    int checkClass(@Param("classId") Integer classId, @Param("studentId") Integer studentId);
}
