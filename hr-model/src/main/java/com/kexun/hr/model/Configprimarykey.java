package com.kexun.hr.model;

public class Configprimarykey {
    private Integer prkid;

    private String primarykeytable;

    private String primarykey;

    private String keyname;

    private Integer primarykeystatus;

    public Integer getPrkid() {
        return prkid;
    }

    public void setPrkid(Integer prkid) {
        this.prkid = prkid;
    }

    public String getPrimarykeytable() {
        return primarykeytable;
    }

    public void setPrimarykeytable(String primarykeytable) {
        this.primarykeytable = primarykeytable == null ? null : primarykeytable.trim();
    }

    public String getPrimarykey() {
        return primarykey;
    }

    public void setPrimarykey(String primarykey) {
        this.primarykey = primarykey == null ? null : primarykey.trim();
    }

    public String getKeyname() {
        return keyname;
    }

    public void setKeyname(String keyname) {
        this.keyname = keyname == null ? null : keyname.trim();
    }

    public Integer getPrimarykeystatus() {
        return primarykeystatus;
    }

    public void setPrimarykeystatus(Integer primarykeystatus) {
        this.primarykeystatus = primarykeystatus;
    }
}