package com.kexun.hr.model;

import java.util.Date;

public class Engageanswer {
    private Integer ansid;

    private String examnumber;

    private Integer resumeid;

    private String humanname;

    private String humanidcard;

    private String majorid;

    private Date testtime;

    private Integer usetime;

    private Integer totalpoint;

    public Integer getAnsid() {
        return ansid;
    }

    public void setAnsid(Integer ansid) {
        this.ansid = ansid;
    }

    public String getExamnumber() {
        return examnumber;
    }

    public void setExamnumber(String examnumber) {
        this.examnumber = examnumber == null ? null : examnumber.trim();
    }

    public Integer getResumeid() {
        return resumeid;
    }

    public void setResumeid(Integer resumeid) {
        this.resumeid = resumeid;
    }

    public String getHumanname() {
        return humanname;
    }

    public void setHumanname(String humanname) {
        this.humanname = humanname == null ? null : humanname.trim();
    }

    public String getHumanidcard() {
        return humanidcard;
    }

    public void setHumanidcard(String humanidcard) {
        this.humanidcard = humanidcard == null ? null : humanidcard.trim();
    }

    public String getMajorid() {
        return majorid;
    }

    public void setMajorid(String majorid) {
        this.majorid = majorid == null ? null : majorid.trim();
    }

    public Date getTesttime() {
        return testtime;
    }

    public void setTesttime(Date testtime) {
        this.testtime = testtime;
    }

    public Integer getUsetime() {
        return usetime;
    }

    public void setUsetime(Integer usetime) {
        this.usetime = usetime;
    }

    public Integer getTotalpoint() {
        return totalpoint;
    }

    public void setTotalpoint(Integer totalpoint) {
        this.totalpoint = totalpoint;
    }
}