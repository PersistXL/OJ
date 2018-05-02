package com.thoughtWorks.dao;

import com.thoughtWorks.entity.Questions;
import com.thoughtWorks.entity.Subject;
import com.thoughtWorks.util.PageUtil;
import com.thoughtWorks.entity.QuestionBankParameter;
import org.apache.ibatis.annotations.Param;

import java.util.*;

/**
 * Created by 马欢欢 on 2018/3/21.
 */
public interface SubjectDao {

    // 题库管理接口 -- 开始

    /**
     * 查询题库
     * @return
     */
    List<Questions> selectQuestions();

    /**
     * 通过id查询题库
     * @param id
     */
    Questions selectQbankById(int id);

    /**
     * 添加题库
     * @param qbparameter
     */
    void addQbank(QuestionBankParameter qbparameter);

    /**
     * 通过id删除题库
     * @param id
     */
    void deleteQbankById(int id);

    /**
     * 通过id修改题目信息
     * @param parameter
     */
    void updateQbankById(QuestionBankParameter parameter);

    // 题库管理接口 -- 结束

    /**
     * 添加题目
     * @param subject
     */
    void addSubject(Subject subject);

    /**
     * 查询所有试题信息
     * @return
     */
    List<Map<String,Object>> selectSubject(Map<String, Object> map);

    Long querySubjectTotalCount(Subject subject);

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

    /**
     * excel倒入数据
     * @param list
     */
    void insertSubjectByExcel(@Param("list") List<Map<String,String>> list,@Param("questionsId") int questionsId);
    /**
     * excel倒入数据
     * @param list
     */
    void insertSubjectByExcelThree( @Param("list") List<Map<String,String>> list,@Param("questionsId") int questionsId);

    /**
     * 移动端查询题库
     * @return
     */
    List<Map<String,Object>> mobileSelectSubject();

    /**
     * 移动端查询三维题库
     * @return
     */
    List<Map<String,Object>> mobileSelectSubjectModel();
}
