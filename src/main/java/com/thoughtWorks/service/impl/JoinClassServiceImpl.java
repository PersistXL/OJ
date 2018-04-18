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
                    int count = joinClassDao.checkClass(classesList.get(0).getId(), studentList.get(0).getId());
                    if (count == 0) {
                        joinClassDao.addStuAndClassesContact(classesList.get(0).getId(), studentList.get(0).getId());
                        info.put("result", "success");
                        info.put("info", "班课信息录入成功");
                        return info;
                    } else {
                        info.put("result", "failure");
                        info.put("info", "重复录入班课信息");
                        return info;
                    }
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
    public Map<String, String> studentRegister(Student student) {

        Map<String, String> result = new HashMap<>();

        String x = checkInfo(student);
        if (x != null){
            result.put("msg", x);
            result.put("state", "500");
            return result;
        }
        try {
            joinClassDao.addStudentInfo(student);
            if (student.getPhone() != null && student.getEmail() != null) {
                User user = new User(student.getPhone(), "123456", 3, 1, student.getName(), "学生", student.getPhone());
                joinClassDao.addStudentInfoToUser(user);
                result.put("msg", "学生信息注册成功");
                result.put("state", "200");
                return result;
            } else if (student.getPhone() != null) {
                User user = new User(student.getPhone(), "123456", 3, 1, student.getName(), "学生", student.getPhone());
                joinClassDao.addStudentInfoToUser(user);
                result.put("msg", "学生信息注册成功");
                result.put("state", "200");
                return result;
            } else if (student.getEmail() != null) {
                User user = new User(student.getEmail(), "123456", 3, 1, student.getName(), "学生", "");
                joinClassDao.addStudentInfoToUser(user);
                result.put("msg", "学生信息注册成功");
                result.put("state", "200");
                return result;
            } else {
                result.put("msg", "手机号或邮箱为空");
                result.put("state", "500");
                return result;
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
        result.put("msg", "学生信息注册失败");
        result.put("state", "500");
        return result;
    }


    private String checkInfo(Student student) {
        if (student.getPhone() != null) {
            if (checkPhone(student.getPhone())) {
                return "该电话已注册";
            }
        }
        if (student.getEmail() != null) {
            if (checkEmail(student.getEmail())) {
                return "该邮箱已注册";
            }
        }
        return null;
    }

    public boolean checkPhone(String phone) {
        return sysUserDao.checkPhoneByStudent(phone) != null;
    }

    public boolean checkEmail(String email) {
        return sysUserDao.checkEmailByStudent(email) != null;
    }
}
