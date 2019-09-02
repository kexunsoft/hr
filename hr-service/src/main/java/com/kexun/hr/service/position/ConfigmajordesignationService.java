package com.kexun.hr.service.position;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kexun.hr.dao.ConfigmajordesignationMapper;
import com.kexun.hr.model.Configfilethirdkind;
import com.kexun.hr.model.Configmajordesignation;
import com.kexun.hr.model.Msg;

/*
 * 职称设置服务层
 */
@Service
public class ConfigmajordesignationService {

	@Autowired
	private ConfigmajordesignationMapper configmajordesignationMapper;
	
	//查询所有职称
	public List<Configmajordesignation> findConfigmajordesignation(){
		return configmajordesignationMapper.findConfigmajordesignation();
	}
	//查询所有职称分页
	public PageInfo<Map<String, Object>> configfilethirdkind(int page, int size) {

		PageHelper.startPage(page, size);

		List<Map<String, Object>> contechnicalQueryAll = configmajordesignationMapper.findtechnicalQueryAll();

		PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String, Object>>(contechnicalQueryAll, 5);

		return pageInfo;
	}
	
	// 删除
	public Msg deleteByPrimaryKey(Integer cmdid) {
			boolean secondkindidKey = configmajordesignationMapper.deleteByPrimaryKey(cmdid);
			return secondkindidKey ? new Msg().success("删除成功!") : new Msg().error("系统错误!");
	}
	
	
}
