package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.WrongTitleDao;
import com.thoughtWorks.entity.WrongTitle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author persistXL
 * @data 2018/4/6 16:59
 */
    @Service
    public class WrongTitleServiceImpl implements com.thoughtWorks.service.WrongTitleService {
    @Autowired
    WrongTitleDao wrongTitleDao;

    @Override
    public WrongTitle wrongTitleId(WrongTitle wrongTitle) {
        wrongTitleDao.wrongTitleId(wrongTitle);
        return null;
    }
}
