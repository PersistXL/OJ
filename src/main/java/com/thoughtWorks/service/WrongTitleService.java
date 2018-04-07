package com.thoughtWorks.service;

import com.thoughtWorks.entity.WrongTitle;

import java.util.List;
import java.util.Map;

/**
 * @author persistXL
 * @data ${DATA} 16:51
 */
public interface WrongTitleService  {
    WrongTitle wrongTitleId(WrongTitle wrongTitle);

    List<Map<String,Object>> selectWrongTitleNo(String username);

    void deleteWrongTitle(int id);
}
