package com.thoughtWorks.web.testpaper;

import com.sun.org.apache.regexp.internal.RE;
import com.thoughtWorks.dao.StudentTestpaperDao;
import com.thoughtWorks.dto.Result;
import com.thoughtWorks.service.ModuleOneService;
import com.thoughtWorks.util.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
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
}
