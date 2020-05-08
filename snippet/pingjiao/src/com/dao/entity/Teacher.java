package com.dao.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Teacher{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
   
	private String tno;
   
	public String getTno() {
		return tno;
	}
	public void setTno(String tno) {
		this.tno = tno;
	}
   
	private String password;
   
	public String getPassword() {
      	return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
   
	private String sex;
	
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
      this.sex = sex;
	}
   
	private String jiguan;
	
	public String getJiguan() {
		return jiguan;
	}
	public void setJiguan(String jiguan) {
      this.jiguan = jiguan;
	}
   
	private String zhiwei;
	
	public String getZhiwei() {
		return zhiwei;
	}
	public void setZhiwei(String zhiwei) {
		this.zhiwei = zhiwei;
	}
   
	private String zhicheng;
   
	public String getZhicheng() {
		return zhicheng;
	}
	public void setZhicheng(String zhicheng) {
		this.zhicheng = zhicheng;
	}
   
	private String xueli;
   
	public String getXueli() {
		return xueli;
	}
	public void setXueli(String xueli) {
		this.xueli = xueli;
	}
   
	private String mianmao;
   
	public String getMianmao() {
		return mianmao;
	}
	public void setMianmao(String mianmao) {
      this.mianmao = mianmao;
	}
   
	private String nation;
   
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
   
	private String email;
   
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	private String tel;
	
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	private String jieshao;
	
	public String getJieshao() {
		return jieshao;
	}
	public void setJieshao(String jieshao) {
      this.jieshao = jieshao;
	}
   
	private String name;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
   
	private String gradschool;
   
	public String getGradschool() {
		return gradschool;
	}
	public void setGradschool(String gradschool) {
		this.gradschool = gradschool;
	}
   
	private String major;
   
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
   
	private String photo;
	
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
}
