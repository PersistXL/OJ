package com.thoughtWorks.entity;
import java.util.ArrayList;
import com.thoughtWorks.entity.wrongAnswer;


/**
 * @author Persist
 */
public class StudentTestpaper {
    private int id;
    private String uuid;


    private int studentId;
    private int testpaperId;
    private double testpaperStudentScore;
    private String submissionTime;

    ArrayList<wrongAnswer> data;

    private String wrongQuestionIds;
    private String wrongAnswers;

    private int classesId;

    public int getClassesId() {
        return classesId;
    }

    public void setClassesId(int classesId) {
        this.classesId = classesId;
    }

    @Override
    public String toString() {
        return "StudentTestpaper{" +
                "id=" + id +
                ", uuid='" + uuid + '\'' +
                ", studentId=" + studentId +
                ", testpaperId=" + testpaperId +
                ", testpaperStudentScore=" + testpaperStudentScore +
                ", submissionTime='" + submissionTime + '\'' +
                ", data=" + data +
                ", wrongQuestionIds='" + wrongQuestionIds + '\'' +
                ", wrongAnswers='" + wrongAnswers + '\'' +
                ", classesId=" + classesId +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String no) {
        this.uuid = no;
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

    public ArrayList<wrongAnswer> getData() {
        return data;
    }

    public void setData(ArrayList<wrongAnswer> data) {
        this.data = data;
    }

    public String getWrongQuestionIds() {
        return wrongQuestionIds;
    }

    public void setWrongQuestionIds(String wrongQuestionIds) {
        this.wrongQuestionIds = wrongQuestionIds;
    }

    public String getWrongAnswers() {
        return wrongAnswers;
    }

    public void setWrongAnswers(String wrongAnswers) {
        this.wrongAnswers = wrongAnswers;
    }

}
