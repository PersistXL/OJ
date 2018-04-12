package com.thoughtWorks.web.studentClass;

import com.thoughtWorks.dto.Result;
import com.thoughtWorks.entity.Student;
import com.thoughtWorks.service.JoinClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/studentClass")
public class JoinClassController {

    @Autowired
    private JoinClassService joinClassService;

    @RequestMapping("/joinClass")
    @ResponseBody
    public Result joinClass(Student student) {
        try {
            joinClassService.joinClass(student);
            return Result.success();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(student);
        return Result.failure("","插入失败");
    }

}
