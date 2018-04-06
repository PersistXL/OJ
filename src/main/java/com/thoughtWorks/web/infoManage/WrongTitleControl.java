package com.thoughtWorks.web.infoManage;

import com.thoughtWorks.dto.Result;
import com.thoughtWorks.entity.WrongTitle;
import com.thoughtWorks.service.WrongTitleService;
import com.thoughtWorks.util.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author Persist
 */
@Component
@RequestMapping("/wrongTitle")
public class WrongTitleControl {
    @Autowired
    WrongTitleService wrongTitleService;
    @RequestMapping()
    public String index() {
        return "moduleOne/wrongTitle/wrongTitle";
    }

    @RequestMapping("/wrongTitleId")
    @ResponseBody
    public Result wrongTitleId(WrongTitle wrongTitle) {
        try {
            wrongTitleService.wrongTitleId(wrongTitle);
            return Result.success(null, Constant.ADD_SUCCESS);
        }catch (Exception e){
            e.printStackTrace();
        }
        return Result.failure(null,Constant.ADD_FAILURE);
    }
}
