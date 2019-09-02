package com.kexun.hr.controller.position;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.kexun.hr.model.Configmajordesignation;
import com.kexun.hr.model.Msg;
import com.kexun.hr.service.position.ConfigmajordesignationService;

/*
 * 职称设置控制层
 */
@Controller
@RequestMapping("Configmajordesignation")
public class ConfigmajordesignationController {

	@Autowired
	private ConfigmajordesignationService configmajordesignationService;

	// 查询所有职称
	@ResponseBody
	@RequestMapping("findConfigmajordesignation")
	public List<Configmajordesignation> findConfigmajordesignation() {
		return configmajordesignationService.findConfigmajordesignation();
	}
	// 删除

	@RequestMapping("deleteconfigmajordesignation")
	@ResponseBody
	public Msg deleteconfigmajordesignation(@RequestParam(value = "cmdid", required = true) int cmdid) {

		return configmajordesignationService.deleteByPrimaryKey(cmdid);

	}
	// 查询所有职称分页
		@RequestMapping("configmajordesignationQueryAll")
		public String configmajordesignationQueryAll(@RequestParam(value = "page", defaultValue = "1") int page,
				@RequestParam(value = "size", defaultValue = "5") int size, Model model) {

			PageInfo<Map<String, Object>> pageInfo = configmajordesignationService.configfilethirdkind(page, size);
			model.addAttribute("pageInfo", pageInfo);

			return "configmajordesignation";
		}
}
