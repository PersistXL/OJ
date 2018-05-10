package com.thoughtWorks.dao;

import com.thoughtWorks.entity.Classes;
import com.thoughtWorks.entity.Testpaper;
import com.thoughtWorks.entity.TestpaperCursor;
import org.apache.ibatis.annotations.Param;

import java.util.*;

/**
 * Created by 马欢欢 on 2018/4/12.
 */
public interface TestpaperDao {
    /**
     * 查询所有的试题暂存表信息
     *
     * @return
     */
    List<Map<String, Object>> selectTestpaperCursor(int id);

    /**
     * 移除暂存的试题
     */
    void deleteTestpaperCursor(int id);

    /**
     * 添加试题
     */
    void addTestpaperCursor(TestpaperCursor testpaperCursor);

    /**
     * 删除所有试题通过老师id
     *
     * @return
     */
    void deleteTestpaperCursorByName(int id);

    /**
     * 添加试题到试卷表
     *
     * @return
     */
    void addTestpaperCursorToTestpaper(Testpaper testpaper);

    int selectIdByName(String username);

    List<Map<String, Object>> selectClasses(int id);

    void addClasses(Classes classes);

    void addcodeEndTime(Classes classes);

    void deleteClassByTeacherId(int id);

    void deleteStudentByClassByTeacherId(int id);

    List<Map<String, Object>> selectClassesByIdToStudents(int id);

    Long selectTestpaperNameIs(Testpaper testpaper);

    void deleteClassesOfStudentInfo(int id);

    int findClassesId(String code);

    void insertTeacherClasses(@Param("classes_id") int classes_id, @Param("teacherId") int teacherId);

    int judgeTestperOpened(int testpaperId);

    List<String> selectTestpaperCursorOfChapter(int i);

    List<Map<String, Object>> selectHomework(int id);

    void deleteTestPaperInfo(int id);

    void addTestpaper(Testpaper testpaper);
}
