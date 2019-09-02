package com.kexun.hr.controller.commonality;

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
import com.kexun.hr.model.Configpublicchar;
import com.kexun.hr.model.Msg;
import com.kexun.hr.service.commonality.ConfigpubliccharService;

/*
 * 公共字段控制层
 */

@Controller
@RequestMapping("Configpublicchar")
public class ConfigpubliccharController {

	@Autowired
	private ConfigpubliccharService configpubliccharService;

	// 查询所有学历
	@ResponseBody
	@RequestMapping("findConfigpubliccharXueli")
	public List<Configpublicchar> findConfigpubliccharXueli(String attributekind) {
		return configpubliccharService.findConfigpubliccharXueli(attributekind);
	}

	// 查询所有属性分页
	@RequestMapping("configpubliccharQueryAll")
	public String findByFirstKindQueryAll(@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "size", defaultValue = "5") int size, Model model) {

		PageInfo<Map<String, Object>> pageInfo = configpubliccharService.configmajorkind(page, size);
		model.addAttribute("pageInfo", pageInfo);

		return "configpublicchar";
	}

	// 删除
	@RequestMapping("deleteconfigpublicchar")
	@ResponseBody
	public Msg deletefigfilesecondkind(@RequestParam(value = "pbcid", required = true) int pbcid) {

		return configpubliccharService.deleteConfigpubliccharKey(pbcid);

	}

	// 跳到添加的界面

	@RequestMapping(value = "configpubliccharadd", method = RequestMethod.GET)
	public String configfilesecondkindadd(Model model) {

		List<Map<String, Object>> roles = configpubliccharService.findConfigpublicchar();
		model.addAttribute("roles", roles);
		return "configpubliccharAdd";
	}

	// 添加属性
	@ResponseBody
	@RequestMapping(value = "configpubliccharadd", method = RequestMethod.POST)
	public Msg configfilesecondkindadd2(Configpublicchar configpublicchar) {

		return configpubliccharService.insertSelective(configpublicchar);
	}
}
