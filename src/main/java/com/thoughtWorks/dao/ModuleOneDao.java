package com.thoughtWorks.dao;

import com.thoughtWorks.entity.Testpaper;

import java.util.List;
import java.util.Map;

/**
 * @author Persist
 */
public interface ModuleOneDao {

    List<Map<String,Object>> findTestpaper();
}
