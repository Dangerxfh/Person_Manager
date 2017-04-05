package com.ldu.xfh.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="file",schema="manager_sys",catalog="")
public class FileEntity {
	private Integer id;
	private String flname;
	private String fltitle;
	private String fltype;
	private String fllength;
	private User userByUserId;
	
	@Id
	@Column(name="id",nullable=false)
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Basic
	@Column(name="flname",nullable=false)
	public String getFlname() {
		return flname;
	}
	public void setFlname(String flname) {
		this.flname = flname;
	}
	
	@Basic
	@Column(name="fltitle",nullable=false)
	public String getFltitle() {
		return fltitle;
	}
	public void setFltitle(String fltitle) {
		this.fltitle = fltitle;
	}
	
	@Basic
	@Column(name="fltype",nullable=false)
	public String getFltype() {
		return fltype;
	}
	public void setFltype(String fltype) {
		this.fltype = fltype;
	}
	
	@Basic
	@Column(name="fllength",nullable=false)
	public String getFllength() {
		return fllength;
	}
	public void setFllength(String fllength) {
		this.fllength = fllength;
	}
	
	@ManyToOne
	@JoinColumn(name="userid",referencedColumnName="id")
	public User getUserByUserId() {
		return userByUserId;
	}
	public void setUserByUserId(User userByUserId) {
		this.userByUserId = userByUserId;
	}
	
}
