package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.JoinClassDao;
import com.thoughtWorks.entity.Classes;
import com.thoughtWorks.entity.ClassesTemporary;
import com.thoughtWorks.entity.Student;
import com.thoughtWorks.entity.User;
import com.thoughtWorks.service.JoinClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class JoinClassServiceImpl implements JoinClassService {

    @Autowired
    private JoinClassDao joinClassDao;

    @Transactional
    @Override
    public Map<String, String> joinClass(Student student, String classCode) {
        Map<String, String> info = new HashMap<>();
        try {

            List<Classes> classesList = joinClassDao.checkClassCode(classCode);
            List<Student> studentList = joinClassDao.isExistOfStudent(student.getPhone());
            if (classesList.size() != 0) {
                if (studentList.size() == 0) {
                    joinClassDao.addStudentInfo(student);
                    User user = new User(student.getPhone(), student.getPhone().substring(5, 11), 3, 1, student.getName(), "学生", student.getPhone());
                    joinClassDao.addStudentInfoToUser(user);
                }
                joinClassDao.addStuAndClassesContact(classesList.get(0).getId(), joinClassDao.isExistOfStudent(student.getPhone()).get(0).getId());
                info.put("result", "success");
                info.put("info", "班课信息录入成功");
                return info;
            }

            info.put("result", "failure");
            info.put("info", "校验码输入错误");
            return info;
        } catch (Exception e) {
            e.printStackTrace();
        }
        info.put("result", "failure");
        info.put("info", "班课信息录入失败");
        return info;
    }

    @Override
    public List<Map<String, Object>> getClassList(String stuNo) {
        return joinClassDao.getClassList(stuNo);
    }

}
