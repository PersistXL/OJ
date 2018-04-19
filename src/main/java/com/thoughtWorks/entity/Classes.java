package com.thoughtWorks.entity;

public class Classes {
    private Integer id;
    private String name;
    private String teacherId;
    private String code;
    private String codeEndTime;
    private String time;

    public Classes() {
    }

    public Classes(Integer id, String name, String teacherId) {
        this.id = id;
        this.name = name;
        this.teacherId = teacherId;
    }

    public Classes(Integer id, String name, String teacherId, String code, String codeEndTime, String time) {
        this.id = id;
        this.name = name;
        this.teacherId = teacherId;
        this.code = code;
        this.codeEndTime = codeEndTime;
        this.time = time;
    }

    public String getCodeEndTime() {
        return codeEndTime;
    }

    public void setCodeEndTime(String codeEndTime) {
        this.codeEndTime = codeEndTime;
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
