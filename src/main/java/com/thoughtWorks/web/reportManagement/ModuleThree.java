package com.thoughtWorks.web.reportManagement;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author ubuntu
 * @date 2017/11/28
 */
@Component
@RequestMapping("/moduleThree")
public class ModuleThree {
    @RequestMapping
    public String index() {
        return "/moduleThree/moduleThree/moduleThree";
    }
}
