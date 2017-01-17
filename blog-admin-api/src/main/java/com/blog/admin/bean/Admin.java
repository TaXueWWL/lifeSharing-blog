package com.blog.admin.bean;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @ClassName: Admin 
 * @Description: 管理员实体类
 * @作者 snowalker
 * @时间 2016年12月29日 上午11:11:45 
 *
 */
@Table(name = "tb_admin")
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Admin implements Serializable {
	
	private static final long serialVersionUID = -7140312654918984480L;
	//主键自增
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)   
	private Integer adminId;
	private String adminName;
	private String adminPasswd;
}
