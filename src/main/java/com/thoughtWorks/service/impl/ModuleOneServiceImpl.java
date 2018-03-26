package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.ModuleOneDao;
import com.thoughtWorks.entity.Testpaper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
