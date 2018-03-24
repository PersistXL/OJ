package com.thoughtWorks.dao;

import com.thoughtWorks.entity.Testpaper;

import java.util.List;

/**
 * @author Persist
 */
public interface ModuleOneDao {

    List<Testpaper> findTestpaper();
}
