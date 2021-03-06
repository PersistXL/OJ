package com.thoughtWorks.service;

import com.thoughtWorks.entity.Teacher;
import com.thoughtWorks.util.PageUtil;

public interface SysUserService {
    PageUtil getList(PageUtil pageUtil);

    String add(Teacher teacher);

    void delete(String no);

    String update(Teacher teacher);

}
