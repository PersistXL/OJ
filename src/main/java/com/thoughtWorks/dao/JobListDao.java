package com.thoughtWorks.dao;

import com.thoughtWorks.entity.Testpaper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author persistXL
 * @data 2018/4/11 18:19
 */
public interface JobListDao {
    /**
     * 根据用户名查询作业试题
     * @param userName
     * @return
     */
    List<Map<String, Object>> selectSubject(String userName);

    /**+
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
    List<Map<String, Object>> selectSubjectClassesName(String userName);

    /**
     * 根据班课Id和试卷的Id查询学生错题信息
     * @param classesId
     * @param testPaperId
     * @return
     */
    int analysisPreview(@Param("classesId") int classesId,@Param("testPaperId") int testPaperId);

    List<Map<String,Object>> wrongMessage(List list);
}
