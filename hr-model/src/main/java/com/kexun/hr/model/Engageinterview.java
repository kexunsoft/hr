package com.kexun.hr.model;

import java.util.Date;

public class Engageinterview {
    private Integer einid;

    private String humanname;

    private Integer humanmajorid;

    private String imagedegree;

    private String nativelanguagedegree;

    private String foreignlanguagedegree;

    private String responsespeeddegree;

    private String eqdegree;

    private String iqdegree;

    private String multiqualitydegree;

    private String register;

    private String checker;

    private Date registetime;

    private Date checktime;

    private Integer resumeid;

    private String result;

    private String interviewcomment;

    private String checkcomment;

    private Integer checkstatus;

    public Integer getEinid() {
        return einid;
    }

    public void setEinid(Integer einid) {
        this.einid = einid;
    }

    public String getHumanname() {
        return humanname;
    }

    public void setHumanname(String humanname) {
        this.humanname = humanname == null ? null : humanname.trim();
    }

    public Integer getHumanmajorid() {
        return humanmajorid;
    }

    public void setHumanmajorid(Integer humanmajorid) {
        this.humanmajorid = humanmajorid;
    }

    public String getImagedegree() {
        return imagedegree;
    }

    public void setImagedegree(String imagedegree) {
        this.imagedegree = imagedegree == null ? null : imagedegree.trim();
    }

    public String getNativelanguagedegree() {
        return nativelanguagedegree;
    }

    public void setNativelanguagedegree(String nativelanguagedegree) {
        this.nativelanguagedegree = nativelanguagedegree == null ? null : nativelanguagedegree.trim();
    }

    public String getForeignlanguagedegree() {
        return foreignlanguagedegree;
    }

    public void setForeignlanguagedegree(String foreignlanguagedegree) {
        this.foreignlanguagedegree = foreignlanguagedegree == null ? null : foreignlanguagedegree.trim();
    }

    public String getResponsespeeddegree() {
        return responsespeeddegree;
    }

    public void setResponsespeeddegree(String responsespeeddegree) {
        this.responsespeeddegree = responsespeeddegree == null ? null : responsespeeddegree.trim();
    }

    public String getEqdegree() {
        return eqdegree;
    }

    public void setEqdegree(String eqdegree) {
        this.eqdegree = eqdegree == null ? null : eqdegree.trim();
    }

    public String getIqdegree() {
        return iqdegree;
    }

    public void setIqdegree(String iqdegree) {
        this.iqdegree = iqdegree == null ? null : iqdegree.trim();
    }

    public String getMultiqualitydegree() {
        return multiqualitydegree;
    }

    public void setMultiqualitydegree(String multiqualitydegree) {
        this.multiqualitydegree = multiqualitydegree == null ? null : multiqualitydegree.trim();
    }

    public String getRegister() {
        return register;
    }

    public void setRegister(String register) {
        this.register = register == null ? null : register.trim();
    }

    public String getChecker() {
        return checker;
    }

    public void setChecker(String checker) {
        this.checker = checker == null ? null : checker.trim();
    }

    public Date getRegistetime() {
        return registetime;
    }

    public void setRegistetime(Date registetime) {
        this.registetime = registetime;
    }

    public Date getChecktime() {
        return checktime;
    }

    public void setChecktime(Date checktime) {
        this.checktime = checktime;
    }

    public Integer getResumeid() {
        return resumeid;
    }

    public void setResumeid(Integer resumeid) {
        this.resumeid = resumeid;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result == null ? null : result.trim();
    }

    public String getInterviewcomment() {
        return interviewcomment;
    }

    public void setInterviewcomment(String interviewcomment) {
        this.interviewcomment = interviewcomment == null ? null : interviewcomment.trim();
    }

    public String getCheckcomment() {
        return checkcomment;
    }

    public void setCheckcomment(String checkcomment) {
        this.checkcomment = checkcomment == null ? null : checkcomment.trim();
    }

    public Integer getCheckstatus() {
        return checkstatus;
    }

    public void setCheckstatus(Integer checkstatus) {
        this.checkstatus = checkstatus;
    }
}