package com.kexun.hr.model;

/**
 * 公共字段表
 * @author 鹏
 *
 */
public class Configpublicchar {
    private Integer pbcid;//ID

    private String attributekind;//属性的种类

    private String attributename;//属性的名称

    public Integer getPbcid() {
        return pbcid;
    }

    public void setPbcid(Integer pbcid) {
        this.pbcid = pbcid;
    }

    public String getAttributekind() {
        return attributekind;
    }

    public void setAttributekind(String attributekind) {
        this.attributekind = attributekind == null ? null : attributekind.trim();
    }

    public String getAttributename() {
        return attributename;
    }

    public void setAttributename(String attributename) {
        this.attributename = attributename == null ? null : attributename.trim();
    }

	@Override
	public String toString() {
		return "Configpublicchar [pbcid=" + pbcid + ", attributekind=" + attributekind + ", attributename="
				+ attributename + "]";
	}
    
    
}