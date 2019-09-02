package com.kexun.hr.controller.salary;

import com.github.pagehelper.PageInfo;
import com.kexun.hr.model.Configpublicchar;
import com.kexun.hr.model.Msg;
import com.kexun.hr.model.Salarystandarddetails;
import com.kexun.hr.service.salary.SalarystandarddetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/*
 * 薪酬标准信息控制层
 */
@Controller
@RequestMapping("Salarystandarddetails")
public class SalarystandarddetailsController {


    @Autowired
    private SalarystandarddetailsService salarystandarddetailsService;

    //查询所有薪酬项目
    @ResponseBody
    @RequestMapping("findSalarystandarddetails")
    private List<Salarystandarddetails> findSalarystandarddetails() {
        return salarystandarddetailsService.findSalarystandarddetails();
    }

    // 查询所有薪酬项目分页
    @RequestMapping("salarystandarddetailsAll")
    public String salarystandarddetailsAll(@RequestParam(value = "page", defaultValue = "1") int page,
                                           @RequestParam(value = "size", defaultValue = "5") int size, Model model) {

        PageInfo<Map<String, Object>> pageInfo = salarystandarddetailsService.configmajorkind(page, size);
        model.addAttribute("pageInfo", pageInfo);

        return "salarystandarddetails";
    }

    // 删除
    @RequestMapping("deleteSalarystandarddetails")
    @ResponseBody
    public Msg deletefigfilesecondkind(@RequestParam(value = "itemid", required = true) int itemid) {

        return salarystandarddetailsService.deleteSalarystandarddetailsKey(itemid);

    }

    // 跳到添加的界面

    @RequestMapping(value = "salarystandarddetailsadd", method = RequestMethod.GET)
    public String configfilesecondkindadd(Model model) {

        List<Salarystandarddetails> roles = salarystandarddetailsService.findSalarystandarddetails();
        model.addAttribute("roles", roles);
        return "salarystandarddetailsAdd";
    }

    // 添加属性
    @ResponseBody
    @RequestMapping(value = "salarystandarddetailsadd", method = RequestMethod.POST)
    public Msg configfilesecondkindadd2(Salarystandarddetails salarystandarddetails) {
        //设置为0
        salarystandarddetails.setStandardid("0");
        return salarystandarddetailsService.insertSelective(salarystandarddetails);
    }
}
