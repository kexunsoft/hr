package com.kexun.hr.service.position;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kexun.hr.dao.EngagemajorreleaseMapper;
import com.kexun.hr.model.Engagemajorrelease;
import com.kexun.hr.model.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class EngageMajorReleaseService {


    @Autowired
    private EngagemajorreleaseMapper engagemajorreleaseMapper;

    //添加职位 职位发布登记
    public Msg addPosition(Engagemajorrelease engagemajorrelease) {

        boolean result = engagemajorreleaseMapper.insertSelective(engagemajorrelease);
        if (result) {
            return new Msg().success("发布成功");
        } else {
            return new Msg().error("系统错误");
        }


    }

    //查询所有职位并且分页
    public PageInfo<Map<String, Object>> findAll(int page, int size) {


        PageHelper.startPage(page, size);

        List<Map<String, Object>> mapList = engagemajorreleaseMapper.findAll();

        System.out.println(mapList);

        PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String, Object>>(mapList, 5);

        return pageInfo;


    }

    //查询单个
    public Map<String, Object> findOneById(int mreId) {
        return engagemajorreleaseMapper.findOneById(mreId);
    }


    //修改
    public Msg updMajor(Engagemajorrelease engagemajorrelease) {

        boolean upd = engagemajorreleaseMapper.updateByPrimaryKeySelective(engagemajorrelease);

        return upd ? new Msg().success("更新成功") : new Msg().error("系统错误");

    }


    //根据主键删除 职位
    public Msg delMajoe(int majorId) {

        return engagemajorreleaseMapper.deleteByPrimaryKey(majorId) ? new Msg().success("删除成功") : new Msg().error("系统错误");

    }


}
