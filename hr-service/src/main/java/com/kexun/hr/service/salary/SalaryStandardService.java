package com.kexun.hr.service.salary;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kexun.hr.dao.SalarystandardMapper;
import com.kexun.hr.dao.SalarystandarddetailsMapper;
import com.kexun.hr.model.Msg;
import com.kexun.hr.model.Salarystandard;
import com.kexun.hr.model.Salarystandarddetails;
import com.kexun.hr.model.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Service
public class SalaryStandardService {


    @Autowired
    private SalarystandardMapper salarystandardMapper;

    @Autowired
    private SalarystandarddetailsMapper salarystandarddetailsMapper;


    //根据id查询
    public Salarystandard findById(String standardid) {

        return salarystandardMapper.selectByPrimaryKey(standardid);
    }


    //根据复核状态查询薪酬标准
    public PageInfo<Salarystandard> findByCheckStatus(int i, int page) {

        PageHelper.startPage(page, 5);

        List<Salarystandard> salarystandardList = salarystandardMapper.findByCheckStatus(i);

        PageInfo<Salarystandard> pageInfo = new PageInfo<Salarystandard>(salarystandardList, 5);

        return pageInfo;


    }

    //登记
    public Msg registerSalary(Salarystandard salarystandard, HttpSession session, List<Salarystandarddetails> salarystandarddetails) {


        long timeMillis = System.currentTimeMillis();

        double sum = 0;

        for (Salarystandarddetails salarystandarddetail : salarystandarddetails) {
            salarystandarddetail.setStandardid(timeMillis + "");
            sum += salarystandarddetail.getSalary();
            if (!salarystandarddetailsMapper.updateByPrimaryKeySelective(salarystandarddetail)) {
                return new Msg().error("项目保存失败");
            }
        }


        Users user = (Users) session.getAttribute("user");

        salarystandard.setStandardid(timeMillis + "");

        //设置登记人
        salarystandard.setRegister(user.getTrueName());
        // 设置登记时间
        salarystandard.setRegisttime(new Date());
        //计算总额
        salarystandard.setSalarysum(sum);
        //设置状态checkStatus=0
        salarystandard.setCheckstatus(0);

        System.out.println(salarystandard);


        boolean b = salarystandardMapper.insertSelective(salarystandard);

        if (b) {
            return new Msg().success("登记成功,待复核");
        } else {
            return new Msg().error("系统错误");
        }


    }

    //复核
    public Msg review(Salarystandard salarystandard, HttpSession session, List<Salarystandarddetails> salarystandarddetails) {
        if (salarystandard.getCheckstatus() == 1) {
            double sum = 0;

            for (Salarystandarddetails salarystandarddetail : salarystandarddetails) {
                salarystandarddetail.setStandardid(salarystandard.getStandardid());
                sum += salarystandarddetail.getSalary();
                if (!salarystandarddetailsMapper.updateByPrimaryKeySelective(salarystandarddetail)) {
                    return new Msg().error("项目保存失败");
                }
            }

            Users user = (Users) session.getAttribute("user");

            salarystandard.setSalarysum(sum);

            //设置复核人
            salarystandard.setChecker(user.getTrueName());
//复核时间
            salarystandard.setChecktime(new Date());

            //通过
            boolean b = salarystandardMapper.updateByPrimaryKeySelective(salarystandard);

            if (b) {
                return new Msg().success("复核通过,可在薪酬标准查询选项查看");
            } else {
                return new Msg().error("系统错误");
            }

        } else {
            return new Msg().error("审核不通过,可以进入薪酬变更进行修改");

        }


    }

    //修改
    public Msg updSalary(Salarystandard salarystandard, HttpSession session, List<Salarystandarddetails> salarystandarddetails) {

        double sum = 0;

        for (Salarystandarddetails salarystandarddetail : salarystandarddetails) {
            salarystandarddetail.setStandardid(salarystandard.getStandardid());
            sum += salarystandarddetail.getSalary();
            if (!salarystandarddetailsMapper.updateByPrimaryKeySelective(salarystandarddetail)) {
                return new Msg().error("项目保存失败");
            }
        }

        Users user = (Users) session.getAttribute("user");
        //设置总金额
        salarystandard.setSalarysum(sum);

        //设置变更人和变更时间
        salarystandard.setChanger(user.getTrueName());

        salarystandard.setChangetime(new Date());

        //修改之后必须重新复核 所有设置复核状态
        //设置状态checkStatus=0
        salarystandard.setCheckstatus(0);

        //通过
        boolean b = salarystandardMapper.updateByPrimaryKeySelective(salarystandard);

        if (b) {
            return new Msg().success("修改成功");
        } else {
            return new Msg().error("系统错误");
        }


    }

    //查询所有的 可以进行修改操作
    public PageInfo<Salarystandard> findAllSalary(int page) {

        PageHelper.startPage(page, 5);
        List<Salarystandard> salarystandardList = salarystandardMapper.findAllSalary();

        PageInfo<Salarystandard> pageInfo = new PageInfo<Salarystandard>(salarystandardList, 5);

        return pageInfo;

    }
    
    //不分页 
    public List<Salarystandard> findByCheckStatus(int checkStatus){
    	return salarystandardMapper.findByCheckStatus(checkStatus);
    }
}
