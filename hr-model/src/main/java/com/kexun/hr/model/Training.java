package com.kexun.hr.model;

import java.util.Date;

public class Training {
    private Integer traid;

    private Integer majorkindid;

    private String majorkindname;

    private Integer majorid;

    private String majorname;

    private String humanid;

    private String humanname;

    private String trainingitem;

    private Date trainingtime;

    private Integer traininghour;

    private String trainingdegree;

    private String register;

    private String checker;

    private Date registtime;

    private Date checktime;

    private Integer checkstatus;

    private String remark;

    public Integer getTraid() {
        return traid;
    }

    public void setTraid(Integer traid) {
        this.traid = traid;
    }

    public Integer getMajorkindid() {
        return majorkindid;
    }

    public void setMajorkindid(Integer majorkindid) {
        this.majorkindid = majorkindid;
    }

    public String getMajorkindname() {
        return majorkindname;
    }

    public void setMajorkindname(String majorkindname) {
        this.majorkindname = majorkindname == null ? null : majorkindname.trim();
    }

    public Integer getMajorid() {
        return majorid;
    }

    public void setMajorid(Integer majorid) {
        this.majorid = majorid;
    }

    public String getMajorname() {
        return majorname;
    }

    public void setMajorname(String majorname) {
        this.majorname = majorname == null ? null : majorname.trim();
    }

    public String getHumanid() {
        return humanid;
    }

    public void setHumanid(String humanid) {
        this.humanid = humanid == null ? null : humanid.trim();
    }

    public String getHumanname() {
        return humanname;
    }

    public void setHumanname(String humanname) {
        this.humanname = humanname == null ? null : humanname.trim();
    }

    public String getTrainingitem() {
        return trainingitem;
    }

    public void setTrainingitem(String trainingitem) {
        this.trainingitem = trainingitem == null ? null : trainingitem.trim();
    }

    public Date getTrainingtime() {
        return trainingtime;
    }

    public void setTrainingtime(Date trainingtime) {
        this.trainingtime = trainingtime;
    }

    public Integer getTraininghour() {
        return traininghour;
    }

    public void setTraininghour(Integer traininghour) {
        this.traininghour = traininghour;
    }

    public String getTrainingdegree() {
        return trainingdegree;
    }

    public void setTrainingdegree(String trainingdegree) {
        this.trainingdegree = trainingdegree == null ? null : trainingdegree.trim();
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

    public Date getRegisttime() {
        return registtime;
    }

    public void setRegisttime(Date registtime) {
        this.registtime = registtime;
    }

    public Date getChecktime() {
        return checktime;
    }

    public void setChecktime(Date checktime) {
        this.checktime = checktime;
    }

    public Integer getCheckstatus() {
        return checkstatus;
    }

    public void setCheckstatus(Integer checkstatus) {
        this.checkstatus = checkstatus;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}