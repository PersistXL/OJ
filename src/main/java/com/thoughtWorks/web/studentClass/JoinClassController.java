package com.thoughtWorks.web.studentClass;

import com.thoughtWorks.dto.Result;
import com.thoughtWorks.entity.Classes;
import com.thoughtWorks.entity.Student;
import com.thoughtWorks.service.JoinClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @RequestMapping("/getClasses")
    @ResponseBody
    public ResponseEntity getClasses(String stuNo) {
        Map<String, Object> classes = new HashMap<>();
        List<Classes> classesList = joinClassService.getClassList(stuNo);
        classes.put("classesList", classesList);
        return new ResponseEntity(classes, HttpStatus.OK);
    }

}
