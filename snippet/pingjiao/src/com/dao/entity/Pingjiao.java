package com.dao.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Pingjiao {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	public int getId() {
		return id;
	}
   
	public void setId(int id) {
      this.id = id;
	}
   
	
	private String stno;
   
	public String getStno() {
		return stno;
	}
   
	public void setStno(String stno) {
      this.stno = stno;
	}
   
	
	private String stname;
   
	public String getStname() {
		return stname;
	}
   
	public void setStname(String stname) {
		this.stname = stname;
	}
   
	
	private String subno;
   
	public String getSubno() {
		return subno;
	}
   
	public void setSubno(String subno) {
		this.subno = subno;
	}
   
	
	private String subname;
   
	public String getSubname() {
		return subname;
	}
   
	public void setSubname(String subname) {
		this.subname = subname;
	}
   
	
	private int defen;
   
	public int getDefen() {
		return defen;
	}
   
	public void setDefen(int defen) {
		this.defen = defen;
	}
	
	
	private Date pjtime;
   
	public Date getPjtime() {
		return pjtime;
	}
   
	public void setPjtime(Date pjtime) {
		this.pjtime = pjtime;
	}
   
	
	private String des;
   
	public String getDes() {
		return des;
	}
   
	public void setDes(String des) {
		this.des = des;
	}
	
}
