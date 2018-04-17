package com.thoughtWorks.dao;

import java.util.List;
import java.util.Map;

/**
 * @author persistXL
 * @data 2018/4/17 16:47
 */
public interface StudentTestpaperDao {
    
    List<Map<String, Object>> studentTestpaperTitle(int classesId) ;
}
