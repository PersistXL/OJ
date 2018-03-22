package com.thoughtWorks.dao;

import com.thoughtWorks.entity.Questions;

import java.util.*;

/**
 * Created by 马欢欢 on 2018/3/21.
 */
public interface SubjectDao {
    List<Questions> selectQuestions();
}
