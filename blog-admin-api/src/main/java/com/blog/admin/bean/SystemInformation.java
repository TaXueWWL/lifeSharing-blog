package com.blog.admin.bean;

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

@Table(name = "tb_system_info")
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SystemInformation implements Serializable {
	
	private static final long serialVersionUID = 6266845817487529089L;
	//主键自增
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)   
	private Integer infoId;
	private String infoTitle;
	private String infoContent;
	private String infoPublisher;
	private Date infoDatetime;
}
