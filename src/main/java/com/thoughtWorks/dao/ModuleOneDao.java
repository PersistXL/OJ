package com.thoughtWorks.dao;

import com.thoughtWorks.entity.StudentTestpaper;
import com.thoughtWorks.entity.Testpaper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author Persist
 */
public interface ModuleOneDao {

    /**
     * 查询试卷表
     * @return
     */
    List<Map<String,Object>> findTestpaper(String userName);

    /**
     * 通过id查询subject_id
     * @param id
     * @return
     */
    Testpaper selectTestpaperById(int id);

    /**
     * 通过subject_id查询subject值
     * @param list
     * @return
     */
    List<Map<String,Object>> selectSubjectfromid(List list);

    /**
     * 存储学生成绩
     * @param studentTestpaper
     * @return
     */
    void inseretScore(StudentTestpaper studentTestpaper);

    /**
     * 存储学生成绩`从手机提交
     * @param studentTestpaper
     * @return
     */
    void inseretScore_mobile(StudentTestpaper studentTestpaper);

    /**
     * 根据学生的username查询学生对应的班课
     * @param userName
     * @return
     */
    List<Map<String,Object>> findTestpaperClasses(String userName);

    /**
     * 根据学生userName查询学生的试卷信息
     * @param userName
     * @param testpaperId
     * @return
     */
    String selectStudentTestpapte(@Param("userName")String userName, @Param("testpaperId") int testpaperId);


    //gj
    int selectStuIdbyStUuid(String uuid);

    int duplicateChecking(StudentTestpaper sts);
}
