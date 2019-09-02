package com.kexun.hr.service.resume;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kexun.hr.dao.EngageresumeMapper;
import com.kexun.hr.model.Engageresume;
import com.kexun.hr.model.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class EngageResumeService {

    @Autowired
    private EngageresumeMapper engageresumeMapper;

    //登记简历
    public Msg registerResume(Engageresume engageresume) {

        boolean insertSelective = engageresumeMapper.insertSelective(engageresume);

        if (insertSelective) {
            return new Msg().success("登记成功");
        } else {
            return new Msg().error("系统错误");
        }

    }

    //根据组件查询简历
    public Engageresume selectByPrimaryKey(int resumeId) {

        return engageresumeMapper.selectByPrimaryKey(resumeId);

    }


    //根据条件查询的简历
    public PageInfo<Map<String, Object>> findByExample(int majorKindId, int majorId, String keyword, String startDate, String endDate, int page, int size) {

        Map<String, Object> map = new HashMap<>();

        map.put("majorKindId", majorKindId);
        map.put("majorId", majorId);
        map.put("keyword", keyword);
        map.put("startDate", startDate);
        map.put("endDate", endDate);
        map.put("checkStatus", 0);
        map.put("interviewStatus", null);


        PageHelper.startPage(page, size);
        List<Map<String, Object>> list = engageresumeMapper.findByExample(map);
        PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String, Object>>(list, 5);

        return pageInfo;


    }

    //查询简历详情
    public Map<String, Object> findOneById(int resumeId) {

        return engageresumeMapper.findOneById(resumeId);


    }

    //修改简历信息
    public Msg effectiveResume(Engageresume engageresume) {
        return engageresumeMapper.updateByPrimaryKeySelective(engageresume) ? new Msg().success("操作成功,可在有效简历列表查看") : new Msg().error("操作失败");
    }

    //查询有效简历
    public PageInfo<Map<String, Object>> effectiveResumeList(int majorKindId, int majorId, String keyword, String startDate, String endDate, int page, int size) {
        Map<String, Object> map = new HashMap<>();
        map.put("majorKindId", majorKindId);
        map.put("majorId", majorId);
        map.put("keyword", keyword);
        map.put("startDate", startDate);
        map.put("endDate", endDate);
        map.put("checkStatus", 1);
        map.put("interviewStatus", 0);

        PageHelper.startPage(page, size);
        List<Map<String, Object>> list = engageresumeMapper.findByExample(map);
        PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String, Object>>(list, 5);

        return pageInfo;

    }

    //推荐面试
    public Msg recommendTheInterview(Engageresume engageresume) {

        return engageresumeMapper.updateByPrimaryKeySelective(engageresume) ? new Msg().success("推荐面试成功,可在面试列表查询") : new Msg().error("操作失败");

    }

    //查询推荐面试的简历
    public PageInfo<Map<String, Object>> recommendedInterviewList(int majorKindId, int majorId, String keyword, String startDate, String endDate, int page, int size) {
        Map<String, Object> map = new HashMap<>();
        map.put("majorKindId", majorKindId);
        map.put("majorId", majorId);
        map.put("keyword", keyword);
        map.put("startDate", startDate);
        map.put("endDate", endDate);
        map.put("checkStatus", 1);
        map.put("interviewStatus", 1);

        PageHelper.startPage(page, size);
        List<Map<String, Object>> list = engageresumeMapper.findByExample(map);
        PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String, Object>>(list, 5);

        return pageInfo;

    }

    //修改面试状态
    public void updInterviewStatus(Integer resumeid, int i) {

        Engageresume engageresume = new Engageresume();
        engageresume.setResid(resumeid);
        engageresume.setInterviewstatus(i);

        engageresumeMapper.updateByPrimaryKeySelective(engageresume);
    }

    //设置审核结果
    public void updpassCheckComment(int resumeId, String CheckComment) {
        Engageresume engageresume = new Engageresume();
        engageresume.setResid(resumeId);
        engageresume.setPasscheckcomment(CheckComment);
        engageresumeMapper.updateByPrimaryKeySelective(engageresume);

    }

    //设置审批结果
    public void updpassPassComment(int resumeId, String PassComment) {
        Engageresume engageresume = new Engageresume();
        engageresume.setResid(resumeId);
        engageresume.setPasspasscomment(PassComment);
        engageresumeMapper.updateByPrimaryKeySelective(engageresume);

    }


    public Msg delResumeById(int resumeId) {
        return engageresumeMapper.deleteByPrimaryKey(resumeId) ? new Msg().success("简历删除成功") : new Msg().error("系统错误");
    }


}
