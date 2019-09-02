package com.kexun.hr.controller.manpowerResource;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.github.pagehelper.PageInfo;
import com.kexun.hr.model.Configpublicchar;
import com.kexun.hr.model.Humanfile;
import com.kexun.hr.model.Msg;
import com.kexun.hr.model.Salarystandarddetails;
import com.kexun.hr.model.Users;
import com.kexun.hr.service.commonality.ConfigpubliccharService;
import com.kexun.hr.service.manpowerResource.HumanFileService;
import com.kexun.hr.service.salary.SalarystandarddetailsService;

/*
 * 人力资源档案控制层
 */
@Controller
@RequestMapping("HumanFile")
public class humanFileController {

	//人力资源档案服务
    @Autowired
    private HumanFileService fileService;
    
    //公公字段服务
    @Autowired
    private ConfigpubliccharService configpubliccharService;

    //薪酬项目服务
    @Autowired
    private SalarystandarddetailsService salarystandarddetailsService;
    //到人力资源档案登记
    @RequestMapping("goConfigfilefirstkind")
    public String goConfigfilefirstkind() {
        return "renliziyuandangandengji";
    }


    //人力资源档案登记
    @SuppressWarnings({"deprecation", "deprecation"})
    @ResponseBody
    @RequestMapping(value = "insertHumanFile", method = RequestMethod.POST)
    public Msg insertHumanFile(Humanfile humanfile, @RequestParam("file") MultipartFile commonsMultipartFile, HttpServletRequest request, HttpSession httpSession) {

        //获取登记人姓名
		Users attribute = (Users) httpSession.getAttribute("user");
		//存入当前表
		humanfile.setRegister(attribute.getuName());

        //获取文件路径
        String filename = System.currentTimeMillis() + commonsMultipartFile.getOriginalFilename();

        //分割获取文件名称 存入表
        humanfile.setAttachmentname(filename.substring(0, filename.lastIndexOf(".")));

        //存入本地
        String pathname = request.getRealPath("images/manpower/" + filename);
        //存入路径
        humanfile.setHumanpicture("/hr/images/manpower/" + filename);

        
        //插入系统时间  （档案登记时间）
        humanfile.setRegisttime(new Date());

        //默认插入为0  待复核
        humanfile.setCheckstatus(0);
        
        //默认插入0 未被删除
        humanfile.setHumanfilestatus(0);
        try {
            commonsMultipartFile.transferTo(new File(pathname));
        } catch (Exception e) {
            // TODO Auto-generated catch block
            return new Msg().error("照片上传失败");
        }
        return fileService.insertHumanFile(humanfile);
    }

    //多表联查 查询人力资源登记复核通过的数据
    @RequestMapping("findMoreTableHumanfile")
    public String findMoreTableHumanfile(@RequestParam(value = "page", defaultValue = "1") int page,
                                         @RequestParam(value = "size", defaultValue = "5") int size, Model model) {

        PageInfo<Map<String, Object>> pageinfo = fileService.findMoreTableHumanfile(page, size);
        model.addAttribute("pageinfo", pageinfo);

        return "renliziyuandangandengjichaxun";
    }

    //根据主键查询单个对象  (进行复核)
    @RequestMapping("selectByPrimaryKey")
    public String selectByPrimaryKey(Model model, Integer humanid,String xq) {
        Map<String, Object> selectByPrimaryKeyMoreTable = fileService.selectByPrimaryKeyMoreTable(humanid);
        model.addAttribute("h", selectByPrimaryKeyMoreTable);
        if(xq==null||xq=="") {
        	xq="yes";
        }else {
        	xq="no";
        }
        model.addAttribute("xq", xq);
        return "renliziyuandangandengjifuheanniu";
    }

    //人力资源档案登记确认复核 根据主键 修改状态 并且插入复核时间 和 操作用户
    @ResponseBody
    @RequestMapping(value = "updateByPrimaryKeySelective", method = {RequestMethod.GET, RequestMethod.POST})
    public Msg updateByPrimaryKeySelective(Humanfile humanfile, HttpSession httpSession) {
        //插入复核 时间
        humanfile.setChecktime(new Date());

        //获取登录用户的名称 插入到当前这条数据
        Users attribute = (Users) httpSession.getAttribute("user");
        humanfile.setChecker(attribute.getuName());

        //修改状态
        humanfile.setCheckstatus(1);
        
        return fileService.updateByPrimaryKeySelective(humanfile);

    }
    
    //根据主键查询单个对象 (进行修改)
    @RequestMapping("selectByPrimaryKey_update")
    public String selectByPrimaryKey_update(Model model,Integer humanid) {
    	Map<String, Object> selectByPrimaryKeyMoreTable_Update = fileService.selectByPrimaryKeyMoreTable(humanid);
    	model.addAttribute("hupdate", selectByPrimaryKeyMoreTable_Update);
    	
    	
    	//查询一些下拉框
    	List<Configpublicchar> zjxy = configpubliccharService.findConfigpubliccharXueli("宗教信仰");
        List<Configpublicchar> zzmm = configpubliccharService.findConfigpubliccharXueli("政治面貌");
        List<Configpublicchar> jynx = configpubliccharService.findConfigpubliccharXueli("教育年限");
        List<Configpublicchar> xlzy = configpubliccharService.findConfigpubliccharXueli("学历专业");
        List<Configpublicchar> gj = configpubliccharService.findConfigpubliccharXueli("国籍");
        List<Configpublicchar> mz = configpubliccharService.findConfigpubliccharXueli("民族");
        List<Configpublicchar> zc = configpubliccharService.findConfigpubliccharXueli("职称");
        List<Configpublicchar> xl = configpubliccharService.findConfigpubliccharXueli("学历");
        List<Configpublicchar> tc = configpubliccharService.findConfigpubliccharXueli("特长");
        List<Configpublicchar> ah = configpubliccharService.findConfigpubliccharXueli("爱好");
        
        //查询薪酬项目
        List<Salarystandarddetails> findSalarystandarddetails = salarystandarddetailsService.findSalarystandarddetails();
        
        model.addAttribute("zjxy", zjxy);
        model.addAttribute("zzmm", zzmm);
        model.addAttribute("jynx", jynx);
        model.addAttribute("xlzy", xlzy);
        model.addAttribute("gj", gj);
        model.addAttribute("mz", mz);
        model.addAttribute("zc", zc);
        model.addAttribute("xl", xl);
        model.addAttribute("tc", tc);
        model.addAttribute("ah", ah);
        model.addAttribute("xcname", findSalarystandarddetails);

    	return "renliziyuandanganxiugai";
    }
    
    //人力资源档案修改
    @ResponseBody
    @RequestMapping(value = "updateHumanfile",method = {RequestMethod.GET,RequestMethod.POST})
    public Msg updateHumanfile(Humanfile humanfile,HttpSession httpSession,@RequestParam("file") MultipartFile commonsMultipartFile, HttpServletRequest request) {
    	//插入操作用户
    	Users attribute =(Users) httpSession.getAttribute("user");
    	humanfile.setChanger(attribute.getuName());
    	
    	//插入修改时间
    	humanfile.setChangetime(new Date());
    	//插入最近修改时间
    	 humanfile.setLastlychangetime(new Date());
    	
    	if(commonsMultipartFile.isEmpty()) {
    		humanfile.setHumanpicture(null);
    	}else {
    		 //获取文件路径
            String filename = System.currentTimeMillis() + commonsMultipartFile.getOriginalFilename();

            //分割获取文件名称 存入表
            humanfile.setAttachmentname(filename.substring(0, filename.lastIndexOf(".")));

            //存入本地
            String pathname = request.getRealPath("images/manpower/" + filename);
            //存入路径
            humanfile.setHumanpicture("/hr/images/manpower/" + filename);
            
            try {
				commonsMultipartFile.transferTo(new File(pathname));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				return new Msg().error("照片上传失败");
			}
    	}
    	
    	return fileService.updateHumanfile(humanfile);
    }
    
    //查询人力资源复核通过的数据
    @RequestMapping("findMoreTableHumanfileYes")
    public String findMoreTableHumanfileYes(@RequestParam(value = "page", defaultValue = "1") int page,
                                         @RequestParam(value = "size", defaultValue = "5") int size, Model model) {

        PageInfo<Map<String, Object>> pageinfo = fileService.findMoreTableHumanfileYes(page, size);
        model.addAttribute("pageinfo", pageinfo);

        return "renliziyuandanganchaxun";
    }
    
    ////根据主键 删除 条件为已复核通过的  修改状态  （修改状态为1）
    @ResponseBody
    @RequestMapping(value = "deleteByKeyHumanfileYes",method = RequestMethod.GET)
    public Msg deleteByKeyHumanfileYes(Humanfile humanfile) {
    	
    	//插入删除时间
    	humanfile.setDeletetime(new Date());
    	
    	return fileService.deleteByKeyHumanfileYes(humanfile);
    }
    
    //查询人力资源被删除的数据
    @RequestMapping("selectBydelete")
    public String selectBydelete(@RequestParam(value = "page", defaultValue = "1") int page,
                                         @RequestParam(value = "size", defaultValue = "5") int size, Model model) {

        PageInfo<Map<String, Object>> pageinfo = fileService.selectBydelete(page, size);
        model.addAttribute("pageinfo", pageinfo);

        return "renliziyuandanganshanchuhuifu";
    }
    
    //根据主键恢复被删除的档案 条件为已被删除并且为已复核通过的
    @ResponseBody
    @RequestMapping(value = "huiguByKeyHumanfileBy1",method = RequestMethod.GET)
    public Msg huiguByKeyHumanfileBy1(Humanfile humanfile) {
    	
    	//插入恢复时间
		humanfile.setRecoverytime(new Date());
    	
    	return fileService.huiguByKeyHumanfileBy1(humanfile);
    }
    
    //根据主键永久删除
    @ResponseBody
    @RequestMapping(value = "deleteByKeyHumanfile",method = RequestMethod.GET)
    public Msg deleteByKeyHumanfile(Integer humanid) {
    	return fileService.deleteByKeyHumanfile(humanid);
    }
}
