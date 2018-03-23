package com.thoughtWorks.web.infoManage;

import com.thoughtWorks.dto.Result;
import com.thoughtWorks.service.ModuleOneService;
import com.thoughtWorks.util.Constant;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * @author ubuntu
 */
@Component
@RequestMapping("/moduleOne")
public class ModuleOneController {

    ModuleOneService moduleOneService;

    @RequestMapping()
    public String index() {
        return "moduleOne/moduleOne/moduleOne";
    }

    @RequestMapping("/findQuestions")
    public Result findQuestions(){
        try{
        return Result.success(moduleOneService.findQuestions(), Constant.SEARCH_SUCCESS);
        }catch (Exception e){
           e.printStackTrace();
        }
        return Result.failure(null,Constant.SEARCH_FAILURE);
    }
}
