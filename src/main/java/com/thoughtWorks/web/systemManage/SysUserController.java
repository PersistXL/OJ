package com.thoughtWorks.web.systemManage;

import com.thoughtWorks.dto.Result;
import com.thoughtWorks.entity.Teacher;
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
    public ResponseEntity<Object> list(PageUtil pageUtil) {
        try {
            sysUserService.getList(pageUtil);

            return new ResponseEntity<Object>(pageUtil, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ResponseEntity<Object>("", HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @RequestMapping("/add")
    @ResponseBody
    public Result add(Teacher teacher) {
        try {
            String result = sysUserService.add(teacher);

            return Result.success("",result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure("", "添加失败");
    }


    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(String no) {
        try {
            sysUserService.delete(no);
            return Result.success("","删除成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure("", "删除失败");
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(Teacher teacher) {
        try {

            System.out.println("00000000000000" + teacher);

            String result = sysUserService.update(teacher);

            return Result.success("",result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure("", "更新失败");
    }

}
