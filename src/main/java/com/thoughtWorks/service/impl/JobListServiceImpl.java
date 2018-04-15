package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.JobListDao;
import com.thoughtWorks.entity.Testpaper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author persistXL
 * @data 2018/4/11 18:17
 */
@Service
public class JobListServiceImpl implements com.thoughtWorks.service.JobListService {
    @Autowired
    JobListDao jobListDao;
    @Override
    public List<Map<String, Object>> selectSubject(String userName) throws Exception {
        List<Map<String, Object>> list = jobListDao.selectSubject(userName);
        return list;
    }

    @Override
    public List<Map<String, Object>> selectStudentTestpaper(Testpaper testpaper) {
        List<Map<String, Object>> list = jobListDao.selectStudentTestpaper(testpaper);
        return list;
    }

    @Override
    public List<Map<String, Object>> selectSubjectClassesName(String userName) {
        List<Map<String, Object>> list = jobListDao.selectSubjectClassesName(userName);
        return list;
    }
}
