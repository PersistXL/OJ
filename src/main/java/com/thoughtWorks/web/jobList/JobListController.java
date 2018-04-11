package com.thoughtWorks.web.jobList;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author persistXL
 * @data 2018/4/10 10:25
 */
@Component
@RequestMapping("/jobList")
public class JobListController {
    @RequestMapping()
    public String index(){
        return "moduleThree/jobList/jobList";
    }
}
