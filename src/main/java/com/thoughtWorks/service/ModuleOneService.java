package com.thoughtWorks.service;

import com.thoughtWorks.entity.StudentTestpaper;

import java.util.List;
import java.util.Map;

public interface ModuleOneService {

    /**
     * 查询o_testpaper表
     * @return
     * @throws Exception
     */
    List<Map<String,Object>> findTestpaper() throws Exception;

    /**
     * 通过id查询
     * @param subject
     * @return
     */
    List<Map<String,Object>> selectTestpaperById(String [] subject);

    /**
     * 插入学生的成绩
     * @param studentTestpaper
     * @return
     */
    StudentTestpaper updateScore(StudentTestpaper studentTestpaper);
}
