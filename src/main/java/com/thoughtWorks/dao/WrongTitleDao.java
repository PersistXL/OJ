package com.thoughtWorks.dao;

import com.thoughtWorks.entity.WrongTitle;

import java.util.List;
import java.util.Map;

/**
 * @author persistXL
 * @data 2018/4/6 17:02
 */
public interface WrongTitleDao {

    void wrongTitleId(WrongTitle wrongTitle);

    List<Map<String,Object>> selectWrongTitleNo();

    void deleteWrongTitle(int id);
}
