package com.thoughtWorks.web.jobList;

import com.thoughtWorks.dto.Result;
import com.thoughtWorks.entity.ActiveUser;
import com.thoughtWorks.entity.Testpaper;
import com.thoughtWorks.service.JobListService;
import com.thoughtWorks.util.Constant;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * @author persistXL
 * @data 2018/4/10 10:25
 */
@Component
@RequestMapping("/jobList")
public class JobListController {
    @Autowired
    JobListService jobListService;
    @RequestMapping()
    public String index(){
        return "moduleThree/jobList/jobList";
    }

    /**
     * 查询教师对应的班课
     * @return
     */
    @RequestMapping("/selectSubjectClassesName")
    @ResponseBody
    public Result selectSubjectClassesName(){
        try {
            ActiveUser user = (ActiveUser) SecurityUtils.getSubject().getPrincipal();
            String userName = user.getUserName();
            List<Map<String,Object>> list = jobListService.selectSubjectClassesName(userName);
            return Result.success(list, Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null,Constant.SEARCH_FAILURE);
    }

    @RequestMapping("/selectSubject")
    @ResponseBody
    /**
     * 查询试卷
     */
    public Result selectSubject(){
        try {
            ActiveUser user = (ActiveUser) SecurityUtils.getSubject().getPrincipal();
            String userName = user.getUserName();
            List<Map<String,Object>> list = jobListService.selectSubject(userName);
            return Result.success(list, Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null,Constant.SEARCH_FAILURE);
    }

    @RequestMapping("/selectStudentTestpaper")
    @ResponseBody
    /**
     * 根据testpaper查询学生的答题情况
     */
    public Result selectStudentTestpaper(Testpaper testpaper) {
        try {
            List<Map<String, Object>> list = jobListService.selectStudentTestpaper(testpaper);
            return Result.success(list,Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null,Constant.SEARCH_FAILURE);
    }
}
