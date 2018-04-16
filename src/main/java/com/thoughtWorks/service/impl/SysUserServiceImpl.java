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
            if (checkPhone(teacher.getPhone())) {
                return "该电话已注册";
            }
            if (checkEmail(teacher.getEmail())) {
                return "该邮箱已注册";
            }
            sysUserDao.add(teacher);

            User user = new User(teacher.getPhone(), "123456", 2, 1, teacher.getName(), "教师", teacher.getPhone());
            sysUserDao.addToUser(user);

            return "添加教师成功";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "添加教师失败";
    }

    @Override
    public void delete(String phone) {
        sysUserDao.delete(phone);
    }

    private boolean checkPhone(String phone) {
        return sysUserDao.checkPhone(phone) != null;
    }

    private boolean checkEmail(String email) {
        return sysUserDao.checkEmail(email) != null;
    }


}
