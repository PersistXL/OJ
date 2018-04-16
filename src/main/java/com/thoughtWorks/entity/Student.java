package com.thoughtWorks.entity;

public class Student {
    private Integer id;
    private String no;
    private String name;
    private String gender;
    private String phone;
    private String classesId;

    public Student() {
    }

    public Student(Integer id, String no, String name, String gender, String phone, String classesId) {
        this.id = id;
        this.no = no;
        this.name = name;
        this.gender = gender;
        this.phone = phone;
        this.classesId = classesId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getClassesId() {
        return classesId;
    }

    public void setClassesId(String classesId) {
        this.classesId = classesId;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", no='" + no + '\'' +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", phone='" + phone + '\'' +
                ", classesId='" + classesId + '\'' +
                '}';
    }
}
