package com.thoughtWorks.dao;

import com.thoughtWorks.entity.TestpaperCursor;

import java.util.*;

/**
 * Created by 马欢欢 on 2018/4/12.
 */
public interface TestpaperDao {
    /**
     * 查询所有的试题暂存表信息
     * @return
     */
    List<Map<String,Object>> selectTestpaperCursor();

    /**
     * 移除暂存的试题
     */
   void deleteTestpaperCursor(int id);

    /**
     * 移除暂存的试题
     */
    void addTestpaperCursor(TestpaperCursor testpaperCursor);
}
