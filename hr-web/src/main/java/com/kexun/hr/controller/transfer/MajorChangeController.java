package com.kexun.hr.controller.transfer;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.kexun.hr.model.Configmajorkind;
import com.kexun.hr.model.Humanfile;
import com.kexun.hr.model.Majorchange;
import com.kexun.hr.model.Msg;
import com.kexun.hr.model.Salarystandard;
import com.kexun.hr.model.Salarystandarddetails;
import com.kexun.hr.model.Users;
import com.kexun.hr.service.manpowerResource.HumanFileService;
import com.kexun.hr.service.position.ConfigmajorkindService;
import com.kexun.hr.service.salary.SalaryStandardService;
import com.kexun.hr.service.salary.SalarystandarddetailsService;
import com.kexun.hr.service.transfer.MajorchangeService;

/*
 * 职位调动管理控制层
 */
@Controller
@RequestMapping("MajorChangeController")
public class MajorChangeController {

    //人力资源档案服务
    @Autowired
    private HumanFileService fileService;

    //调动管理服务
    @Autowired
    private MajorchangeService majorchangeService;


    //薪酬标准服务
    @Autowired
    private SalaryStandardService salaryStandardService;

    //查询所有人力资源档案 (已复核通过的并且不是删除状态的)
    @RequestMapping("findMajorChangeControllerAll")
    public String findMajorChangeControllerAll(@RequestParam(value = "page", defaultValue = "1") int page,
                                               @RequestParam(value = "size", defaultValue = "5") int size, Model model, @RequestParam(value = "firstKindId", required = false) Integer firstKindId,
                                               @RequestParam(value = "secondKindId", required = false) Integer secondKindId,
                                               @RequestParam(value = "thirdKindId", required = false) Integer thirdKindId,
                                               @RequestParam(value = "registTime", required = false) String registTime,
                                               @RequestParam(value = "registTimetwo", required = false) String registTimetwo) {

        //条件查询
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("firstKindId", firstKindId);
        map.put("secondKindId", secondKindId);
        map.put("thirdKindId", thirdKindId);
        map.put("registTime", registTime);
        map.put("registTimetwo", registTimetwo);
        PageInfo<Map<String, Object>> findByMoreIfMajorchange = majorchangeService.findByMoreIfMajorchange(map, page, size);
        model.addAttribute("pageinfo", findByMoreIfMajorchange);
        return "diaodongdengji";
    }

    //根据主键查询单个对象 （进行调动）
    @RequestMapping("selectByPrimaryKeyMoreTable_diaodong")
    public String selectByPrimaryKeyMoreTable_diaodong(Model model, Integer humanid) {
        Map<String, Object> selectByPrimaryKeyMoreTable = fileService.selectByPrimaryKeyMoreTable(humanid);
        model.addAttribute("hdiaodong", selectByPrimaryKeyMoreTable);

        List<Salarystandard> findByCheckStatus = salaryStandardService.findByCheckStatus(1);

        model.addAttribute("xcxm", findByCheckStatus);
        return "diaodongjiemian";
    }

    //查询薪酬标准对应的总额
    @RequestMapping(value = "selectByStandardIdsalarySum", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public double selectByStandardIdsalarySum(String standardId) {
        Salarystandard findById = salaryStandardService.findById(standardId);
        return findById.getSalarysum();
    }

    //实行调动
    @ResponseBody
    @RequestMapping(value = "SavemajorChange", method = RequestMethod.POST)
    public Msg SavemajorChange(Majorchange majorchange, Humanfile humanfile, HttpSession httpSession) {

        System.out.println(">>>>>>>" + majorchange);
        //修改人力资源表数据
        humanfile.setThirdkindid(majorchange.getNewthirdkindid());
        humanfile.setHumanmajorid(majorchange.getNewmajorid());
        humanfile.setSalarystandardid(majorchange.getNewsalarystandardid());
        humanfile.setSalarysum(majorchange.getNewsalarysum());
        humanfile.setMajorchangeamount(1);
        fileService.updateHumanfile(humanfile);


        //插入登记人
        Users attribute = (Users) httpSession.getAttribute("user");
        majorchange.setRegister(attribute.getuName());
        //插入登记时间
        majorchange.setRegisttime(new Date());
        //插入默认状态（0未审核通过）
        majorchange.setCheckstatus(0);
        return majorchangeService.insertSelective(majorchange);
    }

    //查询未审核通过的所有数据
    @RequestMapping("findByMajorChangeCheckStatusNo")
    public String findByMajorChangeCheckStatusNo(@RequestParam(value = "page", defaultValue = "1") int page,
                                                 @RequestParam(value = "size", defaultValue = "5") int size, Model model) {
        PageInfo<Map<String, Object>> findByMajorChangeCheckStatusNo = majorchangeService.findByMajorChangeCheckStatusNo(page, size);
        model.addAttribute("pageinfo", findByMajorChangeCheckStatusNo);
        return "diaodongshenhe";
    }

    //根据主键查询单个对象
    @RequestMapping("selectByKeyMajorChangeck")
    public String selectByKeyMajorChangeck(Integer mchId, Model model) {
        Map<String, Object> selectByKeyMajorChangeck = majorchangeService.selectByKeyMajorChangeck(mchId);
        model.addAttribute("mc", selectByKeyMajorChangeck);

        //查询薪酬标准
        List<Salarystandard> findByCheckStatus = salaryStandardService.findByCheckStatus(1);
        model.addAttribute("xcxm", findByCheckStatus);
        return "diaodongshenheanniu";
    }

    //进行审核修改
    @RequestMapping(value = "updateByKeyMajorChangeck", method = RequestMethod.POST)
    @ResponseBody
    public Msg updateByKeyMajorChangeck(Majorchange majorchange, HttpSession httpSession) {
        //插入审核人
        Users attribute = (Users) httpSession.getAttribute("user");
        majorchange.setRegister(attribute.getuName());

        //插入审核时间
        majorchange.setChecktime(new Date());

        //插入审核状态
        majorchange.setCheckstatus(1);
        Msg updateByKeyMajorChangeck = majorchangeService.updateByKeyMajorChangeck(majorchange);
        return updateByKeyMajorChangeck;
    }

    //查询已审核通过的数据
    @RequestMapping("findByMajorChangeCheckStatusYes")
    public String findByMajorChangeCheckStatusYes(@RequestParam(value = "page", defaultValue = "1") int page,
                                                  @RequestParam(value = "size", defaultValue = "5") int size, Model model,
                                                  @RequestParam(value = "firstKindId", required = false) Integer firstKindId,
                                                  @RequestParam(value = "secondKindId", required = false) Integer secondKindId,
                                                  @RequestParam(value = "thirdKindId", required = false) Integer thirdKindId,
                                                  @RequestParam(value = "majorKindId", required = false) Integer majorKindId,
                                                  @RequestParam(value = "newMajorId", required = false) Integer newMajorId,
                                                  @RequestParam(value = "registTime", required = false) String registTime,
                                                  @RequestParam(value = "registTimetwo", required = false) String registTimetwo) {

        //条件查询
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("firstKindId", firstKindId);
        map.put("secondKindId", secondKindId);
        map.put("thirdKindId", thirdKindId);
        map.put("majorKindId", majorKindId);
        map.put("newMajorId", newMajorId);
        map.put("registTime", registTime);
        map.put("registTimetwo", registTimetwo);
        PageInfo<Map<String, Object>> findByMoreIfMajorchange = majorchangeService.findByMajorChangeCheckStatusYes(map, page, size);
        model.addAttribute("pageinfo", findByMoreIfMajorchange);
        return "diaodongchaxun";
    }

    //根据主键查询单个对象  进行查看
    @RequestMapping(value = "selectByKeySingleMajorchange", method = RequestMethod.GET)
    public String selectByKeySingleMajorchange(Integer mchid, Model model) {
        Map<String, Object> selectByKeyMajorChangeck = majorchangeService.selectByKeySingleMajorchange(mchid);
        model.addAttribute("More", selectByKeyMajorChangeck);
        System.out.println(selectByKeyMajorChangeck);
        return "diaodongchaxunchakananniu";
    }
}
