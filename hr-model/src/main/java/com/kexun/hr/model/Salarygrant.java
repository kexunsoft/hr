package com.kexun.hr.model;

import java.util.Date;

public class Salarygrant {
    private String salarygrantid;

    private String salarystandardid;

    private Integer secondkindid;

    private Integer firstkindId;

    private Integer thirdkindId;

    private Integer humanamount;

    private Double salarystandardsum;

    private Double salarypaidsum;

    private String register;

    private Date registtime;

    private String checker;

    private Date checktime;

    private Integer checkstatus;

    public String getSalarygrantid() {
        return salarygrantid;
    }

    public void setSalarygrantid(String salarygrantid) {
        this.salarygrantid = salarygrantid;
    }

    public String getSalarystandardid() {
        return salarystandardid;
    }

    public void setSalarystandardid(String salarystandardid) {
        this.salarystandardid = salarystandardid == null ? null : salarystandardid.trim();
    }

    public Integer getSecondkindid() {
        return secondkindid;
    }

    public void setSecondkindid(Integer secondkindid) {
        this.secondkindid = secondkindid;
    }

    public Integer getHumanamount() {
        return humanamount;
    }

    public void setHumanamount(Integer humanamount) {
        this.humanamount = humanamount;
    }

    public Double getSalarystandardsum() {
        return salarystandardsum;
    }

    public void setSalarystandardsum(Double salarystandardsum) {
        this.salarystandardsum = salarystandardsum;
    }

    public Double getSalarypaidsum() {
        return salarypaidsum;
    }

    public void setSalarypaidsum(Double salarypaidsum) {
        this.salarypaidsum = salarypaidsum;
    }

    public String getRegister() {
        return register;
    }

    public void setRegister(String register) {
        this.register = register == null ? null : register.trim();
    }

    public Date getRegisttime() {
        return registtime;
    }

    public void setRegisttime(Date registtime) {
        this.registtime = registtime;
    }

    public String getChecker() {
        return checker;
    }

    public void setChecker(String checker) {
        this.checker = checker == null ? null : checker.trim();
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

    public Integer getFirstkindId() {
        return firstkindId;
    }

    public void setFirstkindId(Integer firstkindId) {
        this.firstkindId = firstkindId;
    }

    public Integer getThirdkindId() {
        return thirdkindId;
    }

    public void setThirdkindId(Integer thirdkindId) {
        this.thirdkindId = thirdkindId;
    }

    @Override
    public String toString() {
        return "Salarygrant{" +
                "salarygrantid='" + salarygrantid + '\'' +
                ", salarystandardid='" + salarystandardid + '\'' +
                ", secondkindid=" + secondkindid +
                ", firstkindId=" + firstkindId +
                ", thirdkindId=" + thirdkindId +
                ", humanamount=" + humanamount +
                ", salarystandardsum=" + salarystandardsum +
                ", salarypaidsum=" + salarypaidsum +
                ", register='" + register + '\'' +
                ", registtime=" + registtime +
                ", checker='" + checker + '\'' +
                ", checktime=" + checktime +
                ", checkstatus=" + checkstatus +
                '}';
    }
}