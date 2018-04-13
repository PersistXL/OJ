package com.thoughtWorks.entity;

/**
 * Created by 马欢欢 on 2018/4/12.
 */
public class TestpaperCursor {
    private Integer id ;
    private int teacherId;
    private int subjectId;

    public int getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    public int getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
    }
}
