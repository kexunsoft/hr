package com.kexun.hr.service.organization;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kexun.hr.dao.ConfigfilefirstkindMapper;
import com.kexun.hr.model.Configfilefirstkind;
import com.kexun.hr.model.Msg;
import com.kexun.hr.model.Role;

/*
 * 一级机构服务层
 */
@Service
public class ConfigfilefirstkindService {

	@Autowired
	private ConfigfilefirstkindMapper configfilefirstkindMapper;

	// 查询所有一级机构
	public List<Configfilefirstkind> findConfigfilefirstkind() {
		return configfilefirstkindMapper.findConfigfilefirstkind();
	}

	// 查询所有一级机构分页
	public PageInfo<Configfilefirstkind> findConfigfilefirstkind2(int page, int size) {
		PageHelper.startPage(page, size);
		List<Configfilefirstkind> findConfigfilefirstkind = configfilefirstkindMapper.findConfigfilefirstkind();
		PageInfo<Configfilefirstkind> pageInfo = new PageInfo<Configfilefirstkind>(findConfigfilefirstkind, 5);
		return pageInfo;
	}

	// 添加
	public Msg insertSelective(Configfilefirstkind record) {

		// 判断是否添加成功
		boolean b = configfilefirstkindMapper.insertSelective(record);

		return b ? new Msg().success("添加成功!") : new Msg().error("系统错误!");
	}

	// 删除
	public Msg deleteByPrimaryKey(Integer firstkindid) {
			boolean deleteKey = configfilefirstkindMapper.deleteByPrimaryKey(firstkindid);
		return deleteKey ? new Msg().success("删除成功!") : new Msg().error("系统错误!");
	}

	// 修改
	public Msg updateByPrimaryKeySelective(Configfilefirstkind record) {
		boolean updateKey = configfilefirstkindMapper.updateByPrimaryKeySelective(record);
		
		return updateKey ? new Msg().success("修改成功!") : new Msg().error("系统发生错误!");
	}
	//根据id查询
    public Configfilefirstkind findUserById(int firstkindid) {
        return configfilefirstkindMapper.findConfigfilefirstkindrById(firstkindid);
    }
}
