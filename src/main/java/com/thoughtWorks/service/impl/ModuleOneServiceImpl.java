package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.ModuleOneDao;
import com.thoughtWorks.entity.StudentTestpaper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * @author Persist
 */
@Service
public class ModuleOneServiceImpl implements com.thoughtWorks.service.ModuleOneService {
    @Autowired
    ModuleOneDao moduleOneDao;
    @Override
    public List<Map<String,Object>> findTestpaper(String userName) throws Exception {
        List<Map<String,Object>> list = moduleOneDao.findTestpaper(userName);
        return list;
    }

    @Override
    public List<Map<String, Object>> selectTestpaperById(String [] subject) {
        List list = new ArrayList();
        
        for(String item:subject){
            list.add(item);
        }
        List<Map<String,Object>> list1 = moduleOneDao.selectSubjectfromid(list) ;

        return list1;
    }

    @Override
    public StudentTestpaper inseretScore(StudentTestpaper studentTestpaper) {
        moduleOneDao.inseretScore(studentTestpaper);
        return null;
    }

    @Override
    public StudentTestpaper inseretScore_mobile(StudentTestpaper studentTestpaper) {
        moduleOneDao.inseretScore_mobile(studentTestpaper);
        return null;
    }

    @Override
    public List<Map<String, Object>> findTestpaperClasses(String userName) {
        List<Map<String,Object>> list = moduleOneDao.findTestpaperClasses(userName);
        return list;
    }

    @Override
    public String selectStudentTestpapte(String userName, int testpaperId) {
        String map = moduleOneDao.selectStudentTestpapte(userName,testpaperId);
        return map;
    }
}
