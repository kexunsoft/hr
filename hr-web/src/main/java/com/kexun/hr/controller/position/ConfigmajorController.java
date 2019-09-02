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
import com.kexun.hr.model.Configmajor;
import com.kexun.hr.model.Configmajorkind;
import com.kexun.hr.model.Msg;
import com.kexun.hr.service.position.ConfigmajorService;
import com.kexun.hr.service.position.ConfigmajorkindService;
/*
 * 职位设置控制层
 */
@Controller
@RequestMapping("Configmajor")
public class ConfigmajorController {

    @Autowired
    private ConfigmajorService configmajorService;
    @Autowired
    private ConfigmajorkindService  configmajorkindService;

    //根据职位分类id查询对应的职位
    @ResponseBody
    @RequestMapping("findByidMajorKindIdConfigmajor")
    public List<Configmajor> findByidMajorKindIdConfigmajor(Integer majorKindId) {
    	if(majorKindId==null) {
    		majorKindId=0;
    	}
        return configmajorService.findByidMajorKindIdConfigmajor(majorKindId);
    }

    // 查询所有职位分页
 	@RequestMapping("configmajorQueryAll")
 	public String configmajorQueryAll(@RequestParam(value = "page", defaultValue = "1") int page,
 			@RequestParam(value = "size", defaultValue = "5") int size, Model model) {

 		PageInfo<Map<String, Object>> pageInfo = configmajorService.configmajorkind(page, size);
 		model.addAttribute("pageInfo", pageInfo);

 		return "configmajor";
 	}
 	// 删除

 	@RequestMapping("deleteconMajorid")
 	@ResponseBody
 	public Msg deleteconfigmajordesignation(@RequestParam(value = "majorid", required = true) int majorid) {

 		return configmajorService.deletemajorkindidKey(majorid);

 	}
 	
 	// 跳到添加的界面

 		@RequestMapping(value = "configmajorAdd", method = RequestMethod.GET)
 		public String configfilesecondkindadd(Model model) {

 			List<Configmajorkind> roles = configmajorkindService.findConfigmajorkind();
 			model.addAttribute("roles", roles);
 			return "configmajorAdd";
 		}

 		// 添加职位分类
 		@ResponseBody
 		@RequestMapping(value = "configmajorAdd", method = RequestMethod.POST)
 		public Msg configmajorAdd(Configmajor configmajor) {

 			return configmajorService.insertSelective(configmajor);
 		}
}
