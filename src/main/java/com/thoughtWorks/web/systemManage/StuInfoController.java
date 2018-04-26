package com.thoughtWorks.web.systemManage;

import com.thoughtWorks.dto.Result;
import com.thoughtWorks.entity.Student;
import com.thoughtWorks.service.StuService;
import com.thoughtWorks.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/stuinfo")
public class StuInfoController {

    // 去 StuServiceImpl.java 中看实现代码

    @Autowired
    private StuService stuService;

    @RequestMapping()
    public String index() {
        return "systemManage/stuinfo_page/stuinfo_page";
    }

    @RequestMapping("/list")
    @ResponseBody
    public ResponseEntity<Object> list(PageUtil pageUtil) {
        try {
            stuService.getList(pageUtil);

            return new ResponseEntity<Object>(pageUtil, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ResponseEntity<Object>("", HttpStatus.INTERNAL_SERVER_ERROR);
    }

    /*
    @RequestMapping("/add")
    @ResponseBody
    public Result add(Student teacher) {
        try {
            String result = stuService.add(teacher);

            return Result.success("",result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure("", "添加失败");
    }
    */


    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(String number) {
        try {
            stuService.delete(number);
            return Result.success("","删除成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure("", "删除失败");
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(Student student) {
        try {

            String result = stuService.update(student);

            return Result.success("",result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure("", "更新失败");
    }

}
