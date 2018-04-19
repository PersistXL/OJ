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
    List<Map<String,Object>> findTestpaper(String userName) throws Exception;

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
    StudentTestpaper inseretScore(StudentTestpaper studentTestpaper);

    /**
     * 根据学生的username查询学生对应的班课
     * @param userName
     * @return
     */
    List<Map<String,Object>> findTestpaperClasses(String userName);

    /**
     * 根据学生userName查询学生的试卷信息
     * @param userName
     * @return
     */

    String selectStudentTestpapte(String userName, int testpaperId);
}
