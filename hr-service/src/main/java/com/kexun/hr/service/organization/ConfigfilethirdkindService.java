package com.kexun.hr.service.organization;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kexun.hr.dao.ConfigfilethirdkindMapper;
import com.kexun.hr.model.Configfilesecondkind;
import com.kexun.hr.model.Configfilethirdkind;
import com.kexun.hr.model.Msg;

@Service
public class ConfigfilethirdkindService {

	@Autowired
	private ConfigfilethirdkindMapper configfilethirdkindMapper;

	// 根据二级机构的id查询三级机构
	public List<Configfilethirdkind> findBysecondKindIdConfigfilethirdkind(Integer secondKindId) {
		return configfilethirdkindMapper.findBysecondKindIdConfigfilethirdkind(secondKindId);
	}

	// 查询所有三级机构分页

	public PageInfo<Map<String, Object>> configfilethirdkind(int page, int size) {

		PageHelper.startPage(page, size);

		List<Map<String, Object>> configfilethirdkindQueryAll = configfilethirdkindMapper
				.findConfigfilethirdkindQueryAll();

		PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String, Object>>(configfilethirdkindQueryAll, 5);

		return pageInfo;
	}

	// 添加三级机构
	public Msg insertSelective(Configfilethirdkind record) {
		// 判断是否添加成功
		boolean insertSelective = configfilethirdkindMapper.insertSelective(record);
		return insertSelective ? new Msg().success("添加成功!") : new Msg().error("系统错误!");
	}

	// 删除三级机构
	public Msg deleteByPrimaryKey(Integer thirdkindid) {
		boolean secondkindidKey = configfilethirdkindMapper.deleteByPrimaryKey(thirdkindid);
		return secondkindidKey ? new Msg().success("删除成功!") : new Msg().error("系统错误!");
	}

	// 修改三级机构
	public Msg updateByPrimaryKeySelective(Configfilethirdkind record) {
		boolean updateKey = configfilethirdkindMapper.updateByPrimaryKeySelective(record);
		return updateKey ? new Msg().success("修改成功!") : new Msg().error("系统发生错误!");
	}

	// 根据id查询单个三级机构
	public Map<String, Object> findConfigfilesecondkindById(int thirdkindid) {
		return configfilethirdkindMapper.inquireConfigfilethirdkind(thirdkindid);
	}

	// 查询所有三级机构
	public List<Configfilethirdkind> findConfigfilesecondkindkind() {
		return configfilethirdkindMapper.findConfigfilethirdkind();
	}
}
