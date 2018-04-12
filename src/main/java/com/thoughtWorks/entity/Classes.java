package com.thoughtWorks.entity;

public class Classes {
    private Integer id;
    private String name;
    private String teacherId;
    private String departmentId;
    private String studentId;

    public Classes() {
    }

    public Classes(Integer id, String name, String teacherId, String departmentId, String studentId) {
        this.id = id;
        this.name = name;
        this.teacherId = teacherId;
        this.departmentId = departmentId;
        this.studentId = studentId;
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

    public String getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }
}
