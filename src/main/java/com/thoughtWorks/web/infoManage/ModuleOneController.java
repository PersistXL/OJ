package com.thoughtWorks.web.infoManage;

import com.thoughtWorks.dto.Result;
import com.thoughtWorks.service.ModuleOneService;
import com.thoughtWorks.util.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * @author ubuntu
 */
@Component
@RequestMapping("/moduleOne")
public class ModuleOneController {
    @Autowired
    ModuleOneService moduleOneService;

    @RequestMapping()
    public String index() {
        return "moduleOne/moduleOne/moduleOne";
    }

    @RequestMapping("/findTestpaper")
    @ResponseBody
    public Result findTestpaper(){
        try{
        return Result.success(moduleOneService.findTestpaper(), Constant.SEARCH_SUCCESS);
        }catch (Exception e){
           e.printStackTrace();
        }
        return Result.failure(null,Constant.SEARCH_FAILURE);
    }
    @RequestMapping("/selectTestpaperById")
    @ResponseBody
    public Result selectTestpaperById(int id){
        try{
            return Result.success(moduleOneService.selectTestpaperById(id), Constant.SEARCH_SUCCESS);
        }catch (Exception e){
            e.printStackTrace();
        }
        return Result.failure(null,Constant.SEARCH_FAILURE);
    }
}
