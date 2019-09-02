package com.kexun.hr.model;

import java.util.List;

public class Role {

	private int roleId;

	private String roleName;

	private String roleDesc;

	//角色拥有的权限
	private List<Right> roleRights;

	
	
	public List<Right> getRoleRights() {
		return roleRights;
	}

	public void setRoleRights(List<Right> roleRights) {
		this.roleRights = roleRights;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleDesc() {
		return roleDesc;
	}

	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}

}
