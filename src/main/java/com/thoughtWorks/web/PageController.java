package com.thoughtWorks.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping()
public class PageController {

    @RequestMapping("/addTaskQuestions")
    public String text(){
        return "/moduleThree/addTaskQuestions/addTaskQuestions";
    }

    @RequestMapping("/questionsInput")
    public String subjectThree(){
        return "/moduleThree/subjectThree/subjectThree";
    }

    @RequestMapping("/createClass")
    public String createClass(){
        return "/moduleThree/classes/classes";
    }

    @RequestMapping("/qbmanager")
    public String GetManagerPage()
    {
        return "/moduleThree/qbmanager_page";
    }

    @RequestMapping("/homework")
    public String homework() {
        return "moduleThree/homework/homework";
    }

    @RequestMapping("/openTestStudent")
    public String openTestStudent() {
        return "moduleOne/openTestStudent/openTestStudent";
    }

    @RequestMapping("/openTestTeacher")
    public String openTestTeacher() {
        return "moduleThree/openTestTeacher/openTestTeacher";
    }
}
