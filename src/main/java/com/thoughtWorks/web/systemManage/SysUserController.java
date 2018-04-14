package com.thoughtWorks.web.systemManage;

import com.thoughtWorks.util.PageUtil;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/sysUser")
public class SysUserController {

    @RequestMapping()
    public String index() {
        return "systemManage/user/list";
    }

    @RequestMapping("/add")
    @ResponseBody
    public ResponseEntity add(PageUtil pageUtil) {

        return new ResponseEntity(pageUtil, HttpStatus.OK);
    }

}
