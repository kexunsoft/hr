package com.kexun.hr.model;

import java.util.Date;

public class Engagesubjects {
    private Integer subid;

    private Integer secondkindid;

    private String register;

    private Date registtime;

    private String derivation;

    private String correctkey;

    private String changer;

    private Date changetime;

    public Integer getSubid() {
        return subid;
    }

    public void setSubid(Integer subid) {
        this.subid = subid;
    }

    public Integer getSecondkindid() {
        return secondkindid;
    }

    public void setSecondkindid(Integer secondkindid) {
        this.secondkindid = secondkindid;
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

    public String getDerivation() {
        return derivation;
    }

    public void setDerivation(String derivation) {
        this.derivation = derivation == null ? null : derivation.trim();
    }

    public String getCorrectkey() {
        return correctkey;
    }

    public void setCorrectkey(String correctkey) {
        this.correctkey = correctkey == null ? null : correctkey.trim();
    }

    public String getChanger() {
        return changer;
    }

    public void setChanger(String changer) {
        this.changer = changer == null ? null : changer.trim();
    }

    public Date getChangetime() {
        return changetime;
    }

    public void setChangetime(Date changetime) {
        this.changetime = changetime;
    }
}