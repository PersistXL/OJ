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
}
