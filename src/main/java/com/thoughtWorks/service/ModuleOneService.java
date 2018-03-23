package com.thoughtWorks.service;

import com.thoughtWorks.entity.Questions;
import com.thoughtWorks.entity.Testpaper;

import java.util.List;

public interface ModuleOneService {
    /**
     *
     * @return
     * @throws Exception
     */

    List<Testpaper> findQuestions() throws Exception;
}
