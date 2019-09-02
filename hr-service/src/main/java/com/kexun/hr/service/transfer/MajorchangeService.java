package com.kexun.hr.service.transfer;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kexun.hr.dao.MajorchangeMapper;
import com.kexun.hr.model.Majorchange;
import com.kexun.hr.model.Msg;

@Service
public class MajorchangeService {
	@Autowired
	private MajorchangeMapper majorchangeMapper;
	
	//多条件查询
	public PageInfo<Map<String, Object>> findByMoreIfMajorchange(Map<String, Object> map,int page,int size){
		PageHelper.startPage(page, size);
		List<Map<String, Object>> findByMoreIfMajorchange = majorchangeMapper.findByMoreIfMajorchange(map);
	
		PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String, Object>>(findByMoreIfMajorchange);
	
		return pageInfo;
	}
	
	//插入调动记录
	public Msg insertSelective(Majorchange majorchange) {
		return majorchangeMapper.insertSelective(majorchange) ? new Msg().success("调动成功"):new Msg().success("调动失败");
	}
	
	//查询未审核通过的所有数据
	public PageInfo<Map<String, Object>> findByMajorChangeCheckStatusNo(int page,int size){
		PageHelper.startPage(page, size);
		List<Map<String, Object>> findByMajorChangeCheckStatusNo = majorchangeMapper.findByMajorChangeCheckStatusNo();
		PageInfo<Map<String, Object>> pageInfo=new PageInfo<Map<String,Object>>(findByMajorChangeCheckStatusNo,5);
		return pageInfo;
	}
	
	//根据主键查询单个对象
	public Map<String, Object> selectByKeyMajorChangeck(Integer mchId) {
		return majorchangeMapper.selectByKeyMajorChangeck(mchId);
	}
	
	//进行审核修改
	public Msg updateByKeyMajorChangeck(Majorchange majorchange) {
		return majorchangeMapper.updateByPrimaryKeySelective(majorchange) ? new Msg().success("审核成功"):new Msg().success("审核失败");
	}
	
	//查询已审核通过的数据
	public PageInfo<Map<String,Object>> findByMajorChangeCheckStatusYes(Map<String, Object> map,int page,int size){
		PageHelper.startPage(page, size);
		List<Map<String, Object>> findByMoreIfMajorchangeYes = majorchangeMapper.findByMajorChangeCheckStatusYes(map);
	
		PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String, Object>>(findByMoreIfMajorchangeYes);
	
		return pageInfo;
	}
	
	//根据主键查询单个对象 13连表
	public Map<String, Object> selectByKeySingleMajorchange(Integer mchid){
		return majorchangeMapper.selectByKeySingleMajorchange(mchid);
	}
}
