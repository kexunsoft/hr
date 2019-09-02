package com.kexun.hr.model;

import java.util.Date;

public class Engageexam {
    private Integer examnumber;

    private Integer majorid;

    private String register;

    private Date registtime;

    private Integer limitetime;

    public Integer getExamnumber() {
        return examnumber;
    }

    public void setExamnumber(Integer examnumber) {
        this.examnumber = examnumber;
    }

    public Integer getMajorid() {
        return majorid;
    }

    public void setMajorid(Integer majorid) {
        this.majorid = majorid;
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

    public Integer getLimitetime() {
        return limitetime;
    }

    public void setLimitetime(Integer limitetime) {
        this.limitetime = limitetime;
    }
}