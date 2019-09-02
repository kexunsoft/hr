package com.kexun.hr.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Salarystandard {
    private String standardid;

    private String standardname;

    private String designer;

    private String register;

    private String checker;

    private String changer;

    private Date registtime;

    private Date checktime;

    private double salarysum;

    private Integer checkstatus;

    private Integer changestatus;

    private String checkcomment;

    private String remark;

    private Date changetime;

    public String getStandardid() {
        return standardid;
    }

    public void setStandardid(String standardid) {
        this.standardid = standardid;
    }

    public String getStandardname() {
        return standardname;
    }

    public void setStandardname(String standardname) {
        this.standardname = standardname;
    }

    public String getDesigner() {
        return designer;
    }

    public void setDesigner(String designer) {
        this.designer = designer;
    }

    public String getRegister() {
        return register;
    }

    public void setRegister(String register) {
        this.register = register;
    }

    public String getChecker() {
        return checker;
    }

    public void setChecker(String checker) {
        this.checker = checker;
    }

    public String getChanger() {
        return changer;
    }

    public void setChanger(String changer) {
        this.changer = changer;
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

    public double getSalarysum() {
        return salarysum;
    }

    public void setSalarysum(double salarysum) {
        this.salarysum = salarysum;
    }

    public Integer getCheckstatus() {
        return checkstatus;
    }

    public void setCheckstatus(Integer checkstatus) {
        this.checkstatus = checkstatus;
    }

    public Integer getChangestatus() {
        return changestatus;
    }

    public void setChangestatus(Integer changestatus) {
        this.changestatus = changestatus;
    }

    public String getCheckcomment() {
        return checkcomment;
    }

    public void setCheckcomment(String checkcomment) {
        this.checkcomment = checkcomment;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getChangetime() {
        return changetime;
    }

    public void setChangetime(Date changetime) {
        this.changetime = changetime;
    }

    @Override
    public String toString() {
        return "Salarystandard{" +
                "standardid=" + standardid +
                ", standardname='" + standardname + '\'' +
                ", designer='" + designer + '\'' +
                ", register='" + register + '\'' +
                ", checker='" + checker + '\'' +
                ", changer='" + changer + '\'' +
                ", registtime=" + registtime +
                ", checktime=" + checktime +
                ", salarysum=" + salarysum +
                ", checkstatus=" + checkstatus +
                ", changestatus=" + changestatus +
                ", checkcomment='" + checkcomment + '\'' +
                ", remark='" + remark + '\'' +
                ", changetime=" + changetime +
                '}';
    }
}