package com.thoughtWorks.web.studentClass;

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

import static com.thoughtWorks.util.Constant.*;

@Controller
@RequestMapping("/studentClass")
public class JoinClassController {

    @Autowired
    private JoinClassService joinClassService;

    @RequestMapping("/joinClass")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> joinClass(String uuid, String classCode) {
        Map<String, Object> classes = new HashMap<>();
        Map<String, String> resultInfo = joinClassService.joinClass(uuid, classCode);
        if (resultInfo.get("result").equals("success")) {
            classes.put("stateCode", SUCCESS_CODE);
            classes.put("message", resultInfo.get("info"));
            return new ResponseEntity<>(classes, HttpStatus.OK);
        } else {
            classes.put("stateCode", FAILURE_CODE);
            classes.put("message", resultInfo.get("info"));
            return new ResponseEntity<>(classes, HttpStatus.OK);
        }
    }

    @RequestMapping("/getClasses")
    @ResponseBody
    public ResponseEntity<Object> getClasses(String stuNo) {
        Map<String, Object> classes = new HashMap<>();
        try {
            List<Map<String, Object>> classesList = joinClassService.getClassList(stuNo);
            classes.put("classesList", classesList);
            classes.put("stateCode", SUCCESS_CODE);
            return new ResponseEntity<Object>(classes, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            classes.put("stateCode", FAILURE_CODE);
        }
        return new ResponseEntity<Object>("获取失败", HttpStatus.INTERNAL_SERVER_ERROR);
    }

    /**
     * 检测用户是否存在
     *
     * @param uuid
     * @return
     */
    @RequestMapping("/isStudentExists")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> isStudentExists(String uuid) {
        Map<String, Object> classes = new HashMap<>();
        try {
            List<Student> stuInfo = joinClassService.isStudentExists(uuid);
            if (stuInfo.size() != 0) {
                classes.put("result", true);
                classes.put("stuInfo", stuInfo);
                classes.put("stateCode", SUCCESS_CODE);
                return new ResponseEntity<>(classes, HttpStatus.OK);
            } else {
                classes.put("result", false);
                classes.put("stuInfo", "");
                classes.put("stateCode", FAILURE_CODE);
                return new ResponseEntity<>(classes, HttpStatus.INTERNAL_SERVER_ERROR);
            }
        } catch (Exception e) {
            e.printStackTrace();
            classes.put("result", false);
            classes.put("stateCode", FAILURE_CODE);
            return new ResponseEntity<>(classes, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @RequestMapping("/isClassesExists")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> isClassesExists(String code) {
        Map<String, Object> classes = new HashMap<>();
        try {
            List<Classes> classesList = joinClassService.isClassesExists(code);
            if (classesList.size() != 0) {
                classes.put("result", true);
                classes.put("classesList", classesList);
                classes.put("stateCode", SUCCESS_CODE);
                return new ResponseEntity<>(classes, HttpStatus.OK);
            } else {
                classes.put("result", false);
                classes.put("classesList", "");
                classes.put("stateCode", FAILURE_CODE);
                return new ResponseEntity<>(classes, HttpStatus.INTERNAL_SERVER_ERROR);
            }
        } catch (Exception e) {
            e.printStackTrace();
            classes.put("result", false);
            classes.put("stateCode", FAILURE_CODE);
            return new ResponseEntity<>(classes, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @RequestMapping("/studentRegister")
    @ResponseBody
    public ResponseEntity studentRegister(Student student) {
        Map<String, Object> classes = new HashMap<>();
        try {
            Map<String, String> result = joinClassService.studentRegister(student);
            classes.put("result", result.get("msg"));
            classes.put("stateCode", result.get("state"));
            return new ResponseEntity(classes, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            classes.put("result", false);
            classes.put("stateCode", FAILURE_CODE);
        }
        return new ResponseEntity("注册失败", HttpStatus.INTERNAL_SERVER_ERROR);
    }

}
