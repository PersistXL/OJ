package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.SysUserDao;
import com.thoughtWorks.entity.Teacher;
import com.thoughtWorks.entity.User;
import com.thoughtWorks.service.SysUserService;
import com.thoughtWorks.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;

@Service
public class SysUserServiceImpl implements SysUserService {

    @Autowired
    private SysUserDao sysUserDao;

    @Override
    public PageUtil getList(PageUtil page) {
        Map<String, Object> data = new HashMap<>();
        data.put("start", (page.getCurrentIndex() - 1) * page.getPageSize());
        data.put("pageSize", page.getPageSize());
        page.setTotalSize(sysUserDao.queryPersonTotalCount());

        page.setData(sysUserDao.getList(data));

        return page;
    }

    @Transactional
    @Override
    public String add(Teacher teacher) {
        try {
            String x = checkInfo(teacher);
            if (x != null) return x;
            if(TeacherEmailOrPhone(teacher)>0 && TeacherUserName(teacher)==0){
                return "手机号或者邮箱已存在";
            }


            User user = new User(teacher.getNo(), "123456", 2, 1, teacher.getName(), "教师", teacher.getPhone(),teacher.getEmail());

            if(TeacherUserName(teacher)>0){
                sysUserDao.updateTeacherToUser(user);
                sysUserDao.add(teacher);
                return "检测到您已有学生账号，更新为老师信息";
            }else{
                sysUserDao.addToUser(user);
                sysUserDao.add(teacher);
                return "添加教师成功";
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "添加教师失败";
    }
    public Long TeacherEmailOrPhone(Teacher teacher){
        return sysUserDao.TeacherEmailOrPhone(teacher);
    }
    public Long TeacherUserName(Teacher teacher){
        return sysUserDao.TeacherUserName(teacher);
    }
    @Override
    public void delete(String phone) {
        sysUserDao.delete(phone);
    }

    @Transactional
    @Override
    public String update(Teacher teacher) {
        try {
            sysUserDao.update(teacher);

            User user = new User(teacher.getNo(), teacher.getName(), "教师", teacher.getPhone(),teacher.getEmail());
            sysUserDao.updateToUser(user);

            return "更新教师信息成功";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "更新教师信息失败";

    }



    private String checkInfo(Teacher teacher) {
        if (checkPhone(teacher.getPhone())) {
            return "该电话已注册";
        }
        if (checkEmail(teacher.getEmail())) {
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
