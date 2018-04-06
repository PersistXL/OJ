package com.thoughtWorks.entity;

/**
 * @author Persist
 */
public class StudentTestpaper {
    private int id;
    private int studentId;
    private int testpaperId;
    private double testpaperStudentScore;
    private String submissionTime;

    @Override
    public String toString() {
        return "StudentTestpaper{" +
                "id=" + id +
                ", studentId=" + studentId +
                ", testpaperId=" + testpaperId +
                ", testpaperStudentScore=" + testpaperStudentScore +
                ", submissionTime='" + submissionTime + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public int getTestpaperId() {
        return testpaperId;
    }

    public void setTestpaperId(int testpaperId) {
        this.testpaperId = testpaperId;
    }

    public double getTestpaperStudentScore() {
        return testpaperStudentScore;
    }

    public void setTestpaperStudentScore(double testpaperStudentScore) {
        this.testpaperStudentScore = testpaperStudentScore;
    }

    public String getSubmissionTime() {
        return submissionTime;
    }

    public void setSubmissionTime(String submissionTime) {
        this.submissionTime = submissionTime;
    }
}
