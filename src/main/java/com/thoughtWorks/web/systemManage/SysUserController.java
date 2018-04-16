package com.thoughtWorks.web.systemManage;

import com.thoughtWorks.service.SysUserService;
import com.thoughtWorks.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/sysUser")
public class SysUserController {

    @Autowired
    private SysUserService sysUserService;

    @RequestMapping()
    public String index() {
        return "systemManage/user/list";
    }

    @RequestMapping("/list")
    @ResponseBody
    public ResponseEntity list(PageUtil pageUtil) {
        System.out.println(pageUtil);
        PageUtil pageUtils = sysUserService.getList(pageUtil);
        return new ResponseEntity(pageUtil, HttpStatus.OK);
    }

    @RequestMapping("/add")
    @ResponseBody
    public ResponseEntity add(PageUtil pageUtil) {
        System.out.println(pageUtil);
        return new ResponseEntity(pageUtil, HttpStatus.OK);
    }

}
