package com.kexun.hr.service.manpowerResource;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kexun.hr.dao.HumanfileMapper;
import com.kexun.hr.model.Humanfile;
import com.kexun.hr.model.Msg;

/*
 * 人力资源档案管理服务层
 */
@Service
public class HumanFileService {

    @Autowired
    private HumanfileMapper humanfileMapper;

    //人力资源档案登记-新增
    public Msg insertHumanFile(Humanfile record) {
    	return humanfileMapper.insertSelective(record) ? new Msg().success("提交成功") : new Msg().success("提交失败");
    }
    
    //多表联查 查询人力资源登记过的数据
    public PageInfo<Map<String, Object>> findMoreTableHumanfile(int page,int size){
    	
    	PageHelper.startPage(page, size);
    	List<Map<String, Object>> findMoreTableHumanfile = humanfileMapper.findMoreTableHumanfile();
    	
    	PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String, Object>>(findMoreTableHumanfile,5);
    	
    	
    	return pageInfo;
    }
    
  //根据主键查询单个对象 多表
    public Map<String, Object> selectByPrimaryKeyMoreTable(Integer humanid) {
    	return humanfileMapper.selectByPrimaryKeyMoreTable(humanid);
    }
    
    //人力资源档案登记确认复核 根据主键 修改状态 并且插入复核时间  操作用户
    public Msg updateByPrimaryKeySelective(Humanfile humanfile) {
    	return humanfileMapper.updateByPrimaryKeySelective(humanfile) ? new Msg().success("复核成功"):new Msg().success("复核失败");
    }
    
    //人力资源档案根据主键修改
    public Msg updateHumanfile(Humanfile record) {
    	return humanfileMapper.updateByPrimaryKeySelective(record) ? new Msg().success("修改成功"):new Msg().success("修改失败");
    }
    
    //人力资源档案复核通过的数据人员
    public PageInfo<Map<String, Object>> findMoreTableHumanfileYes(int page,int size){
    	
    	PageHelper.startPage(page, size);
    	List<Map<String, Object>> findMoreTableHumanfileYes = humanfileMapper.findMoreTableHumanfileYes();
    
    	PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String,Object>>(findMoreTableHumanfileYes);
    	
    	return pageInfo;
    }
    
    //根据主键 删除 条件为已复核通过的  修改状态  （修改状态为1）
    public Msg deleteByKeyHumanfileYes(Humanfile humanfile) {
    	return humanfileMapper.deleteByKeyHumanfileYes(humanfile) ? new Msg().success("删除成功"):new Msg().success("删除失败");
    }
    
    //查询人力资源被删除的数据
  	public PageInfo<Map<String, Object>> selectBydelete(int page,int size){
  	
  		PageHelper.startPage(page, size);
  		List<Map<String, Object>> list= humanfileMapper.selectBydelete();
  	
  		PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String,Object>>(list);
  		
  		return pageInfo;
      }
    
    //根据主键恢复被删除的档案 条件为已被删除并且为已复核通过的
    public Msg huiguByKeyHumanfileBy1(Humanfile humanfile) {
    	return humanfileMapper.huiguByKeyHumanfileBy1(humanfile) ? new Msg().success("恢复成功"):new Msg().success("恢复失败");
    }
    	
    //永久删除
    public Msg deleteByKeyHumanfile(Integer humanid){
    	return humanfileMapper.deleteByKeyHumanfile(humanid) ? new Msg().success("删除成功"):new Msg().success("删除失败");
    }
}
