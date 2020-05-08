package com.dao.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Xuanke {
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
   
	private String sname;
   
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
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
	
	private Date xktime;
   
	public Date getXktime() {
		return xktime;
	}
	public void setXktime(Date xktime) {
		this.xktime = xktime;
	}
   
	private Double score;
	
	public Double getScore() {
		return score;
	}
	public void setScore(Double score) {
		this.score = score;
	}
   
	private String status;
   
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
}
