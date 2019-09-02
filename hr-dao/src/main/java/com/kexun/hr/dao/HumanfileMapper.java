package com.kexun.hr.dao;

import java.util.List;
import java.util.Map;

import com.kexun.hr.model.Humanfile;
import com.kexun.hr.model.Msg;
/*
 * 人力资源档案dao层
 */
public interface HumanfileMapper {
    int deleteByPrimaryKey(Integer humanid);
    
    int insert(Humanfile record);
    //登记人力资源档案
    boolean insertSelective(Humanfile record);

    //根据主键查询单个对象
    Humanfile selectByPrimaryKey(Integer humanid);

    //人力资源档案登记确认复核 根据主键 修改状态 并且插入复核时间 和 操作用户
    boolean updateByPrimaryKeySelective(Humanfile record);

    int updateByPrimaryKey(Humanfile record);
    
    //多表联查 查询人力资源登记过的数据
    List<Map<String, Object>> findMoreTableHumanfile();

    //根据主键查询单个对象 多表
    Map<String, Object> selectByPrimaryKeyMoreTable(Integer humanid);
    
    //多表联查 查询人力资源复核通过的数据
    List<Map<String,Object>> findMoreTableHumanfileYes();
    
    //根据主键删除 并且条件为已复核通过的  修改状态为1
    boolean deleteByKeyHumanfileYes(Humanfile humanfile);
    
    //查询人力资源被删除的数据
    List<Map<String, Object>> selectBydelete();
    
    //根据主键恢复被删除的档案 条件为已被删除并且为已复核通过的
    boolean huiguByKeyHumanfileBy1(Humanfile humanfile);
    
    //根据主键永久删除
    boolean deleteByKeyHumanfile(Integer humanid);
    
}