package com.thoughtWorks.web.subject;

import com.thoughtWorks.dao.SubjectDao;
import com.thoughtWorks.dto.Result;
import com.thoughtWorks.entity.Subject;
import com.thoughtWorks.util.Constant;
import com.thoughtWorks.util.PageUtil;
import com.thoughtWorks.web.ImgUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
@RequestMapping("/subject")
public class SubjectController {
    @Autowired
    SubjectDao subjectDao;

    @RequestMapping("/updateImage")
    @ResponseBody
    public Result updateImage(MultipartFile file, HttpServletRequest request) {
        try {
            String imgPath = ImgUtil.saveImg(file, request.getServletContext().getRealPath("/images") + Constant.USER_IMAGE_PATH);
            String imgName = imgPath.substring(imgPath.lastIndexOf("/"));

            return Result.success(imgName, Constant.UPLOAD_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure(null, Constant.UPDATE_FAILURE);
    }
    @RequestMapping("/addSubject")
    @ResponseBody
    public Result addSubject(Subject subject) {
        try {
            subjectDao.addSubject(subject);
            return Result.success(null, Constant.ADD_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure(null, Constant.ADD_FAILURE);
    }
    @RequestMapping("/selectQuestions")
    @ResponseBody
    public Result selectQuestions() {
        try {
            return Result.success(subjectDao.selectQuestions(), Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure(null, Constant.SEARCH_FAILURE);
    }
    @RequestMapping("/selectSubject")
    @ResponseBody
    public Result selectSubject() {
        try {
            return Result.success(subjectDao.selectSubject(), Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure(null, Constant.SEARCH_FAILURE);
    }
    @RequestMapping("/selectSubjectById")
    @ResponseBody
    public Result selectSubjectById(int id) {
        try {
            return Result.success(subjectDao.selectSubjectById(id), Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure(null, Constant.SEARCH_FAILURE);
    }
    @RequestMapping("/deleteSubjectById")
    @ResponseBody
    public Result deleteSubjectById(int id) {
        try {
            subjectDao.deleteSubjectById(id);
            return Result.success(null, Constant.DELETE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure(null, Constant.DELETE_FAILURE);
    }
    @RequestMapping("/updateSubjectById")
    @ResponseBody
    public Result updateSubjectById(Subject subject) {
        try {
            subjectDao.updateSubjectById(subject);
            return Result.success(null, Constant.DELETE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.failure(null, Constant.DELETE_FAILURE);
    }
}
