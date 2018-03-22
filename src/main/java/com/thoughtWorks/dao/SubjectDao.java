package com.thoughtWorks.dao;

import com.thoughtWorks.entity.Questions;
import com.thoughtWorks.entity.Subject;

import java.util.*;

/**
 * Created by 马欢欢 on 2018/3/21.
 */
public interface SubjectDao {
    /**
     * 查询题库
     * @return
     */
    List<Questions> selectQuestions();

    /**
     * 添加题目
     * @param subject
     */
    void addSubject(Subject subject);
}
