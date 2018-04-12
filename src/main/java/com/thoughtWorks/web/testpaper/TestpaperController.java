package com.thoughtWorks.web.testpaper;

import com.thoughtWorks.dao.TestpaperDao;
import com.thoughtWorks.dto.Result;
import com.thoughtWorks.entity.ActiveUser;
import com.thoughtWorks.entity.TestpaperCursor;
import com.thoughtWorks.util.Constant;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.mgt.SecurityManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

/**
 * Created by 马欢欢 on 2018/4/12.
 */
@RestController
@RequestMapping("Testpaper")
public class TestpaperController {

    @Autowired
    TestpaperDao testpaperDao ;
    @RequestMapping("selectTestpaperCursor")
    public Result selectTestpaperCursor(){
        try{
            return Result.success(testpaperDao.selectTestpaperCursor(),Constant.SEARCH_SUCCESS);
        }catch(Exception e){
            e.printStackTrace();
        }
        return  Result.failure(null,Constant.SEARCH_FAILURE);
    }
    @RequestMapping("deleteTestpaperCursor")
    public Result deleteTestpaperCursor(int id){
        try{
            testpaperDao.deleteTestpaperCursor(id);
            return Result.success(null,Constant.DELETE_SUCCESS);
        }catch(Exception e){
            e.printStackTrace();
        }
        return Result.failure(null,Constant.DELETE_FAILURE);
    }
    @RequestMapping("addTestpaperCursor")
    public Result addTestpaperCursor(TestpaperCursor testpaperCursor){
        try{
            String username = ((ActiveUser)SecurityUtils.getSubject().getPrincipal()).getUserName();
            testpaperCursor.setTeacherName(username);
            testpaperDao.addTestpaperCursor(testpaperCursor);
            return Result.success(null,Constant.ADD_SUCCESS);
        }catch(Exception e){
            e.printStackTrace();
        }
        return Result.failure(null,Constant.ADD_FAILURE);
    }
}
