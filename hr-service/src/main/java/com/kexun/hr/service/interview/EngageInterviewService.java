package com.kexun.hr.service.interview;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kexun.hr.dao.EngageinterviewMapper;
import com.kexun.hr.model.Engageinterview;
import com.kexun.hr.model.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class EngageInterviewService {

    @Autowired
    private EngageinterviewMapper engageinterviewMapper;


    public Msg register(Engageinterview engageInterview) {


        return engageinterviewMapper.insertSelective(engageInterview) ? new Msg().success("登记成功") : new Msg().error("系统错误");

    }

    public PageInfo<Map<String, Object>> interviewScreening(int page, int size) {


        PageHelper.startPage(page, size);

        List<Map<String, Object>> list = engageinterviewMapper.findAll(0);

        PageInfo<Map<String, Object>> pageInfo = new PageInfo<>(list, 5);

        return pageInfo;


    }

    //查询推荐录用的简历

    public PageInfo<Map<String, Object>> employmentApplicationList(int page, int size) {


        PageHelper.startPage(page, size);

        List<Map<String, Object>> list = engageinterviewMapper.findAll(1);

        PageInfo<Map<String, Object>> pageInfo = new PageInfo<>(list, 5);

        return pageInfo;


    }

    public Map<String, Object> findByEinId(int einId) {

        return engageinterviewMapper.findByEinId(einId);
    }

    public Msg updCheckStatus(int einId, int state) {

        HashMap<String, Object> map = new HashMap<>();
        map.put("einId", einId);
        map.put("state", state);

        return engageinterviewMapper.updCheckStatus(map) ? new Msg().success("推进成功,可在录用申请列表查看") : new Msg().error("操作失败,系统错误");

    }

    public boolean delInterview(int einId) {

        return engageinterviewMapper.deleteByPrimaryKey(einId);

    }

    public void updChecker(int einId, String trueName) {

        Engageinterview engageinterview = new Engageinterview();
        engageinterview.setEinid(einId);
        engageinterview.setChecker(trueName);
        engageinterview.setChecktime(new Date());
        engageinterviewMapper.updateByPrimaryKeySelective(engageinterview);

    }


    public PageInfo<Map<String, Object>> employmentApprovalList(int page, int size) {

        PageHelper.startPage(page, size);

        List<Map<String, Object>> list = engageinterviewMapper.findAll(2);

        PageInfo<Map<String, Object>> pageInfo = new PageInfo<>(list, 5);

        return pageInfo;
    }

    public PageInfo<Map<String, Object>> findEmployList(int page, int size) {

        PageHelper.startPage(page, size);

        List<Map<String, Object>> list = engageinterviewMapper.findAll(3);

        PageInfo<Map<String, Object>> pageInfo = new PageInfo<>(list, 5);

        return pageInfo;
    }


    //


}
