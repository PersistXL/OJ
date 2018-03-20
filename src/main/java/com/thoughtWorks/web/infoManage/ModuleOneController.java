package com.thoughtWorks.web.infoManage;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * @author ubuntu
 */
@Component
@RequestMapping("/moduleOne")
public class ModuleOneController {

    @RequestMapping()
    public String index() {
        return "moduleOne/moduleOne/moduleOne";
    }
}
