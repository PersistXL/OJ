package com.thoughtWorks.web.studentClass;

import com.thoughtWorks.service.JoinClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/getClass")
public class GetClassController {
    @Autowired
    private JoinClassService joinClassService;


}
