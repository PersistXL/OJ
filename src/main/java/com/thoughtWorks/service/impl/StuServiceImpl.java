package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.StuDao;
import com.thoughtWorks.entity.Student;
import com.thoughtWorks.entity.User;
import com.thoughtWorks.service.StuService;
import com.thoughtWorks.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;

@Service
public class StuServiceImpl implements StuService {

    // 去 StuDao.xml 中看数据库操作代码

    @Autowired
    private StuDao stuDao;

    // 获取数据库中的学生信息
    @Override
    public PageUtil getList(PageUtil page) {
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("start", (page.getCurrentIndex() - 1) * page.getPageSize());
        data.put("pageSize", page.getPageSize());
        page.setTotalSize(stuDao.queryPersonTotalCount());

        page.setData(stuDao.getList(data));

        return page;
    }

    /*
    @Transactional
    @Override
    public String add(Student teacher) {
        try {
            String x = checkInfo(teacher);
            if (x != null) return x;

            stuDao.add(teacher);

            User user = new User(teacher.getNo(), "123456", 2, 1, teacher.getName(), "教师", teacher.getPhone());
            stuDao.addToUser(user);

            return "添加教师成功";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "添加教师失败";

    }
    */

    @Override
    public void delete(String number) {
        stuDao.delete(number);
    }

    @Transactional
    @Override
    public String update(Student student) {
        try {
            //System.out.println(student.toString());
            stuDao.update(student);

            //User user = new User(student.getNo(), "123456", 3, 1, student.getName(), "学生", student.getPhone());
            //stuDao.updateToUser(user);

            return "更新学生信息成功";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "更新学生信息失败";

    }


    /*
    private String checkInfo(Student teacher) {
        if (checkPhone(teacher.getPhone())) {
            return "该电话已注册";
        }
        if (checkEmail(teacher.getEmail())) {
            return "该邮箱已注册";
        }
        return null;
    }

    public boolean checkPhone(String phone) {
        return stuDao.checkPhone(phone) != null;
    }

    public boolean checkEmail(String email) {
        return stuDao.checkEmail(email) != null;
    }
    */


}
