package com.kexun.hr.model;

public class Configfilethirdkind {
    private Integer thirdkindid;//三级机构编号

    private String thirdkindname;//三级机构名称

    private Integer firstkindid;//一级机构编号

    private Integer secondkindid;//二级机构编号

    private String thirdkindsaleid;//三级机构销售责任人编号

    private String thirdkindisretail;//三级机构是否为零售店

    public Integer getThirdkindid() {
        return thirdkindid;
    }

    public void setThirdkindid(Integer thirdkindid) {
        this.thirdkindid = thirdkindid;
    }

    public String getThirdkindname() {
        return thirdkindname;
    }

    public void setThirdkindname(String thirdkindname) {
        this.thirdkindname = thirdkindname == null ? null : thirdkindname.trim();
    }

    public Integer getFirstkindid() {
        return firstkindid;
    }

    public void setFirstkindid(Integer firstkindid) {
        this.firstkindid = firstkindid;
    }

    public Integer getSecondkindid() {
        return secondkindid;
    }

    public void setSecondkindid(Integer secondkindid) {
        this.secondkindid = secondkindid;
    }

    public String getThirdkindsaleid() {
        return thirdkindsaleid;
    }

    public void setThirdkindsaleid(String thirdkindsaleid) {
        this.thirdkindsaleid = thirdkindsaleid == null ? null : thirdkindsaleid.trim();
    }

    public String getThirdkindisretail() {
        return thirdkindisretail;
    }

    public void setThirdkindisretail(String thirdkindisretail) {
        this.thirdkindisretail = thirdkindisretail == null ? null : thirdkindisretail.trim();
    }

	@Override
	public String toString() {
		return "Configfilethirdkind [thirdkindid=" + thirdkindid + ", thirdkindname=" + thirdkindname + ", firstkindid="
				+ firstkindid + ", secondkindid=" + secondkindid + ", thirdkindsaleid=" + thirdkindsaleid
				+ ", thirdkindisretail=" + thirdkindisretail + "]";
	}
    
    
}