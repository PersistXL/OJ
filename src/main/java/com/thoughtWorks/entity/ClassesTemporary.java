package com.thoughtWorks.entity;

public class ClassesTemporary {
    private Integer id;
    private String classId;
    private String phoneNumber;

    public ClassesTemporary() {
    }

    public ClassesTemporary(Integer id, String classId, String phoneNumber) {
        this.id = id;
        this.classId = classId;
        this.phoneNumber = phoneNumber;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getClassId() {
        return classId;
    }

    public void setClassId(String classId) {
        this.classId = classId;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}
