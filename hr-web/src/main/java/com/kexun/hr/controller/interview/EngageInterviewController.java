package com.kexun.hr.controller.interview;

import com.github.pagehelper.PageInfo;
import com.kexun.hr.model.*;
import com.kexun.hr.service.interview.EngageInterviewService;
import com.kexun.hr.service.manpowerResource.HumanFileService;
import com.kexun.hr.service.resume.EngageResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Map;

//面试管理 操作的是面试表
@Controller
@RequestMapping("engageInterview")
public class EngageInterviewController {


    @Autowired
    private EngageResumeService engageResumeService;

    @Autowired
    private HumanFileService humanFileService;

    @Autowired
    private EngageInterviewService engageInterviewService;

    //查询推荐面试 列表
    @RequestMapping("recommendedInterviewList")
    public String recommendedInterviewList(@RequestParam(value = "majorKindId", defaultValue = "0") int majorKindId, @RequestParam(value = "majorId", defaultValue = "0") int majorId, @RequestParam(value = "keyword", required = false) String keyword, @RequestParam(value = "startDate", required = false) String startDate, @RequestParam(value = "endDate", required = false) String endDate, @RequestParam(value = "page", defaultValue = "1") int page,
                                           @RequestParam(value = "size", defaultValue = "5") int size, Model model) {

        PageInfo<Map<String, Object>> pageInfo = engageResumeService.recommendedInterviewList(majorKindId, majorId, keyword, startDate, endDate, page, size);

        model.addAttribute("pageInfo", pageInfo);

        return "recommendedInterviewList";
    }


    //面试登记
    @RequestMapping(value = "register", method = RequestMethod.GET)
    public String register(int resumeId, Model model) {

        //查询简历信息
        Map<String, Object> resume = engageResumeService.findOneById(resumeId);

        model.addAttribute("resume", resume);

        return "registerInterview";


    }


    //执行面试登记
    @RequestMapping(value = "register", method = RequestMethod.POST)
    @ResponseBody
    public Msg register(Engageinterview engageInterview, HttpSession session) {

        Users user = (Users) session.getAttribute("user");

        //设置面试人
        engageInterview.setRegister(user.getTrueName());

        //设置面试shij
        engageInterview.setRegistetime(new Date());

        //设置面试室状态为已经面试 2
        engageResumeService.updInterviewStatus(engageInterview.getResumeid(), 2);


        //设置筛选状态 未筛选
        engageInterview.setCheckstatus(0);

        //添加数据到面试表
        return engageInterviewService.register(engageInterview);

    }


    //查询未筛选的面试
    @RequestMapping("interviewScreeningList")
    public String interviewScreeningList(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {

        PageInfo<Map<String, Object>> pageInfo = engageInterviewService.interviewScreening(page, 5);

        model.addAttribute("pageInfo", pageInfo);

        return "interviewScreeningList";

    }

    //跳转面试筛选界面 根据面试编号 查询简历详情和面试详情
    @RequestMapping(value = "interviewScreening", method = RequestMethod.GET)
    public String interviewScreening(int einId, Model model) {


        Map<String, Object> engageInterview = engageInterviewService.findByEinId(einId);
        model.addAttribute("interview", engageInterview);

        return "interviewScreening";


    }

    //面试结果
    @RequestMapping("interviewResult")
    @ResponseBody
    public Msg interviewResult(int state, int resumeId, int einId, HttpSession session) {

        if (state == 0) {
            //删除面试记录
            if (engageInterviewService.delInterview(einId)) {
                return engageResumeService.delResumeById(resumeId);
            } else {
                return new Msg().error("系统错误,面试记录删除失败");
            }
            //删除简历

        } else {

            Users user = (Users) session.getAttribute("user");
            //设置筛选人
            engageInterviewService.updChecker(einId, user.getTrueName());
            //设置面试的筛选转态为 推荐录用 1
            return engageInterviewService.updCheckStatus(einId, 1);

        }

    }

    //查询所有 推荐录用的面试
    @RequestMapping(value = "employmentApplicationList", method = RequestMethod.GET)
    public String employmentApplicationList(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {

        PageInfo<Map<String, Object>> pageInfo = engageInterviewService.employmentApplicationList(page, 5);

        model.addAttribute("pageInfo", pageInfo);

        return "employmentApplicationList";


    }

    //点击申请按钮 查询简历详情及面试信息
    @RequestMapping("employmentApplication")
    public String employmentApplication(int einId, Model model) {

        Map<String, Object> interview = engageInterviewService.findByEinId(einId);

        model.addAttribute("interview", interview);

        return "employmentApplication";

    }

    //application result 申请结果
    @ResponseBody
    @RequestMapping("applicationResult")
    public Msg applicationResult(int state, int einId, int resumeId) {

        if (state == 0) {
            //删除简历
            engageInterviewService.delInterview(einId);
            engageResumeService.delResumeById(resumeId);
            return new Msg().success("简历删除成功");

        } else {
            //修改状态为 待审批 2
            engageResumeService.updpassCheckComment(resumeId, "通过");
            engageInterviewService.updCheckStatus(einId, 2);
            return new Msg().success("申请通过,待审批");

        }

    }

    //查询待审批的
    @RequestMapping("employmentApprovalList")
    public String employmentApprovalList(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
        PageInfo<Map<String, Object>> pageInfo = engageInterviewService.employmentApprovalList(page, 5);
        model.addAttribute("pageInfo", pageInfo);
        return "employmentApprovalList";
    }

    //点击审批查询详情
    @RequestMapping("employmentApproval")
    public String employmentApproval(Model model, int einId) {

        Map<String, Object> interview = engageInterviewService.findByEinId(einId);

        model.addAttribute("interview", interview);

        return "employmentApproval";
    }

    //审批结果
    @ResponseBody
    @RequestMapping("examineResult")
    public Msg examineResult(int state, int einId, int resumeId) {

        if (state == 0) {
            //删除简历
            engageInterviewService.delInterview(einId);
            engageResumeService.delResumeById(resumeId);
            return new Msg().success("简历删除成功");

        } else {


            //根据简历id查询简历信息
            Engageresume engageresume = engageResumeService.selectByPrimaryKey(resumeId);

            //人力资源对象
            Humanfile humanfile = new Humanfile();


//            将简历信息保存到 人力资源表

            //设置名字
            humanfile.setHumanname(engageresume.getHumanname());

            //地址
            humanfile.setHumanaddress(engageresume.getHumanaddress());

            //邮政
            humanfile.setHumanpostcode(engageresume.getHumanpostcode());

            //职位编号
            humanfile.setHumanmajorid(engageresume.getHumanmajorid());

            //电话
            humanfile.setHumantelephone(engageresume.getHumantelephone());

            //手机号码
            humanfile.setHumanmobilephone(engageresume.getHumanmobilephone());

            //爱好
            humanfile.setHumanhobby(engageresume.getHumanhobby());
//特长
            humanfile.setHumanspecility(engageresume.getHumanspecility());
//            性别
            humanfile.setHumansex(engageresume.getHumansex());
//            宗教信仰
            humanfile.setHumanreligion(engageresume.getHumanreligion());

            humanfile.setHumanparty(engageresume.getHumanparty());

            //国籍
            humanfile.setHumannationality(engageresume.getHumannationality());

            //民族
            humanfile.setHumanrace(engageresume.getHumanrace());

//            出生日期
            humanfile.setHumanbirthday(engageresume.getHumanbirthday());

            //出生地
            humanfile.setHumanbirthplace(engageresume.getHumanbirthplace());

            humanfile.setHumanage(engageresume.getHumanage());

            humanfile.setHumaneducateddegree(engageresume.getHumaneducateddegree());

            humanfile.setHumaneducatedyears(engageresume.getHumaneducatedyears());

            humanfile.setHumaneducatedmajor(engageresume.getHumaneducatedmajor());

            humanfile.setHumanidcard(engageresume.getHumanidcard());

            humanfile.setRemark(engageresume.getRemark());

            humanfile.setHumanpicture(engageresume.getHumanpicture());
            humanfile.setCheckstatus(0);

            Msg msg = humanFileService.insertHumanFile(humanfile);

            if (msg.getCode() == 500) {

                return new Msg().error("系统错误");
            }


            //修改状态为 待审批 2
            engageResumeService.updpassPassComment(resumeId, "通过");
            engageInterviewService.updCheckStatus(einId, 3);
            return new Msg().success("审批通过");

        }

    }

    //查询审批通过的
    @RequestMapping("findEmployList")
    public String findEmployList(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
        PageInfo<Map<String, Object>> pageInfo = engageInterviewService.findEmployList(page, 5);
        model.addAttribute("pageInfo", pageInfo);
        return "findEmployList";
    }

    //点击查看按钮查询详情
    @RequestMapping("employInfo")
    public String employInfo(Model model, int einId) {

        Map<String, Object> interview = engageInterviewService.findByEinId(einId);

        model.addAttribute("interview", interview);

        return "employInfo";
    }

}
