package com.kexun.hr.model;

public class Configfilesecondkind {
    private Integer secondkindid;//二级机构ID

    private String secondkindname;//二级机构名称

    private Integer firstkindid;//一级机构ID

    private String secondsalaryid;//薪酬发放责任人编号

    private String secondsaleid;//机构销售责任人编号

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

    public String getSecondsalaryid() {
        return secondsalaryid;
    }

    public void setSecondsalaryid(String secondsalaryid) {
        this.secondsalaryid = secondsalaryid == null ? null : secondsalaryid.trim();
    }

    public String getSecondsaleid() {
        return secondsaleid;
    }

    public void setSecondsaleid(String secondsaleid) {
        this.secondsaleid = secondsaleid == null ? null : secondsaleid.trim();
    }

	@Override
	public String toString() {
		return "Configfilesecondkind [secondkindid=" + secondkindid + ", secondkindname=" + secondkindname
				+ ", firstkindid=" + firstkindid + ", secondsalaryid=" + secondsalaryid + ", secondsaleid="
				+ secondsaleid + "]";
	}
    
    
}