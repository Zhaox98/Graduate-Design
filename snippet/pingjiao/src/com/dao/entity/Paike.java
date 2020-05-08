package com.dao.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Paike {
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
   	
   	
  	private String tname;
  	
  	public String getTname() {
  		return tname;
  	}
  	public void setTname(String tname) {
  		this.tname = tname;
  	}
   	
  	
  	private String xuenian;
   	
  	public String getXuenian() {
   		return xuenian;
   	}
  	
   	public void setXuenian(String xuenian) {
   		this.xuenian= xuenian;
   	}
   	
   	
   	private String weekday;
   	
   	public String getWeekday() {
   		return weekday;
   	}
   	
   	public void setWeekday(String weekday) {
   		this.weekday = weekday;
   	}
   	
   	
   	private String kejie;
   	
   	public String getKejie() {
   		return kejie;
   	}
   	public void setKejie(String kejie) {
      	this.kejie = kejie;
   	}
   	
   	
   	private String major;
   	
   	public String getMajor() {
   		return major;
  	}
   	
   	public void setMajor(String major) {
   		this.major = major;
   	}
   	
   	
   	private String banji ;
   	
   	public String getBanji() {
   		return banji;
   	}
   	
   	public void setBanji(String banji) {
   		this.banji = banji;
   	}
   	
}
