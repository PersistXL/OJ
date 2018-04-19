package com.thoughtWorks.web.infoManage;

import com.thoughtWorks.dao.WrongTitleDao;
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
    @Autowired
    WrongTitleDao wrongTitleDao;
    @RequestMapping()
    public String index() {
        return "moduleOne/wrongTitle/wrongTitle";
    }

    @RequestMapping("/wrongTitleId")
    @ResponseBody
    public Result wrongTitleId(WrongTitle wrongTitle) {
        try {
            wrongTitleService.wrongTitleId(wrongTitle);
            System.out.println(wrongTitle);
            return Result.success(null, Constant.ADD_SUCCESS);
        }catch (Exception e){
            e.printStackTrace();
        }
        return Result.failure(null,Constant.ADD_FAILURE);
    }

    @RequestMapping("/selectWrongTitleNo")
    @ResponseBody
    public Result selectWrongTitleNo(int stu){
        try{
            Map<String, Object> data = new HashMap<>();
            ActiveUser user = (ActiveUser) SecurityUtils.getSubject().getPrincipal();
            String username = user.getUserName();
            List<Map<String, Object>> testPaperList = wrongTitleService.selectWrongTitleNo(stu);
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
    public Result deleteWrongTitle(int id,int stu){
        try {
            wrongTitleService.deleteWrongTitle(id,stu);
            return Result.success(null, Constant.DELETE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.DELETE_FAILURE);
    }
    @RequestMapping("/selectWrongTitle")
    @ResponseBody
    public Result selectWrongTitle(String no){
        try{
            List<Map<String, Object>> list = wrongTitleDao.selectWrongTitle(no);
            return Result.success(list, Constant.SEARCH_SUCCESS);
        }catch (Exception e){
            e.printStackTrace();
        }
        return Result.failure(null,Constant.SEARCH_FAILURE);
    }
    @RequestMapping("/selectStudentId")
    @ResponseBody
    public Result selectStudentId(){
        try {
            ActiveUser user = (ActiveUser) SecurityUtils.getSubject().getPrincipal();
            String userName = user.getUserName();
            int id = 0;
            id = wrongTitleDao.selectStudentId(userName);
            return Result.success(id, Constant.SEARCH_SUCCESS);
        }catch (Exception e){
            e.printStackTrace();
        }
        return Result.failure(null, Constant.SEARCH_FAILURE);
    }

}
