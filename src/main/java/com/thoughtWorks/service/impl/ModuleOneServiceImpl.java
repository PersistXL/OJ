package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.ModuleOneDao;
import com.thoughtWorks.entity.Testpaper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * @author Persist
 */
@Service
public class ModuleOneServiceImpl implements com.thoughtWorks.service.ModuleOneService {
    @Autowired
    ModuleOneDao moduleOneDao;
    @Override
    public List<Map<String,Object>> findTestpaper() throws Exception {
        List<Map<String,Object>> list = moduleOneDao.findTestpaper();
        return list;
    }

    @Override
    public List<Map<String, Object>> selectTestpaperById(int id) {
        Testpaper testpaper =    moduleOneDao.selectTestpaperById(id);
        String sub  = testpaper.getSubjectId();
        String subject[] = sub.split("_");
//        System.out.println(Arrays.toString(subject));
        List list = new ArrayList();
        
        for(String item:subject){
            list.add(item);
        }
        System.out.println(list);
        List<Map<String,Object>> list1 = moduleOneDao.selectSubjectfromid(list) ;
        return list1;
    }
}
