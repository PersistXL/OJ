package com.thoughtWorks.web.testpaper;

import com.thoughtWorks.dao.SysUserDao;
import com.thoughtWorks.dao.TestpaperDao;
import com.thoughtWorks.dto.Result;
import com.thoughtWorks.entity.ActiveUser;
import com.thoughtWorks.entity.Classes;
import com.thoughtWorks.entity.Testpaper;
import com.thoughtWorks.entity.TestpaperCursor;
import com.thoughtWorks.util.Constant;
import com.thoughtWorks.util.DataUtil;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

/**
 * Created by 马欢欢 on 2018/4/12.
 */
@RestController
@RequestMapping("Testpaper")
public class TestpaperController {

    @Autowired
    TestpaperDao testpaperDao;
    @Autowired
    SysUserDao sysUserDao;
    @RequestMapping("selectTestpaperCursor")
    public Result selectTestpaperCursor() {
        try {
            String username = ((ActiveUser) SecurityUtils.getSubject().getPrincipal()).getUserName();
            return Result.success(testpaperDao.selectTestpaperCursor(testpaperDao.selectIdByName(username)), Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.SEARCH_FAILURE);
    }

    @RequestMapping("selectTestpaperCursorOfChapter")
    public Result selectTestpaperCursorOfChapter(int questionBankId) {
        try {

            List<String> data = testpaperDao.selectTestpaperCursorOfChapter(questionBankId);

            return Result.success(data, Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.SEARCH_FAILURE);
    }

    @RequestMapping("deleteTestpaperCursor")
    public Result deleteTestpaperCursor(int id) {
        try {
            testpaperDao.deleteTestpaperCursor(id);
            return Result.success(null, Constant.DELETE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.DELETE_FAILURE);
    }

    @RequestMapping("addTestpaperCursor")
    public Result addTestpaperCursor(TestpaperCursor testpaperCursor) {
        try {
            String username = ((ActiveUser) SecurityUtils.getSubject().getPrincipal()).getUserName();
            testpaperCursor.setTeacherId(testpaperDao.selectIdByName(username));
            testpaperDao.addTestpaperCursor(testpaperCursor);
            return Result.success(null, Constant.ADD_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.ADD_FAILURE);
    }

    @RequestMapping("addTestpaperCursorToTestpaper")
    public Result addTestpaperCursorToTestpaper(Testpaper testpaper) {
        try {
            String username = ((ActiveUser) SecurityUtils.getSubject().getPrincipal()).getUserName();
            int id = testpaperDao.selectIdByName(username);
            testpaper.setTeacherId(id);

            String start_time = DataUtil.outDate();
            testpaper.setStartTime(start_time);
            testpaperDao.addTestpaperCursorToTestpaper(testpaper);
            testpaperDao.deleteTestpaperCursorByName(id);
            return Result.success(null, Constant.ADD_QUESTION_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.ADD_QUESTION_FAILURE);
    }

    @RequestMapping("addTestpaperCursorToTestpaperOpen")
    public Result addTestpaperCursorToTestpaperOpen(Testpaper testpaper) {
        try {
            String username = ((ActiveUser) SecurityUtils.getSubject().getPrincipal()).getUserName();
            int id = testpaperDao.selectIdByName(username);
            testpaper.setTeacherId(id);

            String start_time = DataUtil.outDate();
            testpaper.setStartTime(start_time);
            System.out.println(testpaper.getSubjectId());
            testpaperDao.addTestpaperCursorToTestpaperOpen(testpaper);
            testpaperDao.deleteTestpaperCursorByName(id);
            return Result.success(null, Constant.ADD_QUESTION_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.ADD_QUESTION_FAILURE);
    }

    @RequestMapping("updateTestpaperCursorToTestpaper")
    public Result updateTestpaperCursorToTestpaper(Testpaper testpaper) {
        try {
            String username = ((ActiveUser) SecurityUtils.getSubject().getPrincipal()).getUserName();
            int id = testpaperDao.selectIdByName(username);
            testpaper.setTeacherId(id);
            String start_time = DataUtil.outDate();
            testpaper.setStartTime(start_time);
            testpaperDao.updateTestpaperCursorToTestpaper(testpaper);
            testpaperDao.deleteTestpaperCursorByName(id);
            return Result.success(null, Constant.UPDATE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.UPDATE_FAILURE);
    }

    @RequestMapping("deleteTestpaper")
    public Result deleteTestpaper() {
        try {
            String username = ((ActiveUser) SecurityUtils.getSubject().getPrincipal()).getUserName();
            int id = testpaperDao.selectIdByName(username);

            testpaperDao.deleteTestpaperCursorByName(id);
            return Result.success(null, Constant.DELETE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.DELETE_FAILURE);
    }

    @RequestMapping("selectClasses")
    public Result selectClasses() {
        try {
            String username = ((ActiveUser) SecurityUtils.getSubject().getPrincipal()).getUserName();
            int id = testpaperDao.selectIdByName(username);
            return Result.success(testpaperDao.selectClasses(id), Constant.DELETE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.DELETE_FAILURE);
    }

    @RequestMapping("addClasses")
    public Result addClasses(Classes classes) {
        try {
            String username = ((ActiveUser) SecurityUtils.getSubject().getPrincipal()).getUserName();
            int id = testpaperDao.selectIdByName(username);
            classes.setTeacherId(String.valueOf(id));
            testpaperDao.addClasses(classes);
            int classes_id = testpaperDao.findClassesId(classes.getCode());
            int s = Integer.parseInt(classes.getTeacherId());
            testpaperDao.insertTeacherClasses(classes_id, Integer.parseInt(classes.getTeacherId()));
            return Result.success(null, Constant.ADD_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.ADD_FAILURE);
    }

    @RequestMapping("addcodeEndTime")
    public Result addcodeEndTime(Classes classes) {
        try {
            testpaperDao.addcodeEndTime(classes);
            return Result.success(null, Constant.ADD_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.ADD_FAILURE);
    }

    @RequestMapping("deleteClassByTeacherId")
    public Result deleteClassByTeacherId(int id) {
        try {
            testpaperDao.deleteClassByTeacherId(id);
            testpaperDao.deleteStudentByClassByTeacherId(id);
            return Result.success(null, Constant.DELETE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.DELETE_FAILURE);
    }

    @RequestMapping("deleteClassesOfStudentInfo")
    public Result deleteClassesOfStudentInfo(int id) {
        try {
            testpaperDao.deleteClassesOfStudentInfo(id);
            return Result.success(null, Constant.DELETE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.DELETE_FAILURE);
    }

    @RequestMapping("selectClassesByIdToStudents")
    public Result selectClassesByIdToStudents(int id) {
        try {
            return Result.success(testpaperDao.selectClassesByIdToStudents(id), Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.SEARCH_FAILURE);
    }

    @RequestMapping("selectTestpaperNameIs")
    public Result selectTestpaperNameIs(Testpaper testpaper) {
        try {
            boolean isHave = true;
            long count = testpaperDao.selectTestpaperNameIs(testpaper);
            if (count > 0) {
                isHave = false;
            }
            return Result.success(isHave, Constant.TESTPAPER_IS_FALSE);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.TESTPAPER_IS_TRUE);
    }

    @RequestMapping("/addTestpaperCursorAll")
    public Result addTestpaperCursorAll(String subjectId){
        try {
            String username = ((ActiveUser) SecurityUtils.getSubject().getPrincipal()).getUserName();
            int teacherId = testpaperDao.selectIdByName(username);
            String[] subject = subjectId.split(",");
            for (int i = 0;i < subject.length;i++) {
                testpaperDao.addTestpaperCursorAll(subject[i],teacherId);
            }
            return Result.success(null, Constant.ADD_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.ADDALL_FAILURE);
    }
    @RequestMapping("/updateTestpaperCursor")
    public Result updateTestpaperCursor(String subjectId){
        try {
            String username = ((ActiveUser) SecurityUtils.getSubject().getPrincipal()).getUserName();
            int teacherId = testpaperDao.selectIdByName(username);
            String[] subject = subjectId.split("_");
            for (int i = 0;i < subject.length;i++) {
                testpaperDao.addTestpaperCursorAll(subject[i],teacherId);
            }
            return Result.success(null, Constant.READQUESTIONS_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.READQUESTIONS_FAILURE);
    }
    @RequestMapping("/findOpenTest")
    public Result findOpenTest(){
        try {
            String username = ((ActiveUser) SecurityUtils.getSubject().getPrincipal()).getUserName();
            int studentId = sysUserDao.selectIdByName(username);
            List<Map<String, Object>> data = new ArrayList<>();
            List<Map<String,Object>> list = testpaperDao.findOpenTest();
            Iterator<Map<String,Object>> iterator = list.iterator();
            while (iterator.hasNext()) {
                Map<String, Object> map = new HashMap<>();
                Map<String, Object> value = iterator.next();
                String num = (String) value.get("subject_id");
                String[] no = num.split("_");
                String teacherName = sysUserDao.selectTeacherName(value.get("teacher_id"));
                String number = testpaperDao.findOpenTestNum(value.get("id"),studentId);
                map.put("name", value.get("name"));
                map.put("num", no.length);
                map.put("teacherName", teacherName);
                map.put("subject_id", value.get("subject_id"));
                map.put("id", value.get("id"));
                map.put("trueNum", number);
                data.add(map);
            }
            return Result.success(data,Constant.SEARCH_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.failure(null, Constant.SEARCH_FAILURE);
    }
}
