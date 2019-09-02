package com.kexun.hr.controller.salary;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.github.pagehelper.PageInfo;
import com.kexun.hr.model.Msg;
import com.kexun.hr.model.Salarygrant;
import com.kexun.hr.model.Salarygrantdetails;
import com.kexun.hr.model.Users;
import com.kexun.hr.service.salary.SalaryGrantService;
import com.kexun.hr.service.salary.SalaryGrantdetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

//薪酬发放登记
@Controller
@RequestMapping("salaryGrant")
public class SalaryGrantController {

    @Autowired
    private SalaryGrantService salaryGrantService;


    @Autowired
    private SalaryGrantdetailsService salaryGrantdetailsService;


    //去薪酬发放登记 查询 根据机构查询 并统计人数 	基本薪酬总额(元)
    @RequestMapping("payrollRegistrationList")
    public String payrollRegistrationList(@RequestParam(value = "organization", defaultValue = "1") int organization, Model model) {

        List<Map<String, Object>> list = salaryGrantService.findPayrollRegistrationList(organization);

        model.addAttribute("list", list);

        model.addAttribute("organization", organization);


        return "payrollRegistrationList";

    }


    //点击登记按钮 根据机构级别和机构编号查询 人力资源
    @RequestMapping("register")
    public String register(int pid, String organization, int count, double salary, int rank, Model model) {

        List<Map<String, Object>> humanfileList = salaryGrantService.findHuman(pid, rank);

        model.addAttribute("humanfile", humanfileList);

        //生成薪酬发放单编号

        String salaryGrantId = "SG" + System.currentTimeMillis();

        model.addAttribute("salaryGrantId", salaryGrantId);

        model.addAttribute("organization", organization);

        model.addAttribute("count", count);

        model.addAttribute("salary", salary);

        //机构id
        model.addAttribute("organizationId", pid);

        //机构级别
        model.addAttribute("rank", rank);

        return "payrollRegistration";

    }

    //保存salaryGrant
    @ResponseBody
    @RequestMapping("payoff")
    public Msg payoff(String salaryGrant, String salaryGrantDetails, HttpSession session) {


        List<Salarygrantdetails> salaryGrantDetailsList = JSON.parseObject(salaryGrantDetails, new TypeReference<List<Salarygrantdetails>>() {
        });

        Salarygrant salarygrant = JSON.parseObject(salaryGrant, Salarygrant.class);

        System.out.println(salaryGrant);

        Users user = (Users) session.getAttribute("user");


        return salaryGrantService.payoff(salarygrant, salaryGrantDetailsList, user.getTrueName());

//        return new Msg().success("成功");

    }

    //查询未复核的salaryGrant
    @RequestMapping("noCheck")
    public String noCheck(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {

        PageInfo<Map<String, Object>> pageInfo = salaryGrantService.findByCheckStatus(0, page);

        model.addAttribute("pageInfo", pageInfo);

        return "noChecksalaryGrantList";

    }

    //点击复核按钮 根据salaryGrantId 查询salaryGrantDetails表
    @RequestMapping(value = "review", method = RequestMethod.GET)
    public String review(Model model, String salaryGrantId, int humanAmount, double salaryStandardSum) {

        List<Map<String, Object>> salaryGrantDetails = salaryGrantdetailsService.findBysalaryGrantId(salaryGrantId);

        model.addAttribute("salaryGrantDetails", salaryGrantDetails);

        model.addAttribute("salaryGrantId", salaryGrantId);

        model.addAttribute("humanAmount", humanAmount);

        model.addAttribute("salaryStandardSum", salaryStandardSum);

        return "reviewSalaryGrant";
    }


    //点击通过 传入salaryGrantDetails 字符串 和 salaryGrantId

    @ResponseBody
    @RequestMapping(value = "review", method = RequestMethod.POST)
    public Msg review(String salaryGrantId, String salaryGrantDetails, HttpSession session) {


        List<Salarygrantdetails> salaryGrantDetailsList = JSON.parseObject(salaryGrantDetails, new TypeReference<List<Salarygrantdetails>>() {
        });

        System.out.println(salaryGrantId);

        System.out.println(salaryGrantDetailsList);


        Users user = (Users) session.getAttribute("user");

        return salaryGrantService.review(salaryGrantId, salaryGrantDetailsList, user.getTrueName());


//        return new Msg().success("success");

    }

    //查询已经通过的
    //查询复核的salaryGrant
    @RequestMapping("reviewBy")
    public String reviewBy(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {

        PageInfo<Map<String, Object>> pageInfo = salaryGrantService.findByCheckStatus(1, page);

        model.addAttribute("pageInfo", pageInfo);

        return "salaryReviewBy";

    }

    @RequestMapping("details")
    public String details(Model model, String salaryGrantId, int humanAmount, double salaryStandardSum) {
        List<Map<String, Object>> salaryGrantDetails = salaryGrantdetailsService.findBysalaryGrantId(salaryGrantId);

        model.addAttribute("salaryGrantDetails", salaryGrantDetails);

        model.addAttribute("salaryGrantId", salaryGrantId);

        model.addAttribute("humanAmount", humanAmount);

        model.addAttribute("salaryStandardSum", salaryStandardSum);

        return "salaryGrantDetails";

    }

}
