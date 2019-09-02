package com.kexun.hr.model;

public class Configmajor {
    private Integer majorid;

    private String majorname;

    private String majorkindid;

    private Integer testamount;

    public Integer getMajorid() {
        return majorid;
    }

    public void setMajorid(Integer majorid) {
        this.majorid = majorid;
    }

    public String getMajorname() {
        return majorname;
    }

    public void setMajorname(String majorname) {
        this.majorname = majorname == null ? null : majorname.trim();
    }

    public String getMajorkindid() {
        return majorkindid;
    }

    public void setMajorkindid(String majorkindid) {
        this.majorkindid = majorkindid == null ? null : majorkindid.trim();
    }

    public Integer getTestamount() {
        return testamount;
    }

    public void setTestamount(Integer testamount) {
        this.testamount = testamount;
    }

	@Override
	public String toString() {
		return "Configmajor [majorid=" + majorid + ", majorname=" + majorname + ", majorkindid=" + majorkindid
				+ ", testamount=" + testamount + "]";
	}
    
    
}