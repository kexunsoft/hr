package com.kexun.hr.controller.resume;

import com.github.pagehelper.PageInfo;
import com.kexun.hr.model.Configpublicchar;
import com.kexun.hr.model.Engageresume;
import com.kexun.hr.model.Msg;
import com.kexun.hr.model.Users;
import com.kexun.hr.service.commonality.ConfigpubliccharService;
import com.kexun.hr.service.resume.EngageResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("engageResume")
public class EngageResumeController {

    @Autowired
    private ConfigpubliccharService configpubliccharService;

    @Autowired
    private EngageResumeService engageResumeService;

    //添加简历
    @RequestMapping(value = "register", method = RequestMethod.POST)
    @ResponseBody
    public Msg registerResume(Engageresume engageresume, @RequestParam("file") MultipartFile multipartFile, HttpServletRequest request, HttpSession session) {
        //获取时间戳+文件的全名
        String fileNaname = System.currentTimeMillis() + multipartFile.getOriginalFilename();
        //获取tomcat容器路径
        String path = request.getRealPath("images/resume/" + fileNaname);
        //设置照片路径
        engageresume.setHumanpicture("/hr/images/resume/" + fileNaname);
        //设置状态为未复核
        engageresume.setCheckstatus(0);

        //获取当前登录的用户
        Users user = (Users) session.getAttribute("user");

        //设置登记人为当前用户的真实姓名
        engageresume.setRegister(user.getTrueName());

        //设置登记时间为当前时间
        engageresume.setRegisttime(new Date());

        try {
            System.out.println(path);
            multipartFile.transferTo(new File(path));
        } catch (IOException e) {
            e.printStackTrace();
            return new Msg().error("文件保存失败");
        }
        System.out.println(engageresume);
        return engageResumeService.registerResume(engageresume);

    }

    //到简历添加界面
    @RequestMapping(value = "register", method = RequestMethod.GET)
    public String registerResume(Model model) {

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


        return "addResume";
    }


    //到简历筛选列表 条件查询
    @RequestMapping("resumeFilterList")
    public String resumeFilterList(@RequestParam(value = "majorKindId", defaultValue = "0") int majorKindId, @RequestParam(value = "majorId", defaultValue = "0") int majorId, @RequestParam(value = "keyword", required = false) String keyword, @RequestParam(value = "startDate", required = false) String startDate, @RequestParam(value = "endDate", required = false) String endDate, @RequestParam(value = "page", defaultValue = "1") int page,
                                   @RequestParam(value = "size", defaultValue = "5") int size, Model model) {

        PageInfo<Map<String, Object>> pageInfo = engageResumeService.findByExample(majorKindId, majorId, keyword, startDate, endDate, page, size);

        model.addAttribute("pageInfo", pageInfo);

        return "resumeFilterList";

    }


    //简历筛选复核 页面
    @RequestMapping(value = "resumeScreeningReview", method = RequestMethod.GET)
    public String resumeScreeningReview(int resumeId, Model model) {

        Map<String, Object> resume = engageResumeService.findOneById(resumeId);


        model.addAttribute("resume", resume);


        return "resumeScreeningReview";
    }

    //有效简历按钮
    @ResponseBody
    @RequestMapping("effectiveResume")
    public Msg effectiveResume(Engageresume engageresume, HttpSession session) {
        Users user = (Users) session.getAttribute("user");

        engageresume.setCheckstatus(1);
        engageresume.setChecker(user.getTrueName());
        engageresume.setChecktime(new Date());
        //设置面试状态为待面试
        engageresume.setInterviewstatus(0);

        return engageResumeService.effectiveResume(engageresume);

    }

    //有效简历列表
    @RequestMapping("effectiveResumeList")
    public String effectiveResumeList(@RequestParam(value = "majorKindId", defaultValue = "0") int majorKindId, @RequestParam(value = "majorId", defaultValue = "0") int majorId, @RequestParam(value = "keyword", required = false) String keyword, @RequestParam(value = "startDate", required = false) String startDate, @RequestParam(value = "endDate", required = false) String endDate, @RequestParam(value = "page", defaultValue = "1") int page,
                                      @RequestParam(value = "size", defaultValue = "5") int size, Model model) {

        PageInfo<Map<String, Object>> pageInfo = engageResumeService.effectiveResumeList(majorKindId, majorId, keyword, startDate, endDate, page, size);

        model.addAttribute("pageInfo", pageInfo);

        return "effectiveResumeList";

    }

    //查询有效简历详情

    @RequestMapping("resumeInfo")
    public String resumeInfo(int resumeId, Model model) {

        Map<String, Object> resume = engageResumeService.findOneById(resumeId);

        model.addAttribute("resume", resume);

        return "resumeInfo";
    }

    //推荐面试按钮 修改面试状态为面试转态为
    @ResponseBody
    @RequestMapping("recommendTheInterview")
    public Msg recommendTheInterview(Engageresume engageresume) {

        //设置面试状态为推荐面试
        engageresume.setInterviewstatus(1);

        return engageResumeService.recommendTheInterview(engageresume);

    }


}
