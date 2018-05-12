package com.thoughtWorks.service;

import com.thoughtWorks.entity.Testpaper;

import java.util.List;
import java.util.Map;

/**
 * @author persistXL
 * @data 2018/4/11 17:37
 */
public interface JobListService {
    /**
     * 根据userName查询试卷的信息
     * @param userName
     * @return
     * @throws Exception
     */
    List<Map<String,Object>> selectSubject(String userName) throws Exception;

    /**
     * 根据班课id
     *      教师id
     *      测试名称
     * 查询学生的答题情况
     * @param testpaper
     * @return
     */
    List<Map<String, Object>> selectStudentTestpaper(Testpaper testpaper);

    /**
     * 根据教师的username查询班课的名称
     * @param userName
     * @return
     */
    List<Map<String,Object>> selectSubjectClassesName(String userName);

    /**
     * 根据班课Id和试卷的Id查询学生错题信息
     * @param classesId
     * @param testPaperId
     * @return
     */
    int analysisPreview(int classesId, int testPaperId);
}
