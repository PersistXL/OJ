package com.thoughtWorks.web.infoManage;

import com.thoughtWorks.dao.ModuleOneDao;
import com.thoughtWorks.dao.SubjectDao;
import com.thoughtWorks.dto.Result;
import com.thoughtWorks.entity.ActiveUser;
import com.thoughtWorks.entity.StudentTestpaper;
import com.thoughtWorks.entity.Subject;
import com.thoughtWorks.entity.Testpaper;
import com.thoughtWorks.service.ModuleOneService;
import com.thoughtWorks.util.Constant;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;


/**
 * @author ubuntu
 */
@Component
@RequestMapping("/moduleOne")
public class ModuleOneController {
    @Autowired
    ModuleOneService moduleOneService;
    @Autowired
    ModuleOneDao moduleOneDao;

    @RequestMapping()
    public String index() {
        return "moduleOne/moduleOne/moduleOne";
    }

    @RequestMapping("/findTestpaperClasses")
    @ResponseBody
    public Result findTestpaperClasses(){
        try {
            ActiveUser user = (ActiveUser) SecurityUtils.getSubject().getPrincipal();
            String userName = user.getUserName();
            List<Map<String, Object>> list = moduleOneService.findTestpaperClasses(userName);
            return Result.success(list, Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.SEARCH_FAILURE);
    }

    @RequestMapping("/findTestpaper")
    @ResponseBody
    public Result findTestpaper(){
        try{
            //获取学生的nuserName并把它传页面
//            Map<String, Object> data = new HashMap<>();
//            ActiveUser user = (ActiveUser) SecurityUtils.getSubject().getPrincipal();
//            String userName = user.getUserName();
//            List<Map<String,Object>> testPaperList =  moduleOneService.findTestpaper(userName);
//            data.put("user", user);
//            data.put("testPaperList", testPaperList);
            List<Map<String, Object>> data = new ArrayList<>();
            ActiveUser user = (ActiveUser) SecurityUtils.getSubject().getPrincipal();
            String userName = user.getUserName();
            List<Map<String,Object>> list =  moduleOneService.findTestpaper(userName);

            Iterator<Map<String, Object>> item = list.iterator();
            while (item.hasNext()){
                Map<String,Object> map = new HashMap<>();
                Map<String,Object> value = item.next();
                map.put("name",value.get("name"));
                map.put("testpaperId", value.get("testpaperId"));
                map.put("subject_id",value.get("subject_id"));
                map.put("ClassId",value.get("ClassId"));
                map.put("classes_id",value.get("classes_id"));
                map.put("no", value.get("no"));
                map.put("score", value.get("score"));
                map.put("studentId", value.get("studentId"));
                map.put("closeTime", value.get("close_time"));
                map.put("startTime",value.get("start_time").toString());
                map.put("studentScore",moduleOneService.selectStudentTestpapte(userName, (Integer) value.get("testpaperId")));
                data.add(map);
            }
            return Result.success(data, Constant.SEARCH_SUCCESS);
        }catch (Exception e){
           e.printStackTrace();
        }
        return Result.failure(null,Constant.SEARCH_FAILURE);
    }
    @RequestMapping("/selectTestpaperById")
    @ResponseBody
    public Map<String, Object> selectTestpaperById(int id){
        Map<String, Object> map = new HashMap<>();
        try{
            Testpaper testpaper =   moduleOneDao.selectTestpaperById(id);
            map.put("testpaper",testpaper);

            String sub  = testpaper.getSubjectId();
            String subject[] = sub.split("_");
            map.put("msg", Constant.SEARCH_SUCCESS);
            map.put("data",  moduleOneService.selectTestpaperById(subject));
        }catch (Exception e){
            e.printStackTrace();
            map.put("msg",Constant.SEARCH_FAILURE);
        }
        return map;
    }
    @RequestMapping("/inseretScore")
    @ResponseBody
    public Result inseretScore(StudentTestpaper studentTestpaper){
        System.out.println(studentTestpaper.getTestpaperId());
        try{
            moduleOneService.inseretScore(studentTestpaper);
            return Result.success(null, Constant.ADD_SUCCESS);
        }catch (Exception e){
            e.printStackTrace();
        }
        return Result.failure(null,Constant.ADD_FAILURE);
    }
}