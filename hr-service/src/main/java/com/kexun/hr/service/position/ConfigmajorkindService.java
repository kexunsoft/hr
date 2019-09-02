package com.kexun.hr.service.position;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kexun.hr.dao.ConfigmajorkindMapper;
import com.kexun.hr.model.Configfilethirdkind;
import com.kexun.hr.model.Configmajorkind;
import com.kexun.hr.model.Msg;

/*
 * 
 * 职位分类服务层
 */
@Service
public class ConfigmajorkindService {

	@Autowired
	private ConfigmajorkindMapper configmajorkindMapper;

	// 查询所有职位分类
	public List<Configmajorkind> findConfigmajorkind() {
		return configmajorkindMapper.findConfigmajorkind();
	}

	// 查询所有职位
	public PageInfo<Map<String, Object>> configmajorkind(int page, int size) {

		PageHelper.startPage(page, size);

		List<Map<String, Object>> configmajorkindQueryAll = configmajorkindMapper.findconfigmajorkindQueryAll();

		PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String, Object>>(configmajorkindQueryAll, 5);

		return pageInfo;
	}

	// 删除
	public Msg deletemajorkindidKey(Integer majorkindid) {
		boolean secondkindidKey = configmajorkindMapper.deleteByPrimaryKey(majorkindid);
		return secondkindidKey ? new Msg().success("删除成功!") : new Msg().error("系统错误!");
	}

	// 添加
	public Msg insertSelective(Configmajorkind record) {
		// 判断是否添加成功
		boolean insertSelective = configmajorkindMapper.insertSelective(record);
		return insertSelective ? new Msg().success("添加成功!") : new Msg().error("系统错误!");
	}
}
