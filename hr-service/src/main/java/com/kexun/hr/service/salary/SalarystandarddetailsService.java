package com.kexun.hr.service.salary;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kexun.hr.dao.SalarystandarddetailsMapper;
import com.kexun.hr.model.Configpublicchar;
import com.kexun.hr.model.Msg;
import com.kexun.hr.model.Salarystandarddetails;

/*
 * 薪酬标准信息服务层
 */
@Service
public class SalarystandarddetailsService {

    @Autowired
    private SalarystandarddetailsMapper salarystandarddetailsMapper;

    //查询所有薪酬标准项目
    public List<Salarystandarddetails> findSalarystandarddetails() {
        return salarystandarddetailsMapper.findSalarystandarddetails();
    }


    //查询standardId=0 的薪酬项目
    public List<Salarystandarddetails> findBystandardId(String standardId) {
        return salarystandarddetailsMapper.findBystandardId(standardId);

    }

    //修改 薪酬项目 根据id修改
    public boolean updateByPrimaryKeySelective(Salarystandarddetails salarystandarddetails) {

        return salarystandarddetailsMapper.updateByPrimaryKeySelective(salarystandarddetails);

    }


    // 添加
 	public Msg insertSelective(Salarystandarddetails record) {
 		// 判断是否添加成功
 		boolean insertSelective = salarystandarddetailsMapper.insertSelective(record);
 		return insertSelective ? new Msg().success("添加成功!") : new Msg().error("系统错误!");
 	}
   
    
    // 查询所有薪酬项目分页
 	public PageInfo<Map<String, Object>> configmajorkind(int page, int size) {

 		PageHelper.startPage(page, size);

 		List<Map<String, Object>> configpubliccharAll = salarystandarddetailsMapper.findSalarystandarddetailsQueryAll();

 		PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String, Object>>(configpubliccharAll, 5);

 		return pageInfo;
 	}
 	

	// 删除
	public Msg deleteSalarystandarddetailsKey(Integer itemid) {
		boolean secondkindidKey = salarystandarddetailsMapper.deleteByPrimaryKey(itemid);
		return secondkindidKey ? new Msg().success("删除成功!") : new Msg().error("系统错误!");
	}
}
