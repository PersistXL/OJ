package com.thoughtWorks.dao;

import java.util.List;
import java.util.Map;

/**
 * @author persistXL
 * @data 2018/4/11 18:19
 */
public interface JobListDao {
    /**
     * 根据用户名查询作业试题
     * @param userName
     * @return
     */
    List<Map<String, Object>> selectSubject(String userName);
}
