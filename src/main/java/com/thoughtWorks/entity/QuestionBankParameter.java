package com.thoughtWorks.entity;

public class QuestionBankParameter {

    // 题库编号
    private int qbid;

    // 题库名称
    private String qbname;

    // 这个列不好用，是为了传输数据的时候占位用的
    private String qbexplain;

    // 题库备注
    private String qbcomment;

    public String getQbname() {
        return qbname;
    }

    public void setQbname(String qbname) {
        this.qbname = qbname;
    }

    public String getQbexplain() {
        return qbexplain;
    }

    public void setQbexplain(String qbexplain) {
        this.qbexplain = qbexplain;
    }

    public String getQbcomment() {
        return qbcomment;
    }

    public void setQbcomment(String qbcomment) {
        this.qbcomment = qbcomment;
    }

    public int getQbid() {
        return qbid;
    }

    public void setQbid(int qbid) {
        this.qbid = qbid;
    }
}
