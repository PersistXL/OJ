package com.thoughtWorks.entity;

/**
 * Created by 马欢欢 on 2018/4/12.
 */
public class TestpaperCursor {
    private Integer id ;
    private String teacherName;
    private int subjectId;

    public int getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public int getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
    }
}
