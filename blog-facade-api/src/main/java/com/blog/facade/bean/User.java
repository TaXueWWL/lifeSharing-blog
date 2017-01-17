package com.blog.facade.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Table(name = "tb_user")
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class User implements Serializable {
	
	private static final long serialVersionUID = 5860046995944934322L;
	//主键自增
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)   
	private Integer u_id;
	private String userName;
	private String userPwd;
	private String userMobile;
	private String userEmail;
	private Integer userGender;
	private String userSelfIntro;	//用户自我介绍
	private Date created;
    private Date updated;
    private Integer isBanned; 		//用户是否被拉黑
}
