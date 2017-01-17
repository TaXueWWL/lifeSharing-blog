package com.blog.facade.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
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
 * @ClassName: Blog 
 * @Description: 博客bean
 * @作者 snowalker
 * @时间 2017年1月16日 下午10:13:14 
 */

@Table(name = "tb_blog")
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Blog implements Serializable {
	
	private static final long serialVersionUID = 8008088168734489552L;
	//主键自增
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)   
    @Column(name = "blog_id")
	private Integer blogId;
	private String blogContent;
	private String blogTitle;
	private Date blogDatetime;
	private String imgUrl;
	@Column(name = "u_id")
	private Integer uId;

}
