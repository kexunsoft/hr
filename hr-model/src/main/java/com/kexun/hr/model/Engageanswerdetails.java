package com.kexun.hr.model;

public class Engageanswerdetails {
    private Integer andid;

    private Integer ansid;

    private String subjectid;

    private String answer;

    public Integer getAndid() {
        return andid;
    }

    public void setAndid(Integer andid) {
        this.andid = andid;
    }

    public Integer getAnsid() {
        return ansid;
    }

    public void setAnsid(Integer ansid) {
        this.ansid = ansid;
    }

    public String getSubjectid() {
        return subjectid;
    }

    public void setSubjectid(String subjectid) {
        this.subjectid = subjectid == null ? null : subjectid.trim();
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer == null ? null : answer.trim();
    }
}