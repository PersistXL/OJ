package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.WrongTitleDao;
import com.thoughtWorks.entity.WrongTitle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

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

    @Override
    public List<Map<String, Object>> selectWrongTitleNo(String username) {
        List<Map<String, Object>> list = wrongTitleDao.selectWrongTitleNo(username);
        return list;
    }

    @Override
    public void deleteWrongTitle(int id,String userName) {
        wrongTitleDao.deleteWrongTitle(id,userName);
    }
}
