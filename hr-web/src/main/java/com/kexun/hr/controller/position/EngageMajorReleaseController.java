package com.kexun.hr.controller.position;

import com.github.pagehelper.PageInfo;
import com.kexun.hr.model.Configpublicchar;
import com.kexun.hr.model.Engagemajorrelease;
import com.kexun.hr.model.Msg;
import com.kexun.hr.model.Users;
import com.kexun.hr.service.commonality.ConfigpubliccharService;
import com.kexun.hr.service.position.EngageMajorReleaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("engageMajorRelease")
public class EngageMajorReleaseController {

    @Autowired
    private EngageMajorReleaseService engageMajorReleaseService;

    @Autowired
    private ConfigpubliccharService configpubliccharService;

    //职位发布 添加 页面
    @RequestMapping(value = "addPosition", method = RequestMethod.GET)
    public String addPosition() {
        return "addPosition";
    }

    //执行职位添加
    @ResponseBody
    @RequestMapping(value = "addPosition", method = RequestMethod.POST)
    public Msg addPosition(Engagemajorrelease engageMajorRelease, HttpSession session) {
        System.err.println("职位发布登记信息:>>>>>>>>>>>>" + engageMajorRelease);

        Users users = (Users) session.getAttribute("user");

        if (users != null) {
            //设置发布时间
            engageMajorRelease.setRegisttime(new Date());

            //设置登记人
            engageMajorRelease.setRegister(users.getTrueName());


            return engageMajorReleaseService.addPosition(engageMajorRelease);

        } else {
            return new Msg().error("未登录");
        }


    }

    //简历发布查询页面
    @RequestMapping("positions")
    public String findAllPosition(@RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "size", defaultValue = "5") int size, Model model) {

        //调用service分页查询
        PageInfo<Map<String, Object>> pageInfo = engageMajorReleaseService.findAll(page, size);

        model.addAttribute("pageInfo", pageInfo);

        return "positions";

    }


    //申请职位 页面
    @RequestMapping("apply")
    public String apply(int pid, Model model) {
        //根据id查询单个

        Map<String, Object> major = engageMajorReleaseService.findOneById(pid);

        model.addAttribute("major", major);

        return "applyPosition";
    }

    //  确认申请到 简历登记页面
    //执行申请 跳转到 简历登记界面 职位分类 职位名称 职位名称  不能修改直接根据id查询
    @RequestMapping("register")
    public String register(Model model) {
        List<Configpublicchar> zjxy = configpubliccharService.findConfigpubliccharXueli("宗教信仰");
        List<Configpublicchar> zjmm = configpubliccharService.findConfigpubliccharXueli("政治面貌");
        List<Configpublicchar> jynx = configpubliccharService.findConfigpubliccharXueli("教育年限");
        List<Configpublicchar> xl = configpubliccharService.findConfigpubliccharXueli("学历专业");
        List<Configpublicchar> gj = configpubliccharService.findConfigpubliccharXueli("国籍");
        List<Configpublicchar> mz = configpubliccharService.findConfigpubliccharXueli("民族");

        model.addAttribute("zjxy", zjxy);
        model.addAttribute("zjmm", zjmm);
        model.addAttribute("jynx", jynx);
        model.addAttribute("xl", xl);
        model.addAttribute("gj", gj);
        model.addAttribute("mz", mz);

        return "registerResume";
    }


    //修改发布的职位 修改界面
    @RequestMapping(value = "updMajor", method = RequestMethod.GET)
    public String updMajor(int majorId, Model model) {
        List<Configpublicchar> zps = configpubliccharService.findConfigpubliccharXueli("招聘类型");

        Map<String, Object> major = engageMajorReleaseService.findOneById(majorId);

        model.addAttribute("major", major);
        model.addAttribute("zps", zps);

        return "updMajor";


    }

    //执行修改职位
    @ResponseBody
    @RequestMapping(value = "updMajor", method = RequestMethod.POST)
    public Msg updMajor(Engagemajorrelease engagemajorrelease, HttpSession session) {

        Users user = (Users) session.getAttribute("user");
        engagemajorrelease.setChanger(user.getTrueName());
        engagemajorrelease.setChangetime(new Date());

        System.out.println(engagemajorrelease);

        return engageMajorReleaseService.updMajor(engagemajorrelease);

    }

    //删除职位
    @ResponseBody
    @RequestMapping("delMajor")
    public Msg delMajor(int majorId) {
        return engageMajorReleaseService.delMajoe(majorId);
    }


}
