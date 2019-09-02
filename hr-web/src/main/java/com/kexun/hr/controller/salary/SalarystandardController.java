package com.kexun.hr.controller.salary;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.github.pagehelper.PageInfo;
import com.kexun.hr.model.Msg;
import com.kexun.hr.model.Salarystandard;
import com.kexun.hr.model.Salarystandarddetails;
import com.kexun.hr.service.salary.SalaryStandardService;
import com.kexun.hr.service.salary.SalarystandarddetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("salarystandardController")
public class SalarystandardController {


    @Autowired
    private SalarystandarddetailsService salarystandarddetailsService;

    @Autowired
    private SalaryStandardService salaryStandardService;

    //不分页查询所有已经通过复核的薪酬标准
    @ResponseBody
    @RequestMapping("findByCheckStatus")
    public List<Salarystandard> findByCheckStatus() {


        return salaryStandardService.findByCheckStatus(1);

    }


    //薪酬标准登记界面
    @RequestMapping(value = "registerSalary", method = RequestMethod.GET)
    public String registerSalary(Model model) {

        //查询所有未分配的薪酬项目standardId=0
        List<Salarystandarddetails> salarystandarddetails = salarystandarddetailsService.findBystandardId("0");

        model.addAttribute("s", salarystandarddetails);


        return "registerSalary";

    }

    //执行登记 设置状态为未复核
    @ResponseBody
    @RequestMapping(value = "registerSalary", method = RequestMethod.POST)
    public Msg registerSalary(Salarystandard salarystandard, HttpSession session, String project) {
        //得到了上传项目的集合
        List<Salarystandarddetails> salarystandarddetails = JSON.parseObject(project, new TypeReference<List<Salarystandarddetails>>() {
        });
        return salaryStandardService.registerSalary(salarystandard, session, salarystandarddetails);
    }

    //薪酬标准复核 列表 查询所有未复核状态的标准
    @RequestMapping("findNoChange")
    public String findNoChange(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
        PageInfo<Salarystandard> pageInfo = salaryStandardService.findByCheckStatus(0, page);
        model.addAttribute("pageInfo", pageInfo);
        return "findNoChange";
    }


    //点击复核按钮进入 查询薪酬详情
    @RequestMapping(value = "review", method = RequestMethod.GET)
    public String review(String standardid, Model model) {
        //查询详情 根据id
        Salarystandard standard = salaryStandardService.findById(standardid);


        //查询所有未分配的薪酬项目standardId=standardid的薪酬项目
        List<Salarystandarddetails> salarystandarddetails = salarystandarddetailsService.findBystandardId(standardid);

        model.addAttribute("s", salarystandarddetails);

        model.addAttribute("standard", standard);


        return "salaryReview";
    }

    @ResponseBody
    @RequestMapping(value = "review", method = RequestMethod.POST)
    public Msg review(Salarystandard salarystandard, HttpSession session, String project) {

        //得到了上传项目的集合
        List<Salarystandarddetails> salarystandarddetails = JSON.parseObject(project, new TypeReference<List<Salarystandarddetails>>() {
        });
        return salaryStandardService.review(salarystandard, session, salarystandarddetails);


    }

    //查询通过了复核的
    @RequestMapping("compensationStandards")
    public String compensationStandards(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
        PageInfo<Salarystandard> pageInfo = salaryStandardService.findByCheckStatus(1, page);
        model.addAttribute("pageInfo", pageInfo);
        return "compensationStandards";
    }

    //查看详情
    @RequestMapping("details")
    public String details(String standardid, Model model) {
        //查询详情 根据id
        Salarystandard standard = salaryStandardService.findById(standardid);

        //查询所有未分配的薪酬项目standardId=standardid的薪酬项目
        List<Salarystandarddetails> salarystandarddetails = salarystandarddetailsService.findBystandardId(standardid);

        model.addAttribute("s", salarystandarddetails);

        model.addAttribute("standard", standard);

        return "salaryDetails";
    }


    //查询所有的 并且分页 可以进行修改操作
    @RequestMapping("findAllSalary")
    public String findAllSalary(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {

        PageInfo<Salarystandard> pageInfo = salaryStandardService.findAllSalary(page);

        model.addAttribute("pageInfo", pageInfo);

        return "salaryList";

    }

    //到修改界面
    @RequestMapping(value = "updSalary", method = RequestMethod.GET)
    public String updSalary(String standardid, Model model) {
        //查询详情 根据id
        Salarystandard standard = salaryStandardService.findById(standardid);

        //查询所有未分配的薪酬项目standardId=standardid的薪酬项目
        List<Salarystandarddetails> salarystandarddetails = salarystandarddetailsService.findBystandardId(standardid);

        model.addAttribute("s", salarystandarddetails);

        model.addAttribute("standard", standard);

        return "updSalary";

    }

    //执行更新操作
    @ResponseBody
    @RequestMapping(value = "updSalary", method = RequestMethod.POST)
    public Msg updSalary(Salarystandard salarystandard, HttpSession session, String project) {

        //得到了上传项目的集合
        List<Salarystandarddetails> salarystandarddetails = JSON.parseObject(project, new TypeReference<List<Salarystandarddetails>>() {
        });

        return salaryStandardService.updSalary(salarystandard, session, salarystandarddetails);

    }


}
