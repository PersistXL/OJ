package com.thoughtWorks.service;

import com.thoughtWorks.entity.Questions;

import java.util.List;

public interface ModuleOneService {
    /**
     *
     * @return
     * @throws Exception
     */

    List<Questions> findQuestions() throws Exception;
}
