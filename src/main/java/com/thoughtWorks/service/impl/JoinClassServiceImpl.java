package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.JoinClassDao;
import com.thoughtWorks.dao.SysUserDao;
import com.thoughtWorks.entity.*;
import com.thoughtWorks.service.JoinClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
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
            String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

            if (classesList.size() != 0) {
                if (sdf.parse(nowTime).before(classesList.get(0).getCodeEndTime())) {
                    info.put("result", "failure");
                    info.put("info", "该班课时间已截止");
                    return info;
                }
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
                } else {
                    info.put("result", "failure");
                    info.put("info", "学生信息不存在");
                    return info;
                }
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
    public List<Student> isStudentExists(String uuid) {
        return joinClassDao.isStudentExists(uuid);
    }

    @Transactional
    @Override
    public Map<String, String> studentRegister(Student student) {

        Map<String, String> result = new HashMap<>();

        String x = checkInfo(student);
        if (x != null) {
            result.put("msg", x);
            result.put("state", "500");
            return result;
        }
        try {
            joinClassDao.addStudentInfo(student);
            if (student.getPhone() != null && student.getEmail() != null) {
                User user = new User(student.getNo(), "123456", 3, 1, student.getName(), "学生", student.getPhone(),student.getEmail());
                joinClassDao.addStudentInfoToUser(user);
                result.put("msg", "学生信息注册成功");
                result.put("state", "200");
                return result;
            }
            {
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

    @Override
    public List<Classes> isClassesExists(String code) {
        return joinClassDao.isClassesExists(code);
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
