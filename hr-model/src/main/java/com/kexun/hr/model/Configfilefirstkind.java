package com.kexun.hr.model;

public class Configfilefirstkind {
    private Integer firstkindid;

    private String firstkindname;
    
    private String firstKindSalaryId;
    
    private String firstKindSaleId;

    public Integer getFirstkindid() {
        return firstkindid;
    }

    public void setFirstkindid(Integer firstkindid) {
        this.firstkindid = firstkindid;
    }

    
    
    public String getFirstKindSalaryId() {
		return firstKindSalaryId;
	}

	public void setFirstKindSalaryId(String firstKindSalaryId) {
		this.firstKindSalaryId = firstKindSalaryId;
	}

	public String getFirstKindSaleId() {
		return firstKindSaleId;
	}

	public void setFirstKindSaleId(String firstKindSaleId) {
		this.firstKindSaleId = firstKindSaleId;
	}

	public String getFirstkindname() {
        return firstkindname;
    }

    public void setFirstkindname(String firstkindname) {
        this.firstkindname = firstkindname == null ? null : firstkindname.trim();
    }

	public Configfilefirstkind(Integer firstkindid, String firstkindname, String firstKindSalaryId,
			String firstKindSaleId) {
		super();
		this.firstkindid = firstkindid;
		this.firstkindname = firstkindname;
		this.firstKindSalaryId = firstKindSalaryId;
		this.firstKindSaleId = firstKindSaleId;
	}

	public Configfilefirstkind(String firstkindname, String firstKindSalaryId, String firstKindSaleId) {
		super();
		this.firstkindname = firstkindname;
		this.firstKindSalaryId = firstKindSalaryId;
		this.firstKindSaleId = firstKindSaleId;
	}

	public Configfilefirstkind() {
		super();
	}

	@Override
	public String toString() {
		return "Configfilefirstkind [firstkindid=" + firstkindid + ", firstkindname=" + firstkindname
				+ ", firstKindSalaryId=" + firstKindSalaryId + ", firstKindSaleId=" + firstKindSaleId + "]";
	}
    
}