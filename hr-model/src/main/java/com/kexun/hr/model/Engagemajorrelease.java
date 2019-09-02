package com.kexun.hr.model;

import java.util.Date;

public class Engagemajorrelease {
    private Integer mreid;

    private Integer thirdkindid;

    private Integer majorid;

    private Integer humanamount;

    private String engagetype;

    private Date deadline;

    private String register;

    private String changer;

    private Date registtime;

    private Date changetime;

    private String majordescribe;

    private String engagerequired;

    public Integer getMreid() {
        return mreid;
    }

    public void setMreid(Integer mreid) {
        this.mreid = mreid;
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

    public Integer getHumanamount() {
        return humanamount;
    }

    public void setHumanamount(Integer humanamount) {
        this.humanamount = humanamount;
    }

    public String getEngagetype() {
        return engagetype;
    }

    public void setEngagetype(String engagetype) {
        this.engagetype = engagetype;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public String getRegister() {
        return register;
    }

    public void setRegister(String register) {
        this.register = register;
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

    public Date getChangetime() {
        return changetime;
    }

    public void setChangetime(Date changetime) {
        this.changetime = changetime;
    }

    public String getMajordescribe() {
        return majordescribe;
    }

    public void setMajordescribe(String majordescribe) {
        this.majordescribe = majordescribe;
    }

    public String getEngagerequired() {
        return engagerequired;
    }

    public void setEngagerequired(String engagerequired) {
        this.engagerequired = engagerequired;
    }

    @Override
    public String toString() {
        return "Engagemajorrelease{" +
                "mreid=" + mreid +
                ", thirdkindid=" + thirdkindid +
                ", majorid=" + majorid +
                ", humanamount=" + humanamount +
                ", engagetype='" + engagetype + '\'' +
                ", deadline=" + deadline +
                ", register='" + register + '\'' +
                ", changer='" + changer + '\'' +
                ", registtime=" + registtime +
                ", changetime=" + changetime +
                ", majordescribe='" + majordescribe + '\'' +
                ", engagerequired='" + engagerequired + '\'' +
                '}';
    }
}