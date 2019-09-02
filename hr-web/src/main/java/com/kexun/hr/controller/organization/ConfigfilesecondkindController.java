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
import com.kexun.hr.model.Msg;
import com.kexun.hr.service.organization.ConfigfilesecondkindService;
import com.kexun.hr.service.organization.ConfigfilefirstkindService;;
/*
 * 二级机构控制层
 */
@Controller
@RequestMapping("Configfilesecondkind")
public class ConfigfilesecondkindController {
	
	@Autowired
	private ConfigfilefirstkindService configfilefirstkindService;
	@Autowired
	private ConfigfilesecondkindService configfilesecondkindService;

	// 根据一级机构的id查询二级机构
	@ResponseBody
	@RequestMapping("findByFirstKindId")
	public List<Configfilesecondkind> findByFirstKindId(Integer firstKindId) {
		if(firstKindId==null) {
			firstKindId=0;
		}
		
		System.out.println("------"+firstKindId+"-------");
		List<Configfilesecondkind> findByFirstKindId = configfilesecondkindService.findByFirstKindId(firstKindId);
	
		return findByFirstKindId;
	}

	// 查询所有二级机构分页
	@RequestMapping("findByFirstKindQueryAll")
	public String findByFirstKindQueryAll(@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "size", defaultValue = "5") int size, Model model) {

		PageInfo<Map<String, Object>> pageInfo = configfilesecondkindService.configfilesecondkind(page, size);
		model.addAttribute("pageInfo", pageInfo);
		System.out.println(pageInfo);
		return "configfilesecondkind";
	}
	// 跳到添加的界面

	@RequestMapping(value = "configfilesecondkindadd", method = RequestMethod.GET)
	public String configfilesecondkindadd(Model model) {

		List<Configfilesecondkind> roles = configfilesecondkindService.findConfigfilesecondkindkind();
		List<Configfilefirstkind> roles2 = configfilefirstkindService.findConfigfilefirstkind();
		model.addAttribute("roles", roles);
		model.addAttribute("roles2", roles2);
		return "configfilesecondkindadd";
	}

	// 添加II级机构
	@ResponseBody
	@RequestMapping(value = "configfilesecondkindadd", method = RequestMethod.POST)
	public Msg configfilesecondkindadd2(Configfilesecondkind configfilesecondkind) {

		return configfilesecondkindService.insertSelective(configfilesecondkind);
	}
	//删除机构
		 @RequestMapping("deletefigfilesecondkind")
		    @ResponseBody
		    public Msg deletefigfilesecondkind(@RequestParam(value = "secondkindid", required = true) int secondkindid) {

		        return configfilesecondkindService.deleteByPrimaryKey(secondkindid);

		    }
		//去修改界面
		 @RequestMapping(value = "configfilesecondkindmodify", method = RequestMethod.GET)
		    public String updConfigfilesecondkind(Model model, @RequestParam(value = "secondkindid", required = true) int secondkindid) {
		        
		        //根据id查询
		    Map<String, Object> configfilesecond = configfilesecondkindService.findConfigfilesecondkindById(secondkindid);  
		        model.addAttribute("configfilesecond", configfilesecond);

		        return "configfilesecondkindmodify";
		    }
		 //执行修改

		    @ResponseBody
		    @RequestMapping(value = "configfilesecondkindmodify", method = RequestMethod.POST)
		    public Msg updConconfigfilesecondkind(Configfilesecondkind configfilesecondkind) { 
		        return configfilesecondkindService.updateByPrimaryKeySelective(configfilesecondkind);
		    }
}
