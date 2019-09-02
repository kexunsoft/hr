package com.kexun.hr.model;

public class Users {

    private int uId;

    private String uName;

    private String trueName;

    private String uPassword;

    private int roleId;

    // 用户所属的角色
    private Role uRole;

    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public String getTrueName() {
        return trueName;
    }

    public void setTrueName(String trueName) {
        this.trueName = trueName;
    }

    public String getuPassword() {
        return uPassword;
    }

    public void setuPassword(String uPassword) {
        this.uPassword = uPassword;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public Role getuRole() {
        return uRole;
    }

    public void setuRole(Role uRole) {
        this.uRole = uRole;
    }

    @Override
    public String toString() {
        return "Users{" +
                "uId=" + uId +
                ", uName='" + uName + '\'' +
                ", trueName='" + trueName + '\'' +
                ", uPassword='" + uPassword + '\'' +
                ", roleId=" + roleId +
                ", uRole=" + uRole +
                '}';
    }
}
