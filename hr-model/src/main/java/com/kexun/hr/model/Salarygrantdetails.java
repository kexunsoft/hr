package com.kexun.hr.model;

public class Salarygrantdetails {
    private Integer grdid;

    private String salarygrantid;

    private String humanid;

    private Double bounssum;

    private Double salesum;

    private Double deductsum;

    private Double salarystandardsum;

    private Double salarypaidsum;

    public Integer getGrdid() {
        return grdid;
    }

    public void setGrdid(Integer grdid) {
        this.grdid = grdid;
    }

    public String getSalarygrantid() {
        return salarygrantid;
    }

    public void setSalarygrantid(String salarygrantid) {
        this.salarygrantid = salarygrantid == null ? null : salarygrantid.trim();
    }

    public String getHumanid() {
        return humanid;
    }

    public void setHumanid(String humanid) {
        this.humanid = humanid == null ? null : humanid.trim();
    }

    public Double getBounssum() {
        return bounssum;
    }

    public void setBounssum(Double bounssum) {
        this.bounssum = bounssum;
    }

    public Double getSalesum() {
        return salesum;
    }

    public void setSalesum(Double salesum) {
        this.salesum = salesum;
    }

    public Double getDeductsum() {
        return deductsum;
    }

    public void setDeductsum(Double deductsum) {
        this.deductsum = deductsum;
    }

    public Double getSalarystandardsum() {
        return salarystandardsum;
    }

    public void setSalarystandardsum(Double salarystandardsum) {
        this.salarystandardsum = salarystandardsum;
    }

    public Double getSalarypaidsum() {
        return salarypaidsum;
    }

    public void setSalarypaidsum(Double salarypaidsum) {
        this.salarypaidsum = salarypaidsum;
    }

    @Override
    public String toString() {
        return "Salarygrantdetails{" +
                "grdid=" + grdid +
                ", salarygrantid='" + salarygrantid + '\'' +
                ", humanid='" + humanid + '\'' +
                ", bounssum=" + bounssum +
                ", salesum=" + salesum +
                ", deductsum=" + deductsum +
                ", salarystandardsum=" + salarystandardsum +
                ", salarypaidsum=" + salarypaidsum +
                '}';
    }
}