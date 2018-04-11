package com.thoughtWorks.service;

import java.util.List;
import java.util.Map;

/**
 * @author persistXL
 * @data 2018/4/11 17:37
 */
public interface JobListService {
    List<Map<String,Object>> selectSubject() throws Exception;
}
