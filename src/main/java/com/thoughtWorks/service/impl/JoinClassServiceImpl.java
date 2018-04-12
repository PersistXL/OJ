package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.JoinClassDao;
import com.thoughtWorks.entity.Student;
import com.thoughtWorks.entity.User;
import com.thoughtWorks.service.JoinClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

public class JoinClassServiceImpl implements JoinClassService {

    @Autowired
    private JoinClassDao joinClassDao;

    @Transactional
    @Override
    public void joinClass(Student student) {
        try {
            User user = new User(student.getName(), "123456", 3, 1, "zhangsan", "学生");

            joinClassDao.joinClassInStudent(student);

            joinClassDao.joinClassInUser(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
