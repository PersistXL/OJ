package com.thoughtWorks.web.infoManage;

import com.thoughtWorks.dao.ModuleOneDao;
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

import java.util.HashMap;
import java.util.List;
import java.util.Map;


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
            Map<String, Object> data = new HashMap<>();
            ActiveUser user = (ActiveUser) SecurityUtils.getSubject().getPrincipal();
            String userName = user.getUserName();
            List<Map<String,Object>> testPaperList =  moduleOneService.findTestpaper(userName);
            data.put("user", user);
            data.put("testPaperList", testPaperList);
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
    @RequestMapping("/updateScore")
    @ResponseBody
    public Result updateScore(StudentTestpaper studentTestpaper){
        try{
            moduleOneService.updateScore(studentTestpaper);
            return Result.success(null, Constant.UPLOAD_SUCCESS);
        }catch (Exception e){
            e.printStackTrace();
        }
        return Result.failure(null,Constant.UPLOAD_FAILURE);
    }
}