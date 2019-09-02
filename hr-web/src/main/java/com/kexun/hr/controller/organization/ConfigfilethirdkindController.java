package com.kexun.hr.controller.organization;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.kexun.hr.model.Configfilefirstkind;
import com.kexun.hr.model.Configfilesecondkind;
import com.kexun.hr.model.Configfilethirdkind;
import com.kexun.hr.model.Msg;
import com.kexun.hr.service.organization.ConfigfilethirdkindService;
import com.kexun.hr.service.organization.ConfigfilefirstkindService;
import com.kexun.hr.service.organization.ConfigfilesecondkindService;
/*
 * 三级机构控制层
 */
@Controller
@RequestMapping("Configfilethirdkind")
public class ConfigfilethirdkindController {
	
	@Autowired
	private ConfigfilefirstkindService configfilefirstkindService;
	@Autowired
	private ConfigfilesecondkindService configfilesecondkindService;
	@Autowired
	private ConfigfilethirdkindService configfilethirdkindService;
	
	// 根据二级机构的id查询三级机构的信息
	@ResponseBody
	@RequestMapping("findBysecondKindIdConfigfilethirdkind")
	public List<Configfilethirdkind> findBysecondKindIdConfigfilethirdkind(Integer secondkindid) {

		return configfilethirdkindService.findBysecondKindIdConfigfilethirdkind(secondkindid);

	}

	// 查询所有三级机构分页
	@RequestMapping("configfilethirdkindQueryAll")
	public String findByFirstKindQueryAll(@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "size", defaultValue = "5") int size, Model model) {

		PageInfo<Map<String, Object>> pageInfo = configfilethirdkindService.configfilethirdkind(page, size);
		model.addAttribute("pageInfo", pageInfo);

		return "configfilethirdkind";
	}
	// 跳到添加的界面

	@RequestMapping(value = "configfilethirdkindadd", method = RequestMethod.GET)
	public String configfilesecondkindadd(Model model) {

		List<Configfilefirstkind> roles = configfilefirstkindService.findConfigfilefirstkind();
		List<Configfilesecondkind> roles2 = configfilesecondkindService.findConfigfilesecondkindkind();
		model.addAttribute("roles", roles);
		model.addAttribute("roles2", roles2);
		return "configfilethirdkindAdd";
	}

	// 添加III级机构
	@ResponseBody
	@RequestMapping(value = "configfilethirdkindadd", method = RequestMethod.POST)
	public Msg configfilesecondkindadd2(Configfilethirdkind configfilethirdkind) {

		return configfilethirdkindService.insertSelective(configfilethirdkind);
	}
	
	//删除机构
	 @RequestMapping("deleteconfigfilethirdkind")
	    @ResponseBody
	    public Msg deletefigfilesecondkind(@RequestParam(value = "thirdkindid", required = true) int thirdkindid) {

	        return configfilethirdkindService.deleteByPrimaryKey(thirdkindid);

	    }
	//去修改界面
	 @RequestMapping(value = "configfilethirdkindmodify", method = RequestMethod.GET)
	    public String updConfigfilesecondkind(Model model, @RequestParam(value = "thirdkindid", required = true) int thirdkindid) {
	        
	        //根据id查询
	    Map<String, Object> configfilethird = configfilethirdkindService.findConfigfilesecondkindById(thirdkindid);  
	        model.addAttribute("configfilethird", configfilethird);

	        return "configfilethirdkindmodify";
	    }
	 //执行修改

	    @ResponseBody
	    @RequestMapping(value = "configfilethirdkindmodify", method = RequestMethod.POST)
	    public Msg updConconfigfilesecondkind(Configfilethirdkind Configfilethirdkind) { 
	        return configfilethirdkindService.updateByPrimaryKeySelective(Configfilethirdkind);
	    }
}
