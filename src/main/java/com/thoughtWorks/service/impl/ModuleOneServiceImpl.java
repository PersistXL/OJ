package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.ModuleOneDao;
import com.thoughtWorks.entity.Questions;

import java.util.List;

/**
 * @author Persist
 */
public class ModuleOneServiceImpl implements com.thoughtWorks.service.ModuleOneService {
    ModuleOneDao moduleOneDao;
    @Override
    public List<Questions> findQuestions() throws Exception {
        return moduleOneDao.findQuestions();
    }
}
