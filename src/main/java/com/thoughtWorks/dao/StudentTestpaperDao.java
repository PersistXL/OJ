package com.thoughtWorks.dao;

import org.springframework.web.bind.annotation.RequestParam;
import org.apache.ibatis.annotations.Param;
import java.util.List;
import java.util.Map;

/**
 * @author persistXL
 * @data 2018/4/17 16:47
 */
public interface StudentTestpaperDao {
    
    List<Map<String, Object>> studentTestpaperTitle(int classesId) ;

    List<Map<String,Object>> QueryScore(@Param("stuId") int stuId, @Param("classId") int classId);
}
