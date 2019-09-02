package com.kexun.hr.model;

import java.util.Date;

public class Humanfile {
    //档案编号
    private Integer humanid;
    //一级机构编号
    private Integer firstkindid;
    //二级机构编号
    private Integer secondkindid;
    //三级机构编号
    private Integer thirdkindid;
    //姓名
    private String humanname;
    //地址
    private String humanaddress;
    //邮政编码
    private String humanpostcode;
    //职称
    private String humanprodesignation;
    //职位编号
    private Integer humanmajorid;
    //电话
    private String humantelephone;
    //手机号码
    private String humanmobilephone;
    //开户银行   
    private String humanbank;
    //银行账号
    private String humanaccount;
    //QQ号码 
    private String humanqq;
    //电子邮件  
    private String humanemail;
    //爱好    
    private String humanhobby;
    // 特长 
    private String humanspecility;
    // 性别    
    private String humansex;
    //宗教信仰
    private String humanreligion;
    //政治面貌
    private String humanparty;
    //国籍
    private String humannationality;
    //民族
    private String humanrace;
    //出生日期
    private Date humanbirthday;
    //出生地
    private String humanbirthplace;
    //年龄
    private Integer humanage;
    //学历
    private String humaneducateddegree;
    //教育年限
    private String humaneducatedyears;
    //学历专业
    private String humaneducatedmajor;
    //社会保障号
    private String humansocietysecurityid;
    //身份证号
    private String humanidcard;
    //备注 
    private String remark;
    //薪酬标准编号  
    private String salarystandardid;
    //基本薪酬总额
    private Double salarysum;
    //应发薪酬总额
    private Double demandsalaraysum;
    //实发薪酬总额
    private Double paidsalarysum;
    //调动次数 
    private Integer majorchangeamount;
    //激励累计次数 
    private Integer bonusamount;
    //培训累计次数
    private Integer trainingamount;
    // 档案变更累计次数
    private Integer filechangamount;
    //简历
    private String humanhistroyrecords;
    // 家庭关系
    private String humanfamilymembership;
    //相片
    private String humanpicture;
    //附件名称
    private String attachmentname;
    // 复核状态     
    private Integer checkstatus;
    //档案登记人
    private String register;
    //档案复核人
    private String checker;
    //档案变更人 
    private String changer;
    //档案登记时间
    private Date registtime;
    //档案复核时间
    private Date checktime;
    //档案变更时间 
    private Date changetime;
    //档案最近更改时间 
    private Date lastlychangetime;
    // 档案删除时间
    private Date deletetime;
    //档案恢复时间
    private Date recoverytime;
    // 档案状态 
    private Integer humanfilestatus;

    public Integer getHumanid() {
        return humanid;
    }

    public void setHumanid(Integer humanid) {
        this.humanid = humanid;
    }

    public Integer getFirstkindid() {
        return firstkindid;
    }

    public void setFirstkindid(Integer firstkindid) {
        this.firstkindid = firstkindid;
    }

    public Integer getSecondkindid() {
        return secondkindid;
    }

    public void setSecondkindid(Integer secondkindid) {
        this.secondkindid = secondkindid;
    }

    public Integer getThirdkindid() {
        return thirdkindid;
    }

    public void setThirdkindid(Integer thirdkindid) {
        this.thirdkindid = thirdkindid;
    }

    public String getHumanname() {
        return humanname;
    }

    public void setHumanname(String humanname) {
        this.humanname = humanname == null ? null : humanname.trim();
    }

    public String getHumanaddress() {
        return humanaddress;
    }

    public void setHumanaddress(String humanaddress) {
        this.humanaddress = humanaddress == null ? null : humanaddress.trim();
    }

    public String getHumanpostcode() {
        return humanpostcode;
    }

    public void setHumanpostcode(String humanpostcode) {
        this.humanpostcode = humanpostcode == null ? null : humanpostcode.trim();
    }

    public String getHumanprodesignation() {
        return humanprodesignation;
    }

    public void setHumanprodesignation(String humanprodesignation) {
        this.humanprodesignation = humanprodesignation == null ? null : humanprodesignation.trim();
    }

    public Integer getHumanmajorid() {
        return humanmajorid;
    }

    public void setHumanmajorid(Integer humanmajorid) {
        this.humanmajorid = humanmajorid;
    }

    public String getHumantelephone() {
        return humantelephone;
    }

    public void setHumantelephone(String humantelephone) {
        this.humantelephone = humantelephone == null ? null : humantelephone.trim();
    }

    public String getHumanmobilephone() {
        return humanmobilephone;
    }

    public void setHumanmobilephone(String humanmobilephone) {
        this.humanmobilephone = humanmobilephone == null ? null : humanmobilephone.trim();
    }

    public String getHumanbank() {
        return humanbank;
    }

    public void setHumanbank(String humanbank) {
        this.humanbank = humanbank == null ? null : humanbank.trim();
    }

    public String getHumanaccount() {
        return humanaccount;
    }

    public void setHumanaccount(String humanaccount) {
        this.humanaccount = humanaccount == null ? null : humanaccount.trim();
    }

    public String getHumanqq() {
        return humanqq;
    }

    public void setHumanqq(String humanqq) {
        this.humanqq = humanqq == null ? null : humanqq.trim();
    }

    public String getHumanemail() {
        return humanemail;
    }

    public void setHumanemail(String humanemail) {
        this.humanemail = humanemail == null ? null : humanemail.trim();
    }

    public String getHumanhobby() {
        return humanhobby;
    }

    public void setHumanhobby(String humanhobby) {
        this.humanhobby = humanhobby;
    }

    public String getHumanspecility() {
        return humanspecility;
    }

    public void setHumanspecility(String humanspecility) {
        this.humanspecility = humanspecility == null ? null : humanspecility.trim();
    }

    public String getHumansex() {
        return humansex;
    }

    public void setHumansex(String humansex) {
        this.humansex = humansex == null ? null : humansex.trim();
    }

    public String getHumanreligion() {
        return humanreligion;
    }

    public void setHumanreligion(String humanreligion) {
        this.humanreligion = humanreligion == null ? null : humanreligion.trim();
    }

    public String getHumanparty() {
        return humanparty;
    }

    public void setHumanparty(String humanparty) {
        this.humanparty = humanparty == null ? null : humanparty.trim();
    }

    public String getHumannationality() {
        return humannationality;
    }

    public void setHumannationality(String humannationality) {
        this.humannationality = humannationality == null ? null : humannationality.trim();
    }

    public Double getSalarysum() {
        return salarysum;
    }

    public void setSalarysum(Double salarysum) {
        this.salarysum = salarysum;
    }

    public Double getDemandsalaraysum() {
        return demandsalaraysum;
    }

    public void setDemandsalaraysum(Double demandsalaraysum) {
        this.demandsalaraysum = demandsalaraysum;
    }

    public Double getPaidsalarysum() {
        return paidsalarysum;
    }

    public void setPaidsalarysum(Double paidsalarysum) {
        this.paidsalarysum = paidsalarysum;
    }

    public String getHumanrace() {
        return humanrace;
    }

    public void setHumanrace(String humanrace) {
        this.humanrace = humanrace == null ? null : humanrace.trim();
    }

    public Date getHumanbirthday() {
        return humanbirthday;
    }

    public void setHumanbirthday(Date humanbirthday) {
        this.humanbirthday = humanbirthday;
    }

    public String getHumanbirthplace() {
        return humanbirthplace;
    }

    public void setHumanbirthplace(String humanbirthplace) {
        this.humanbirthplace = humanbirthplace == null ? null : humanbirthplace.trim();
    }

    public Integer getHumanage() {
        return humanage;
    }

    public void setHumanage(Integer humanage) {
        this.humanage = humanage;
    }

    public String getHumaneducateddegree() {
        return humaneducateddegree;
    }

    public void setHumaneducateddegree(String humaneducateddegree) {
        this.humaneducateddegree = humaneducateddegree == null ? null : humaneducateddegree.trim();
    }

    public String getHumaneducatedyears() {
        return humaneducatedyears;
    }

    public void setHumaneducatedyears(String humaneducatedyears) {
        this.humaneducatedyears = humaneducatedyears;
    }

    public String getHumaneducatedmajor() {
        return humaneducatedmajor;
    }

    public void setHumaneducatedmajor(String humaneducatedmajor) {
        this.humaneducatedmajor = humaneducatedmajor == null ? null : humaneducatedmajor.trim();
    }

    public String getHumansocietysecurityid() {
        return humansocietysecurityid;
    }

    public void setHumansocietysecurityid(String humansocietysecurityid) {
        this.humansocietysecurityid = humansocietysecurityid == null ? null : humansocietysecurityid.trim();
    }

    public String getHumanidcard() {
        return humanidcard;
    }

    public void setHumanidcard(String humanidcard) {
        this.humanidcard = humanidcard == null ? null : humanidcard.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getSalarystandardid() {
        return salarystandardid;
    }

    public void setSalarystandardid(String salarystandardid) {
        this.salarystandardid = salarystandardid == null ? null : salarystandardid.trim();
    }


    public Integer getMajorchangeamount() {
        return majorchangeamount;
    }

    public void setMajorchangeamount(Integer majorchangeamount) {
        this.majorchangeamount = majorchangeamount;
    }

    public Integer getBonusamount() {
        return bonusamount;
    }

    public void setBonusamount(Integer bonusamount) {
        this.bonusamount = bonusamount;
    }

    public Integer getTrainingamount() {
        return trainingamount;
    }

    public void setTrainingamount(Integer trainingamount) {
        this.trainingamount = trainingamount;
    }

    public Integer getFilechangamount() {
        return filechangamount;
    }

    public void setFilechangamount(Integer filechangamount) {
        this.filechangamount = filechangamount;
    }

    public String getHumanhistroyrecords() {
        return humanhistroyrecords;
    }

    public void setHumanhistroyrecords(String humanhistroyrecords) {
        this.humanhistroyrecords = humanhistroyrecords == null ? null : humanhistroyrecords.trim();
    }

    public String getHumanfamilymembership() {
        return humanfamilymembership;
    }

    public void setHumanfamilymembership(String humanfamilymembership) {
        this.humanfamilymembership = humanfamilymembership == null ? null : humanfamilymembership.trim();
    }

    public String getHumanpicture() {
        return humanpicture;
    }

    public void setHumanpicture(String humanpicture) {
        this.humanpicture = humanpicture == null ? null : humanpicture.trim();
    }

    public String getAttachmentname() {
        return attachmentname;
    }

    public void setAttachmentname(String attachmentname) {
        this.attachmentname = attachmentname == null ? null : attachmentname.trim();
    }

    public Integer getCheckstatus() {
        return checkstatus;
    }

    public void setCheckstatus(Integer checkstatus) {
        this.checkstatus = checkstatus;
    }

    public String getRegister() {
        return register;
    }

    public void setRegister(String register) {
        this.register = register == null ? null : register.trim();
    }

    public String getChecker() {
        return checker;
    }

    public void setChecker(String checker) {
        this.checker = checker == null ? null : checker.trim();
    }

    public String getChanger() {
        return changer;
    }

    public void setChanger(String changer) {
        this.changer = changer == null ? null : changer.trim();
    }

    public Date getRegisttime() {
        return registtime;
    }

    public void setRegisttime(Date registtime) {
        this.registtime = registtime;
    }

    public Date getChecktime() {
        return checktime;
    }

    public void setChecktime(Date checktime) {
        this.checktime = checktime;
    }

    public Date getChangetime() {
        return changetime;
    }

    public void setChangetime(Date changetime) {
        this.changetime = changetime;
    }

    public Date getLastlychangetime() {
        return lastlychangetime;
    }

    public void setLastlychangetime(Date lastlychangetime) {
        this.lastlychangetime = lastlychangetime;
    }

    public Date getDeletetime() {
        return deletetime;
    }

    public void setDeletetime(Date deletetime) {
        this.deletetime = deletetime;
    }

    public Date getRecoverytime() {
        return recoverytime;
    }

    public void setRecoverytime(Date recoverytime) {
        this.recoverytime = recoverytime;
    }

    public Integer getHumanfilestatus() {
        return humanfilestatus;
    }

    public void setHumanfilestatus(Integer humanfilestatus) {
        this.humanfilestatus = humanfilestatus;
    }

    @Override
    public String toString() {
        return "Humanfile [humanid=" + humanid + ", firstkindid=" + firstkindid + ", secondkindid=" + secondkindid
                + ", thirdkindid=" + thirdkindid + ", humanname=" + humanname + ", humanaddress=" + humanaddress
                + ", humanpostcode=" + humanpostcode + ", humanprodesignation=" + humanprodesignation
                + ", humanmajorid=" + humanmajorid + ", humantelephone=" + humantelephone + ", humanmobilephone="
                + humanmobilephone + ", humanbank=" + humanbank + ", humanaccount=" + humanaccount + ", humanqq="
                + humanqq + ", humanemail=" + humanemail + ", humanhobby=" + humanhobby + ", humanspecility="
                + humanspecility + ", humansex=" + humansex + ", humanreligion=" + humanreligion + ", humanparty="
                + humanparty + ", humannationality=" + humannationality + ", humanrace=" + humanrace
                + ", humanbirthday=" + humanbirthday + ", humanbirthplace=" + humanbirthplace + ", humanage=" + humanage
                + ", humaneducateddegree=" + humaneducateddegree + ", humaneducatedyears=" + humaneducatedyears
                + ", humaneducatedmajor=" + humaneducatedmajor + ", humansocietysecurityid=" + humansocietysecurityid
                + ", humanidcard=" + humanidcard + ", remark=" + remark + ", salarystandardid=" + salarystandardid
                + ", salarysum=" + salarysum + ", demandsalaraysum=" + demandsalaraysum + ", paidsalarysum="
                + paidsalarysum + ", majorchangeamount=" + majorchangeamount + ", bonusamount=" + bonusamount
                + ", trainingamount=" + trainingamount + ", filechangamount=" + filechangamount
                + ", humanhistroyrecords=" + humanhistroyrecords + ", humanfamilymembership=" + humanfamilymembership
                + ", humanpicture=" + humanpicture + ", attachmentname=" + attachmentname + ", checkstatus="
                + checkstatus + ", register=" + register + ", checker=" + checker + ", changer=" + changer
                + ", registtime=" + registtime + ", checktime=" + checktime + ", changetime=" + changetime
                + ", lastlychangetime=" + lastlychangetime + ", deletetime=" + deletetime + ", recoverytime="
                + recoverytime + ", humanfilestatus=" + humanfilestatus + "]";
    }


}