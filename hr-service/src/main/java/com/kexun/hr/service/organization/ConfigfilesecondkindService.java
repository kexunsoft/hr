package com.kexun.hr.service.organization;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kexun.hr.dao.ConfigfilesecondkindMapper;
import com.kexun.hr.model.Configfilefirstkind;
import com.kexun.hr.model.Configfilesecondkind;
import com.kexun.hr.model.Msg;

@Service
public class ConfigfilesecondkindService {

	@Autowired
	private ConfigfilesecondkindMapper configfilesecondkindMapper;

	// 根据一级机构id查询二级机构
	public List<Configfilesecondkind> findByFirstKindId(Integer firstKindId) {
		return configfilesecondkindMapper.findByFirstKindId(firstKindId);
	}

	// 查询所有二级机构分页

	public PageInfo<Map<String, Object>> configfilesecondkind(int page, int size) {

		PageHelper.startPage(page, size);

		List<Map<String, Object>> configfilesecondkind = configfilesecondkindMapper.findByFirstKindQueryAll();

		PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String, Object>>(configfilesecondkind, 5);

		return pageInfo;
	}

	// 添加二级机构
	public Msg insertSelective(Configfilesecondkind record) {
		// 判断是否添加成功
		boolean insertSelective = configfilesecondkindMapper.insertSelective(record);
		return insertSelective ? new Msg().success("添加成功!") : new Msg().error("系统错误!");
	}

	// 删除二级机构
	public Msg deleteByPrimaryKey(Integer secondkindid) {
		boolean secondkindidKey = configfilesecondkindMapper.deleteByPrimaryKey(secondkindid);
		return secondkindidKey ? new Msg().success("删除成功!") : new Msg().error("系统错误!");
	}

	// 修改二级机构
	public Msg updateByPrimaryKeySelective(Configfilesecondkind record) {
		boolean updateKey = configfilesecondkindMapper.updateByPrimaryKeySelective(record);
		return updateKey ? new Msg().success("修改成功!") : new Msg().error("系统发生错误!");
	}

	// 根据id查询单个
	public Map<String, Object> findConfigfilesecondkindById(int secondkindid) {
		return configfilesecondkindMapper.inquireSecondkindSingle(secondkindid);
	}
	// 查询所有二级机构
	public List<Configfilesecondkind> findConfigfilesecondkindkind() {
				return configfilesecondkindMapper.findConfigfilesecondkind();
	}
}
