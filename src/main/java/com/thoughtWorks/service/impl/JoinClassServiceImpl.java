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

import java.util.List;
import java.util.Map;

@Service
public class JoinClassServiceImpl implements JoinClassService {

    @Autowired
    private JoinClassDao joinClassDao;

    @Transactional
    @Override
    public void joinClass(Student student,String classCode) {
        try {

//            List<Classes> classesList = joinClassDao.checkClassCode(classCode);

//            joinClassDao.joinClassInStudent(student);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Map<String, Object>> getClassList(String stuNo) {
        return joinClassDao.getClassList(stuNo);
    }

}
