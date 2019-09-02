package com.kexun.hr.model;

public class Configquestionsecondkind {
    private Integer secondkindid;

    private String secondkindname;

    private Integer firstkindid;

    private Integer secondkindstatus;

    public Integer getSecondkindid() {
        return secondkindid;
    }

    public void setSecondkindid(Integer secondkindid) {
        this.secondkindid = secondkindid;
    }

    public String getSecondkindname() {
        return secondkindname;
    }

    public void setSecondkindname(String secondkindname) {
        this.secondkindname = secondkindname == null ? null : secondkindname.trim();
    }

    public Integer getFirstkindid() {
        return firstkindid;
    }

    public void setFirstkindid(Integer firstkindid) {
        this.firstkindid = firstkindid;
    }

    public Integer getSecondkindstatus() {
        return secondkindstatus;
    }

    public void setSecondkindstatus(Integer secondkindstatus) {
        this.secondkindstatus = secondkindstatus;
    }
}