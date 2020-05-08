package com.dao.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Xuenian {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id= id;
	}
	
  	private String niandu;
  	
  	public String getNiandu() {
  		return niandu;
  	}
  	public void setNiandu(String niandu) {
  		this.niandu = niandu;
  }
  	
}
