package com.thoughtWorks.dao;

import com.thoughtWorks.entity.WrongTitle;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author persistXL
 * @data 2018/4/6 17:02
 */
public interface WrongTitleDao {

    void wrongTitleId(WrongTitle wrongTitle);

    List<Map<String,Object>> selectWrongTitleNo(String username);

    void deleteWrongTitle(@Param("id") int id,@Param("userName") String userName);

    List<Map<String,Object>> selectWrongTitle(String no);

    int selectStudentId(String userName);
}
