package com.kexun.hr.model;

public class Configmajorkind {
    private Integer majorkindid;

    private String majorKindName;

	
	public Integer getMajorkindid() {
		return majorkindid;
	}


	public void setMajorkindid(Integer majorkindid) {
		this.majorkindid = majorkindid;
	}


	public String getMajorKindName() {
		return majorKindName;
	}


	public void setMajorKindName(String majorKindName) {
		this.majorKindName = majorKindName;
	}


	@Override
	public String toString() {
		return "Configmajorkind [majorkindid=" + majorkindid + ", majorKindName=" + majorKindName + "]";
	}

    
   
    
}