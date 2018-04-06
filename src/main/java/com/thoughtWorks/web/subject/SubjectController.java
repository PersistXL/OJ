package com.thoughtWorks.web.subject;

import com.thoughtWorks.dao.SubjectDao;
import com.thoughtWorks.dto.Result;
import com.thoughtWorks.entity.Subject;
import com.thoughtWorks.util.Constant;
import com.thoughtWorks.util.ExcelUtil;
import com.thoughtWorks.util.PageUtil;
import com.thoughtWorks.web.ImgUtil;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

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

    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    @ResponseBody
    public Result upLoadFile(HttpServletRequest request) {
        String path ="";
        try {
            // @RequestParam("file") MultipartFile file,
            CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                    request.getSession().getServletContext());
            // 判断 request 是否有文件上传,即多部分请求
            if (multipartResolver.isMultipart(request)) {
                // 转换成多部分request
                MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
                // 取得request中的所有文件名
                Iterator<String> iter = multiRequest.getFileNames();
                while (iter.hasNext()) {
                    // 取得上传文件
                    MultipartFile f = multiRequest.getFile(iter.next());
                    if (f != null) {
                        // 取得当前上传文件的文件名称
                        String myFileName = f.getOriginalFilename();
                        // 如果名称不为“”,说明该文件存在，否则说明该文件不存在
                        if (myFileName.trim() != "") {
                            // 定义上传路径
                             path = request.getServletContext().getRealPath("/excel") + Constant.USER_FILE_PATH
                                    + myFileName;
                            File localFile = new File(path);
                            f.transferTo(localFile);
                        }
                    }
                }
            }
            System.out.println(path);
            ExcelUtil excelUtil = new ExcelUtil();
            List<Map<String,String>> list =  excelUtil.file(path);
            //遍历解析出来的list
            for (Map<String,String> map : list) {
                for (Map.Entry<String,String> entry : map.entrySet()) {
                    System.out.print(entry.getKey()+":"+entry.getValue()+",");
                }
                System.out.println();
            }

            return Result.failure(path, Constant.UPLOAD_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.UPLOAD_FAILURE);
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
    public Map<String, Object> selectSubject(PageUtil page, Subject subject) {
        Map<String, Object> data = new HashMap<>();
        try {
            Map<String, Object> map = new HashMap<>();
            map.put("start", (page.getCurrentIndex() - 1) * page.getPageSize());
            map.put("end", page.getPageSize());
            map.put("subject", subject);
            data.put("page", page);
            page.setTotalSize(subjectDao.querySubjectTotalCount(subject));
            data.put("data", subjectDao.selectSubject(map));
            data.put("msg", Constant.SEARCH_SUCCESS);

        } catch (Exception e) {
            data.put("msg", Constant.SEARCH_FAILURE);
            e.printStackTrace();
        }

        return data;
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
