package com.kexun.hr.service.position;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kexun.hr.dao.ConfigmajorMapper;
import com.kexun.hr.model.Configmajor;
import com.kexun.hr.model.Configmajorkind;
import com.kexun.hr.model.Msg;

/*
 * 职位设置服务层
 */
@Service
public class ConfigmajorService {

	@Autowired
	private ConfigmajorMapper configmajorMapper;

	// 根据职位类型id查询对应的职位
	public List<Configmajor> findByidMajorKindIdConfigmajor(Integer majorKindId) {
		return configmajorMapper.findByidMajorKindIdConfigmajor(majorKindId);
	}

	// 查询所有职位分页
	public PageInfo<Map<String, Object>> configmajorkind(int page, int size) {

		PageHelper.startPage(page, size);

		List<Map<String, Object>> configmajorkindQueryAll = configmajorMapper.findconConfigmajorQueryAll();

		PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String, Object>>(configmajorkindQueryAll, 5);

		return pageInfo;
	}
	// 删除
	public Msg deletemajorkindidKey(Integer majorid) {
			boolean secondkindidKey = configmajorMapper.deleteByPrimaryKey(majorid);
			return secondkindidKey ? new Msg().success("删除成功!") : new Msg().error("系统错误!");
	}
	// 添加
	public Msg insertSelective(Configmajor record) {
			// 判断是否添加成功
			boolean insertSelective = configmajorMapper.insertSelective(record);
			return insertSelective ? new Msg().success("添加成功!") : new Msg().error("系统错误!");
	}

	

	
	
}
