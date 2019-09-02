package com.kexun.hr.model;

/**
 * 薪酬标准单详细信息表
 * @author 鹏
 *
 */
public class Salarystandarddetails {
    private String itemid;//薪酬项目序号

    private String itemname;//薪酬项目名称

    private double salary;//薪酬金额

    private String standardid;//薪酬标准单编号

    public String getItemid() {
        return itemid;
    }

    public void setItemid(String itemid) {
        this.itemid = itemid;
    }

    public String getItemname() {
        return itemname;
    }

    public void setItemname(String itemname) {
        this.itemname = itemname;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public String getStandardid() {
        return standardid;
    }

    public void setStandardid(String standardid) {
        this.standardid = standardid;
    }

    @Override
    public String toString() {
        return "Salarystandarddetails [itemid=" + itemid + ", itemname=" + itemname + ", salary=" + salary
                + ", standardid=" + standardid + "]";
    }


}