package com.thoughtWorks.service;

import com.thoughtWorks.entity.Testpaper;

import java.util.List;
import java.util.Map;

public interface ModuleOneService {
    /**
     *
     * @return
     * @throws Exception
     */

    List<Map<String,Object>> findTestpaper() throws Exception;

    List<Map<String,Object>> selectTestpaperById(int id);
}
