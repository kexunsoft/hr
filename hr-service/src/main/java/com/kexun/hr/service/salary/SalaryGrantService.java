package com.kexun.hr.service.salary;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kexun.hr.dao.SalarygrantMapper;
import com.kexun.hr.dao.SalarygrantdetailsMapper;
import com.kexun.hr.model.Humanfile;
import com.kexun.hr.model.Msg;
import com.kexun.hr.model.Salarygrant;
import com.kexun.hr.model.Salarygrantdetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class SalaryGrantService {

    @Autowired
    private SalarygrantMapper salarygrantMapper;

    @Autowired
    private SalarygrantdetailsMapper salarygrantdetailsMapper;


    public List<Map<String, Object>> findPayrollRegistrationList(int organization) {

        switch (organization) {

            case 1:
                return salarygrantMapper.findFirst();

            case 2:
                return salarygrantMapper.findSecound();

            case 3:
                return salarygrantMapper.findThird();

            default:
                return new ArrayList<Map<String, Object>>();

        }


    }

    public List<Map<String, Object>> findHuman(int pid, int organization) {

        switch (organization) {

            case 1:
                return salarygrantMapper.findFirstfindHuman(pid);

            case 2:
                return salarygrantMapper.findSecoundfindHuman(pid);

            case 3:
                return salarygrantMapper.findThirdfindHuman(pid);

            default:
                return new ArrayList<Map<String, Object>>();

        }


    }

    public Msg payoff(Salarygrant salarygrant, List<Salarygrantdetails> salaryGrantDetailsList, String register) {


        //总发放计数
        double salaryPaidSum = 0;

        //计算详情的时间发放
        for (Salarygrantdetails salaryGrantDetails : salaryGrantDetailsList) {
            //奖励金额
            double bounssum = salaryGrantDetails.getBounssum();
            //销售绩效金额
            double salesum = salaryGrantDetails.getSalesum();
            //应扣金额
            double deductsum = salaryGrantDetails.getDeductsum();
            //计算
            double salarystandardsum = salaryGrantDetails.getSalarystandardsum();

            //计算每个的
            double salarypaidsum = salarystandardsum + bounssum + salesum - deductsum;

            salaryGrantDetails.setSalarypaidsum(salarypaidsum);

            salaryPaidSum += salarypaidsum;


        }
        //设置实发总金额
        salarygrant.setSalarypaidsum(salaryPaidSum);
        //设置登记人
        salarygrant.setRegister(register);
        //设置登记时间
        salarygrant.setRegisttime(new Date());
        //设置未复核
        salarygrant.setCheckstatus(0);


        //保存薪酬发放登记表
        salarygrantMapper.insertSelective(salarygrant);


        //保存薪酬发放详细信息表
        for (Salarygrantdetails salaryGrantDetails : salaryGrantDetailsList) {
            salarygrantdetailsMapper.insertSelective(salaryGrantDetails);
        }

        return new Msg().success("数据提交成功,待复核");


    }

    public PageInfo<Map<String, Object>> findByCheckStatus(int status, int page) {

        PageHelper.startPage(page, 5);

        List<Map<String, Object>> list = salarygrantMapper.findByCheckStatus(status);

        return new PageInfo<Map<String, Object>>(list, 5);

    }

    //复核
    public Msg review(String salaryGrantId, List<Salarygrantdetails> salaryGrantDetailsList, String checker) {
        //总发放计数
        double salaryPaidSum = 0;

        //计算详情的时间发放
        for (Salarygrantdetails salaryGrantDetails : salaryGrantDetailsList) {
            //奖励金额
            double bounssum = salaryGrantDetails.getBounssum();
            //销售绩效金额
            double salesum = salaryGrantDetails.getSalesum();
            //应扣金额
            double deductsum = salaryGrantDetails.getDeductsum();

            //计算
            double salarystandardsum = salaryGrantDetails.getSalarystandardsum();

            //计算每个的
            double salarypaidsum = salarystandardsum + bounssum + salesum - deductsum;

            salaryGrantDetails.setSalarypaidsum(salarypaidsum);

            salaryPaidSum += salarypaidsum;


        }
        Salarygrant salarygrant = new Salarygrant();
        //设置编号
        salarygrant.setSalarygrantid(salaryGrantId);
        //设置实发总金额
        salarygrant.setSalarypaidsum(salaryPaidSum);
        //设置复核人
        salarygrant.setChecker(checker);
        //设置复核时间
        salarygrant.setChecktime(new Date());

        //设置为复核
        salarygrant.setCheckstatus(1);


        //保存薪酬发放登记表
        salarygrantMapper.updateByPrimaryKeySelective(salarygrant);


        //保存薪酬发放详细信息表
        for (Salarygrantdetails salaryGrantDetails : salaryGrantDetailsList) {
            salarygrantdetailsMapper.updateByPrimaryKeySelective(salaryGrantDetails);
        }

        return new Msg().success("复核成功,可以到薪酬发放查询查看");


    }
}
