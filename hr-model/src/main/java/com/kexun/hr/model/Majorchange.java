package com.kexun.hr.model;

import java.util.Date;

public class Majorchange {
    private Integer mchid;

    private Integer thirdkindid;

    private Integer majorid;

    private Integer newthirdkindid;

    private Integer newmajorid;

    private String humanid;

    private String salarystandardid;

    private Double salarysum;

    private String newsalarystandardid;

    private Double newsalarysum;

    private String changereason;

    private String checkreason;

    private Integer checkstatus;

    private String register;

    private String checker;

    private Date registtime;

    private Date checktime;

    public Integer getMchid() {
        return mchid;
    }

    public void setMchid(Integer mchid) {
        this.mchid = mchid;
    }

    public Integer getThirdkindid() {
        return thirdkindid;
    }

    public void setThirdkindid(Integer thirdkindid) {
        this.thirdkindid = thirdkindid;
    }

    public Integer getMajorid() {
        return majorid;
    }

    public void setMajorid(Integer majorid) {
        this.majorid = majorid;
    }

    public Integer getNewthirdkindid() {
        return newthirdkindid;
    }

    public void setNewthirdkindid(Integer newthirdkindid) {
        this.newthirdkindid = newthirdkindid;
    }

    public Integer getNewmajorid() {
        return newmajorid;
    }

    public void setNewmajorid(Integer newmajorid) {
        this.newmajorid = newmajorid;
    }

    public String getHumanid() {
        return humanid;
    }

    public void setHumanid(String humanid) {
        this.humanid = humanid;
    }

    public String getSalarystandardid() {
        return salarystandardid;
    }

    public void setSalarystandardid(String salarystandardid) {
        this.salarystandardid = salarystandardid;
    }

    public Double getSalarysum() {
        return salarysum;
    }

    public void setSalarysum(Double salarysum) {
        this.salarysum = salarysum;
    }

    public String getNewsalarystandardid() {
        return newsalarystandardid;
    }

    public void setNewsalarystandardid(String newsalarystandardid) {
        this.newsalarystandardid = newsalarystandardid;
    }

    public Double getNewsalarysum() {
        return newsalarysum;
    }

    public void setNewsalarysum(Double newsalarysum) {
        this.newsalarysum = newsalarysum;
    }

    public String getChangereason() {
        return changereason;
    }

    public void setChangereason(String changereason) {
        this.changereason = changereason;
    }

    public String getCheckreason() {
        return checkreason;
    }

    public void setCheckreason(String checkreason) {
        this.checkreason = checkreason;
    }

    public Integer getCheckstatus() {
        return checkstatus;
    }

    public void setCheckstatus(Integer checkstatus) {
        this.checkstatus = checkstatus;
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

    @Override
    public String toString() {
        return "Majorchange [mchid=" + mchid + ", thirdkindid=" + thirdkindid + ", majorid=" + majorid
                + ", newthirdkindid=" + newthirdkindid + ", newmajorid=" + newmajorid + ", humanid=" + humanid
                + ", salarystandardid=" + salarystandardid + ", salarysum=" + salarysum + ", newsalarystandardid="
                + newsalarystandardid + ", newsalarysum=" + newsalarysum + ", changereason=" + changereason
                + ", checkreason=" + checkreason + ", checkstatus=" + checkstatus + ", register=" + register
                + ", checker=" + checker + ", registtime=" + registtime + ", checktime=" + checktime + "]";
    }


}