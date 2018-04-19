package com.thoughtWorks.web.infoManage;

import com.thoughtWorks.dto.Result;
import com.thoughtWorks.entity.ActiveUser;
import com.thoughtWorks.entity.WrongTitle;
import com.thoughtWorks.service.WrongTitleService;
import com.thoughtWorks.util.Constant;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @RequestMapping("/selectWrongTitleNo")
    @ResponseBody
    public Result selectWrongTitleNo(){
        try{
            Map<String, Object> data = new HashMap<>();
            ActiveUser user = (ActiveUser) SecurityUtils.getSubject().getPrincipal();
            String username = user.getUserName();
            List<Map<String, Object>> testPaperList = wrongTitleService.selectWrongTitleNo(username);
            data.put("user", user);
            data.put("testPaperList", testPaperList);
            return Result.success(data, Constant.SEARCH_SUCCESS);
        }catch (Exception e){
            e.printStackTrace();
        }
        return Result.failure(null,Constant.SEARCH_FAILURE);
    }
    @RequestMapping("/deleteWrongTitle")
    @ResponseBody
    public Result deleteWrongTitle(int id){
        try {
            ActiveUser user = (ActiveUser) SecurityUtils.getSubject().getPrincipal();
            String userName = user.getUserName();
            wrongTitleService.deleteWrongTitle(id,userName);
            return Result.success(null, Constant.DELETE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.DELETE_FAILURE);
    }
}
