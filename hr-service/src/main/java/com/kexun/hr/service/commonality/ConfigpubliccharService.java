package com.kexun.hr.service.commonality;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kexun.hr.dao.ConfigpubliccharMapper;
import com.kexun.hr.model.Configmajorkind;
import com.kexun.hr.model.Configpublicchar;
import com.kexun.hr.model.Msg;

/*
 * 公共字段服务层
 */
@Service
public class ConfigpubliccharService {

	@Autowired
	private ConfigpubliccharMapper configpubliccharMapper;

	// 查询所有学历
	public List<Configpublicchar> findConfigpubliccharXueli(String attributekind) {
		return configpubliccharMapper.findConfigpubliccharXueli(attributekind);
	}
	
	// 查询所有不分页
	public List<Map<String, Object>> findConfigpublicchar() {
			return configpubliccharMapper.findConfigpublicchar();
	}
	// 查询所有属性分页
	public PageInfo<Map<String, Object>> configmajorkind(int page, int size) {

		PageHelper.startPage(page, size);

		List<Map<String, Object>> configpubliccharAll = configpubliccharMapper.findConfigpubliccharQueryAll();

		PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String, Object>>(configpubliccharAll, 5);

		return pageInfo;
	}

	// 删除
	public Msg deleteConfigpubliccharKey(Integer pbcid) {
		boolean secondkindidKey = configpubliccharMapper.deleteByPrimaryKey(pbcid);
		return secondkindidKey ? new Msg().success("删除成功!") : new Msg().error("系统错误!");
	}

	// 添加
	public Msg insertSelective(Configpublicchar record) {
		// 判断是否添加成功
		boolean insertSelective = configpubliccharMapper.insertSelective(record);
		return insertSelective ? new Msg().success("添加成功!") : new Msg().error("系统错误!");
	}
}
