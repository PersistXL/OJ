package com.thoughtWorks.dao;

import com.thoughtWorks.entity.Testpaper;

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
    List<Map<String,Object>> findTestpaper();

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
}
