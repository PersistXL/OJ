package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.JoinClassDao;
import com.thoughtWorks.dao.SysUserDao;
import com.thoughtWorks.entity.*;
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

    @Autowired
    private SysUserDao sysUserDao;

    @Transactional
    @Override
    public Map<String, String> joinClass(String stuNo, String classCode) {
        Map<String, String> info = new HashMap<>();
        try {

            List<Classes> classesList = joinClassDao.checkClassCode(classCode);
            List<Student> studentList = joinClassDao.isStudentExists(stuNo);
            if (classesList.size() != 0) {
                if (studentList.size() != 0) {
                    joinClassDao.addStuAndClassesContact(classesList.get(0).getId(), studentList.get(0).getId());
                    info.put("result", "success");
                    info.put("info", "班课信息录入成功");
                    return info;
                }
                info.put("result", "failure");
                info.put("info", "学生信息不存在");
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

    @Override
    public boolean isStudentExists(String no) {
        List<Student> students = joinClassDao.isStudentExists(no);
        if (students.size() > 0) {
            return true;
        }
        return false;
    }

    @Transactional
    @Override
    public String studentRegister(Student student) {

        try {
            String x = checkInfo(student);
            if (x != null) return x;

            joinClassDao.addStudentInfo(student);
            User user = new User(student.getPhone(), student.getPhone().substring(5, 11), 3, 1, student.getName(), "学生", student.getPhone());
            joinClassDao.addStudentInfoToUser(user);

            return "学生信息注册成功";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "学生信息注册失败";
    }


    private String checkInfo(Student student) {
        if (checkPhone(student.getPhone())) {
            return "该电话已注册";
        }
        if (checkEmail(student.getEmail())) {
            return "该邮箱已注册";
        }
        return null;
    }

    public boolean checkPhone(String phone) {
        return sysUserDao.checkPhone(phone) != null;
    }

    public boolean checkEmail(String email) {
        return sysUserDao.checkEmail(email) != null;
    }
}
