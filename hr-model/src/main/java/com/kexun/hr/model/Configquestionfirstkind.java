package com.kexun.hr.model;

public class Configquestionfirstkind {
    private Integer firstkindid;

    private String firstkindname;

    private String firstkindstatus;

    public Integer getFirstkindid() {
        return firstkindid;
    }

    public void setFirstkindid(Integer firstkindid) {
        this.firstkindid = firstkindid;
    }

    public String getFirstkindname() {
        return firstkindname;
    }

    public void setFirstkindname(String firstkindname) {
        this.firstkindname = firstkindname == null ? null : firstkindname.trim();
    }

    public String getFirstkindstatus() {
        return firstkindstatus;
    }

    public void setFirstkindstatus(String firstkindstatus) {
        this.firstkindstatus = firstkindstatus == null ? null : firstkindstatus.trim();
    }
}