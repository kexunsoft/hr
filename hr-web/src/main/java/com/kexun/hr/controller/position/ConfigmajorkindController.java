package com.kexun.hr.controller.position;

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
import com.kexun.hr.model.Configfilethirdkind;
import com.kexun.hr.model.Configmajorkind;
import com.kexun.hr.model.Msg;
import com.kexun.hr.service.position.ConfigmajorkindService;

/*
 * 职位分类控制层
 */
@Controller
@RequestMapping("Configmajorkind")
public class ConfigmajorkindController {

	@Autowired
	private ConfigmajorkindService configmajorkindService;

	// 查询所有职位分类
	@ResponseBody
	@RequestMapping("findConfigmajorkind")
	public List<Configmajorkind> findConfigmajorkind() {
		return configmajorkindService.findConfigmajorkind();
	}

	// 查询所有
	@RequestMapping("configmajorkindQueryAll")
	public String configmajorkindQueryAll(@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "size", defaultValue = "5") int size, Model model) {

		PageInfo<Map<String, Object>> pageInfo = configmajorkindService.configmajorkind(page, size);
		model.addAttribute("pageInfo", pageInfo);

		return "configmajorkind";
	}

	// 删除

	@RequestMapping("deleteconfigmajorkind")
	@ResponseBody
	public Msg deleteconfigmajordesignation(@RequestParam(value = "majorkindid", required = true) int majorkindid) {

		return configmajorkindService.deletemajorkindidKey(majorkindid);

	}
	// 跳到添加的界面

		@RequestMapping(value = "configmajorkindAdd", method = RequestMethod.GET)
		public String configfilesecondkindadd(Model model) {

			List<Configmajorkind> roles = configmajorkindService.findConfigmajorkind();
			model.addAttribute("roles", roles);
			return "configmajorkindAdd";
		}

		// 添加职位分类
		@ResponseBody
		@RequestMapping(value = "configmajorkindAdd", method = RequestMethod.POST)
		public Msg configfilesecondkindadd2(Configmajorkind configmajorkind) {

			return configmajorkindService.insertSelective(configmajorkind);
		}
	
}
