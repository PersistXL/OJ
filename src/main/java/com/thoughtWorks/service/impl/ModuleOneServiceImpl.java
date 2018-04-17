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
    public StudentTestpaper updateScore(StudentTestpaper studentTestpaper) {
        moduleOneDao.updateScore(studentTestpaper);
        return null;
    }

    @Override
    public List<Map<String, Object>> findTestpaperClasses(String userName) {
        List<Map<String,Object>> list = moduleOneDao.findTestpaperClasses(userName);
        return list;
    }
}
