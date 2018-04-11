package com.thoughtWorks.dao;

import java.util.List;
import java.util.Map;

/**
 * @author persistXL
 * @data 2018/4/11 18:19
 */
public interface JobListDao {
    List<Map<String, Object>> selectSubject();
}
