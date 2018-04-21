package com.thoughtWorks.entity;

public class Testpaper {
    private String subjectId;
    private int testPaperId;
    private int classesId;
    private int teacherId;
    private String startTime;
    private String name;
    private double score;
    private String closeTime;
    private int day;

    public int getTestPaperId() {
        return testPaperId;
    }

    public void setTestPaperId(int testPaperId) {
        this.testPaperId = testPaperId;
    }

    public String getCloseTime() {
        return closeTime;
    }

    public void setCloseTime(String closeTime) {
        this.closeTime = closeTime;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public String getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(String subjectId) {
        this.subjectId = subjectId;
    }

    public int getClassesId() {
        return classesId;
    }

    public void setClassesId(int classesId) {
        this.classesId = classesId;
    }

    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }
}
