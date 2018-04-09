package com.thoughtWorks.entity;

/**
 * @author Persist
 */
public class WrongTitle {
    private String subjectId;
    private String studentId;
    private String wrongOptions;

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

    public String getWrongOptions() {
        return wrongOptions;
    }

    public void setWrongOptions(String wrongOptions) {
        this.wrongOptions = wrongOptions;
    }

    @Override
    public String toString() {
        return "WrongTitle{" +
                "subjectId='" + subjectId + '\'' +
                ", studentId='" + studentId + '\'' +
                ", wrongOptions='" + wrongOptions + '\'' +
                '}';
    }
}
