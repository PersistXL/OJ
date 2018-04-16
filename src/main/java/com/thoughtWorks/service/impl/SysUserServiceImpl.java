package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.SysUserDao;
import com.thoughtWorks.service.SysUserService;
import com.thoughtWorks.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class SysUserServiceImpl implements SysUserService {

    @Autowired
    private SysUserDao sysUserDao;

    @Override
    public PageUtil getList(PageUtil page) {
        Map<String, Object> data = new HashMap<>();
        data.put("start", (page.getCurrentIndex() - 1) * page.getPageSize());
        data.put("pageSize", page.getPageSize());
        page.setTotalSize(sysUserDao.queryPersonTotalCount());

        page.setData(sysUserDao.getList(data));

        return page;
    }
}
