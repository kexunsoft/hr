package com.kexun.hr.model;

public class Configmajordesignation {
    private Integer cmdid;

    private String cmdname;

    public Integer getCmdid() {
        return cmdid;
    }

    public void setCmdid(Integer cmdid) {
        this.cmdid = cmdid;
    }

    public String getCmdname() {
        return cmdname;
    }

    public void setCmdname(String cmdname) {
        this.cmdname = cmdname == null ? null : cmdname.trim();
    }

	@Override
	public String toString() {
		return "Configmajordesignation [cmdid=" + cmdid + ", cmdname=" + cmdname + "]";
	}
    
}