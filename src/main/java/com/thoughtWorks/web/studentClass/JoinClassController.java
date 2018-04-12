package com.thoughtWorks.web.studentClass;

import com.thoughtWorks.entity.ClassesTemporary;
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

import static com.thoughtWorks.util.Constant.*;

@Controller
@RequestMapping("/studentClass")
public class JoinClassController {

    @Autowired
    private JoinClassService joinClassService;

    @RequestMapping("/joinClass")
    @ResponseBody
    public ResponseEntity joinClass(ClassesTemporary classesTemporary) {
        Map<String, Object> classes = new HashMap<>();
        try {
            joinClassService.joinClass(classesTemporary);
            classes.put("stateCode", SUCCESS_CODE);
            classes.put("message", ADD_SUCCESS);
            return new ResponseEntity(classes, HttpStatus.OK);
        } catch (Exception e) {
            classes.put("stateCode", FAILURE_CODE);
            classes.put("message", ADD_FAILURE);
            e.printStackTrace();
        }
        return new ResponseEntity(classes, HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @RequestMapping("/getClasses")
    @ResponseBody
    public ResponseEntity getClasses(String stuNo) {
        Map<String, Object> classes = new HashMap<>();
        try {
            List<Map<String, Object>> classesList = joinClassService.getClassList(stuNo);
            classes.put("classesList", classesList);
            classes.put("stateCode", SUCCESS_CODE);
            return new ResponseEntity(classes, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            classes.put("stateCode",FAILURE_CODE);
        }
        return new ResponseEntity("获取失败", HttpStatus.INTERNAL_SERVER_ERROR);
    }

}
