package com.kexun.hr.model;

public class Engageexamdetails {
    private Integer exdid;

    private String examnumber;

    private Integer secondkindid;

    private Integer questionamount;

    public Integer getExdid() {
        return exdid;
    }

    public void setExdid(Integer exdid) {
        this.exdid = exdid;
    }

    public String getExamnumber() {
        return examnumber;
    }

    public void setExamnumber(String examnumber) {
        this.examnumber = examnumber == null ? null : examnumber.trim();
    }

    public Integer getSecondkindid() {
        return secondkindid;
    }

    public void setSecondkindid(Integer secondkindid) {
        this.secondkindid = secondkindid;
    }

    public Integer getQuestionamount() {
        return questionamount;
    }

    public void setQuestionamount(Integer questionamount) {
        this.questionamount = questionamount;
    }
}