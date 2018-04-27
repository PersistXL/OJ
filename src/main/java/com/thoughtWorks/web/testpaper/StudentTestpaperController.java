package com.thoughtWorks.web.testpaper;
import com.alibaba.fastjson.JSON;
import com.thoughtWorks.dao.TestpaperDao;
import com.thoughtWorks.dao.ModuleOneDao;
import com.thoughtWorks.dao.WrongTitleDao;
import com.thoughtWorks.dao.StudentTestpaperDao;
import com.thoughtWorks.dto.Result;
import com.thoughtWorks.entity.WrongTitle;
import com.thoughtWorks.entity.wrongAnswer;
import com.thoughtWorks.entity.StudentTestpaper;
import com.thoughtWorks.service.ModuleOneService;
import com.thoughtWorks.util.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;


/**
 * @author persistXL
 * @data 2018/4/17 16:37
 */
@RestController
@RequestMapping("/studentTestpaper")
public class StudentTestpaperController {
    @Autowired
    ModuleOneDao moduleOneDao;
    @Autowired
    WrongTitleDao wrongTitleDao;
    @Autowired
    TestpaperDao testpaperDao;

    @Autowired
    private StudentTestpaperDao studentTestpaperDao;
    @Autowired
    ModuleOneService moduleOneService;
    @RequestMapping("/studentTestpaperTitle")
    @ResponseBody
    public Result studentTestpaperTitle(int classesId){
        try {
            List<Map<String,Object>> data = new ArrayList<>();

            List<Map<String, Object>> list= studentTestpaperDao.studentTestpaperTitle(classesId);
            Iterator<Map<String, Object>> item = list.iterator();
            while(item.hasNext()){
                Map<String,Object> map = new HashMap<>();
                Map<String,Object> value = item.next();
                map.put("teacherName",value.get("teacherName"));
                map.put("testpaperName",value.get("name"));
                map.put("testpaperId",value.get("id"));
                map.put("score",value.get("score"));
                map.put("startTime",value.get("start_time").toString());
                map.put("closeTime",value.get("close_time").toString());
                String sub = (String) value.get("subject_id");
                String subject[] = sub.split("_");
                map.put("SubjectData",  moduleOneService.selectTestpaperById(subject));
                data.add(map);
            }
            return Result.success(data, Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.SEARCH_FAILURE);
    }


    @RequestMapping("/commitScore")
    @ResponseBody
    public Result studentTestpaperTitle(String testpaperjson)
    {
        //String jstr = "{\"studentId\":\"1\",\"testpaperId\":\"22\",\"testpaperStudentScore\":99.5,\"data\":[{\"id\":\"40\",\"option\":\"D\"}]}";
        StudentTestpaper sts = null;
        try
        {
            sts = JSON.parseObject(testpaperjson, StudentTestpaper.class);
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return Result.failure(null,Constant.OPERATION_FAILURE);
        }

        int count = testpaperDao.judgeTestperOpened(sts.getTestpaperId());
        if (count == 0)
        {
            return Result.failure(null,Constant.TESTPAPER_IS_CLOSED);
        }

        int stuId = sts.getStudentId();
        count = moduleOneDao.duplicateChecking(sts);
        System.out.println(count);
        if(count > 0){
            return null;
        }
        try{
            moduleOneService.inseretScore(sts);
            ArrayList<wrongAnswer> wrong_answers = sts.getData();
            for (int i = 0; i < wrong_answers.size(); i++)
            {
                WrongTitle wrtt = new WrongTitle();
                wrtt.setStudentId("" + stuId);
                wrtt.setSubjectId(wrong_answers.get(i).getId());
                String s = "" + wrong_answers.get(i).getOption();
                wrtt.setWrongOptions(s);
                wrongTitleDao.wrongTitleId(wrtt);
            }

            return Result.success(null, Constant.ADD_SUCCESS);
        }catch (Exception e){
            e.printStackTrace();
        }
        return Result.failure(null,Constant.ADD_FAILURE);
    }

    @RequestMapping(value = "/queryScore")
    @ResponseBody
    public  Map<String,Object> queryScore(int stuId, int classId)
    {
        Map<String,Object> map = new HashMap<>();
        try
        {
            map.put("stateCode","200");
            map.put("data",studentTestpaperDao.QueryScore(stuId, classId));
            return map;
        }catch (Exception e){
            e.printStackTrace();
        }

        map.put("msg","查询失败");
        map.put("stateCode","500");
        return map;
    }
}
