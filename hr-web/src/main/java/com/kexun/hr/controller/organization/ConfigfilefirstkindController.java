package com.kexun.hr.controller.organization;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.filter.HttpPutFormContentFilter;

import com.github.pagehelper.PageInfo;
import com.kexun.hr.model.Configfilefirstkind;
import com.kexun.hr.model.Msg;
import com.kexun.hr.model.Role;
import com.kexun.hr.model.Users;
import com.kexun.hr.service.organization.ConfigfilefirstkindService;

//一级机构controller层
@Controller
@RequestMapping("Configfilefirstkind")
public class ConfigfilefirstkindController {

	@Autowired
	private ConfigfilefirstkindService configfilefirstkindService;
	

	
	//查询一级机构所有信息
	@RequestMapping("findConfigfilefirstkind")
	@ResponseBody
	public List<Configfilefirstkind> findConfigfilefirstkind(){
		
		List<Configfilefirstkind> findConfigfilefirstkind = configfilefirstkindService.findConfigfilefirstkind();
		return configfilefirstkindService.findConfigfilefirstkind();
	}
	
	//查询所有一级机构分页
	@RequestMapping("QueryAllConfigfilefirstkind")
	public String QueryAllConfigfilefirstkind(@RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "size", defaultValue = "5") int size, Model model) {
		 PageInfo<Configfilefirstkind> pageInfo= (PageInfo<Configfilefirstkind>) configfilefirstkindService.findConfigfilefirstkind2(page,size);
		 model.addAttribute("pageInfo", pageInfo);
		return "configfilefirstkind";
	}
	
	//跳到添加的界面
		
		@RequestMapping(value="configfilefirstkindadd",method=RequestMethod.GET)
		public String configfilefirstkindadd(Model model) {
				
			 List<Configfilefirstkind> roles =
					 configfilefirstkindService.findConfigfilefirstkind();
		        model.addAttribute("roles", roles);
		        return "configfilefirstkindadd";
		}
	//添加I级机构
	@ResponseBody
	@RequestMapping(value="configfilefirstkindadd",method=RequestMethod.POST)
	public Msg ConfigfilefirstkindAdd2(Configfilefirstkind configfilefirstkind) {
			
		return configfilefirstkindService.insertSelective(configfilefirstkind);
	}
	//删除机构
	 @RequestMapping("deleterconfigfilefirstkin")
	    @ResponseBody
	    public Msg deleterconfigfilefirstkin(@RequestParam(value = "firstkindid", required = true) int firstkindid) {

	        return configfilefirstkindService.deleteByPrimaryKey(firstkindid);

	    }
	//去修改界面
	 @RequestMapping(value = "configfilefirstkindmodify", method = RequestMethod.GET)
	    public String updUser(Model model, @RequestParam(value = "firstkindid", required = true) int firstkindid) {
	        
	        //根据id查询
	      Configfilefirstkind configfilefirst = configfilefirstkindService.findUserById(firstkindid);	   
	        model.addAttribute("configfilefirst", configfilefirst);

	        return "configfilefirstkindmodify";
	    }
	 //执行修改

	    @ResponseBody
	    @RequestMapping(value = "configfilefirstkindmodify", method = RequestMethod.POST)
	    public Msg updconfigfilefirstkind(Configfilefirstkind configfilefirstkind) { 
	        return configfilefirstkindService.updateByPrimaryKeySelective(configfilefirstkind);
	    }
}
