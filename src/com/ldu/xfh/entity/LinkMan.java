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

// default package



/**
 * 联系人实体类
 */
@Entity
@Table(name="linkman",schema="manager_sys",catalog="")
public class LinkMan  implements java.io.Serializable {
   
	 
     private Integer id;		 
     private String lmname;	 	 
     private String lmphone;	 
     private String lmaddress;	 
	 private String lmemail;
     private User userByUserId;

  
    public LinkMan() {
    		
    }
   
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id",nullable=false)
    public Integer getId() {
		return id;
	}
    
    public void setId(Integer id) {
		this.id = id;
	}

    @Basic
	@Column(name="lmname",nullable=false)
    public String getLmname() {
        return this.lmname;
    }
    
    public void setLmname(String lmname) {
        this.lmname = lmname;
    }
    
    @Basic
    @Column(name="lmphone",nullable=false)
    public String getLmphone() {
        return this.lmphone;
    }
    
    public void setLmphone(String lmphone) {
        this.lmphone = lmphone;
    }

    @Basic
	@Column(name="lmaddress",nullable=false)
    public String getLmaddress() {
        return this.lmaddress;
    }
    
    public void setLmaddress(String lmaddress) {
        this.lmaddress = lmaddress;
    }
    
    @Basic
	@Column(name="lmemail",nullable=false)
    public String getLmemail() {
		return lmemail;
	}

	public void setLmemail(String lmemail) {
		this.lmemail = lmemail;
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