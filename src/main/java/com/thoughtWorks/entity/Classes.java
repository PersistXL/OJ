package com.thoughtWorks.entity;


import java.util.Date;

public class Classes {
    private Integer id;
    private String name;
    private String teacherId;
    private String code;
    private Date codeEndTime;
    private String time;
    private String codeTime;
    private String teaName;

    public String getTeaName() {
        return teaName;
    }

    public void setTeaName(String teaName) {
        this.teaName = teaName;
    }

    public Classes(Integer id, String name, String teacherId, String code, Date codeEndTime, String time) {
        this.id = id;
        this.name = name;
        this.teacherId = teacherId;
        this.code = code;
        this.codeEndTime = codeEndTime;
        this.time = time;
    }

    public Date getCodeEndTime() {
        return codeEndTime;
    }

    public void setCodeEndTime(Date codeEndTime) {
        this.codeEndTime = codeEndTime;
    }

    public String getCodeTime() {
        return codeTime;
    }

    public void setCodeTime(String codeTime) {
        this.codeTime = codeTime;
    }

    public Classes() {
    }

    public Classes(Integer id, String name, String teacherId) {
        this.id = id;
        this.name = name;
        this.teacherId = teacherId;
    }
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
