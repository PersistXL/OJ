package com.thoughtWorks.service;

import com.thoughtWorks.entity.Testpaper;

import java.util.List;

public interface ModuleOneService {
    /**
     *
     * @return
     * @throws Exception
     */

    List<Testpaper> findTestpaper() throws Exception;
}
