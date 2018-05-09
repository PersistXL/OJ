package com.thoughtWorks.web.homework;

import com.thoughtWorks.dao.TestpaperDao;
import com.thoughtWorks.dto.Result;
import com.thoughtWorks.entity.ActiveUser;
import com.thoughtWorks.entity.Testpaper;
import com.thoughtWorks.util.Constant;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * @author persistXL
 * @data 2018/5/8 22:11
 */
@Component
@RequestMapping("/homework")
public class HomeworkController {
    @Autowired
    TestpaperDao testpaperDao;
    @ResponseBody
    @RequestMapping("/selectHomework")
    public Result selectHomework(){
        try {
            String username = ((ActiveUser) SecurityUtils.getSubject().getPrincipal()).getUserName();
            int id = testpaperDao.selectIdByName(username);

           List<Map<String,Object>> list = testpaperDao.selectHomework(id);
            return Result.success(list, Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.SEARCH_FAILURE);
    }
}
