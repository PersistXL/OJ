package com.thoughtWorks.web.testpaper;

import com.thoughtWorks.dao.TestpaperDao;
import com.thoughtWorks.dto.Result;
import com.thoughtWorks.util.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
    @RequestMapping("addTestpaperCursor")
    public Result addTestpaperCursor(){
        try{
            return Result.success(testpaperDao.addTestpaperCursor(),Constant.ADD_SUCCESS);
        }catch(Exception e){
            e.printStackTrace();
        }
        return  Result.failure(null,Constant.ADD_FAILURE);
    }
    @RequestMapping("deleteTestpaperCursor")
    public Result deleteTestpaperCursor(int id){
        try{
            testpaperDao.deleteTestpaperCursor(id);
            return Result.success();
        }catch(Exception e){
            e.printStackTrace();
        }
        return Result.failure(null,Constant.ADD_FAILURE);
    }
}
