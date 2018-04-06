package com.thoughtWorks.entity;

/**
 * @author Persist
 */
public class WrongTitle {
    private String subjectId;
    private String studentId;

    public String getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(String subjectId) {
        this.subjectId = subjectId;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    @Override
    public String toString() {
        return "WrongTitle{" +
                "subjectId='" + subjectId + '\'' +
                ", studentId='" + studentId + '\'' +
                '}';
    }
}
