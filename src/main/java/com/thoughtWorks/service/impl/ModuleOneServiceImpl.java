package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.ModuleOneDao;
import com.thoughtWorks.entity.Testpaper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Persist
 */
@Service
public class ModuleOneServiceImpl implements com.thoughtWorks.service.ModuleOneService {
    @Autowired
    ModuleOneDao moduleOneDao;
    @Override
    public List<Testpaper> findTestpaper() throws Exception {
        List<Testpaper> list = moduleOneDao.findTestpaper();
        return list;
    }
}
