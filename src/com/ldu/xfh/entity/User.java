package com.ldu.xfh.entity;

import java.util.Collection;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;



/**
 * 用户实体类
 */

@SuppressWarnings("deprecation")
@Entity
@Table(name="user",schema="manager_sys",catalog="")
public class User implements java.io.Serializable {

	private Integer id;
	private String username;
	private String userpass;
	private String age;
	private String email;
	private String birth;
	private String phone;
	private String address;
	private String sex;
	private Collection<LinkMan> linkManById;
	private Collection<FileEntity> fileById;

	public User() {
	}

	
	@Id
	@Column(name="id",nullable=false)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Basic
	@Column(name="username",nullable=false)
	public String getUsername() {
		return this.username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	@Basic
	@Column(name="userpass",nullable=false)
	public String getUserpass() {
		return this.userpass;
	}
	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}
	
	@Basic
	@Column(name="age",nullable=false)
	public String getAge() {
		return this.age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	
	@Basic
	@Column(name="email",nullable=false)
	public String getEmail() {
		return this.email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	@Basic
	@Column(name="birth",nullable=false)
	public String getBirth() {
		return this.birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}

	@Basic
	@Column(name="phone",nullable=false)
	public String getPhone() {
		return this.phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Basic
	@Column(name="address",nullable=false)
	public String getAddress() {
		return this.address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	@Basic
	@Column(name="sex",nullable=false)
	public String getSex() {
		return this.sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}

	//与联系人表的映射
	@OneToMany(mappedBy="userByUserId")
	public Collection<LinkMan> getLinkManById() {
		return linkManById;
	}
	public void setLinkManById(Collection<LinkMan> linkManById) {
		this.linkManById = linkManById;
	}

	//与文件变的映射
	@OneToMany(mappedBy="userByUserId")
	public Collection<FileEntity> getFileById() {
		return fileById;
	}
	public void setFileById(Collection<FileEntity> fileById) {
		this.fileById = fileById;
	}
	
	
	

}