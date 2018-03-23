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

    /**
     * 查询所有试题信息
     * @return
     */
    List<Map<String,Object>> selectSubject();

    /**
     * 通过ID查询试题信息
     * @return
     */
    Map<String,Object> selectSubjectById(int id);

    /**
     * 通过id删除试题
     * @param id
     */
    void deleteSubjectById(int id);

    /**
     * 通过id修改题目信息
     * @param subject
     */
    void updateSubjectById(Subject subject);
}
