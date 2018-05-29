package com.thoughtWorks.web.jobList;

import com.thoughtWorks.dto.Result;
import com.thoughtWorks.entity.ActiveUser;
import com.thoughtWorks.entity.Testpaper;
import com.thoughtWorks.service.JobListService;
import com.thoughtWorks.service.ModuleOneService;
import com.thoughtWorks.util.Constant;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author persistXL
 * @data 2018/4/10 10:25
 */
@Component
@RequestMapping("/jobList")
public class JobListController {
    @Autowired
    JobListService jobListService;

    @Autowired
    ModuleOneService moduleOneService;

    @RequestMapping()
    public String index() {
        return "moduleThree/jobList/jobList";
    }

    /**
     * 查询教师对应的班课
     *
     * @return
     */
    @RequestMapping("/selectSubjectClassesName")
    @ResponseBody
    public Result selectSubjectClassesName() {
        try {
            ActiveUser user = (ActiveUser) SecurityUtils.getSubject().getPrincipal();
            String userName = user.getUserName();
            List<Map<String, Object>> list = jobListService.selectSubjectClassesName(userName);
            return Result.success(list, Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.SEARCH_FAILURE);
    }

    @RequestMapping("/selectSubject")
    @ResponseBody
    /**
     * 查询试卷
     */
    public Result selectSubject() {
        try {
            List<Map<String, Object>> data = new ArrayList<>();
            ActiveUser user = (ActiveUser) SecurityUtils.getSubject().getPrincipal();
            String userName = user.getUserName();
            List<Map<String, Object>> list = jobListService.selectSubject(userName);
            Iterator<Map<String, Object>> item = list.iterator();
            SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            while (item.hasNext()) {
                Map<String, Object> map = new HashMap<>();
                Map<String, Object> value = item.next();
                map.put("ClassesName", value.get("ClassesName"));
                map.put("classes_id", value.get("classes_id"));
                map.put("close_time", sm.format(value.get("close_time")));
                map.put("id", value.get("id"));
                map.put("name", value.get("name"));
                map.put("score", value.get("score"));
                map.put("start_time", sm.format(value.get("start_time")));
                map.put("subject_id", value.get("subject_id"));
                map.put("teacher_id", value.get("teacher_id"));
                map.put("testPaperId", value.get("testPaperId"));
                data.add(map);
            }
            return Result.success(data, Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.SEARCH_FAILURE);
    }

    @RequestMapping("/selectStudentTestpaper")
    @ResponseBody
    /**
     * 根据testpaper查询学生的答题情况
     */
    public Result selectStudentTestpaper(Testpaper testpaper) {
        try {
            List<Map<String, Object>> list = jobListService.selectStudentTestpaper(testpaper);
            return Result.success(list, Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.SEARCH_FAILURE);
    }

    @ResponseBody
    @RequestMapping("/analysisPreview")
    public Result analysisPreview(int classesId, int testPaperId) {
        try {
            int list = jobListService.analysisPreview(classesId, testPaperId);
            return Result.success(list, Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.SEARCH_FAILURE);
    }

    @ResponseBody
    @RequestMapping("/selectSubjectName")
    public Result selectSubjectName(String subjectId) {
        try {
            List<Map<String, Object>> data = new ArrayList<>();
            String subject[] = subjectId.split("_");
            List<Map<String, Object>> list = moduleOneService.selectTestpaperById(subject);
            Iterator<Map<String, Object>> item = list.iterator();
            while (item.hasNext()) {
                Map<String, Object> map = new HashMap<>();
                Map<String, Object> value = item.next();
                map.put("subject", value.get("subject"));
                map.put("subjectId", value.get("id"));
                data.add(map);
            }
            return Result.success(data, Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.SEARCH_FAILURE);
    }

    @ResponseBody
    @RequestMapping("/wrongMessage")
    public Result wrongMessage(int classesId, String subjectId) {
        try {
            String subject[] = subjectId.split("_");
            List<Map<String, Object>> list = jobListService.wrongMessage(classesId, subject);
            return Result.success(list, Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.SEARCH_FAILURE);
    }
}
