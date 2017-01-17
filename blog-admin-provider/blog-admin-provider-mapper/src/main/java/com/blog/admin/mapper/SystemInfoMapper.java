package com.blog.admin.mapper;

import org.springframework.stereotype.Repository;

import com.blog.admin.bean.SystemInformation;
import com.github.abel533.mapper.Mapper;

/**
 * @ClassName: SystemInfoMapper 
 * @Description: 系统通知Mapper
 * @作者 snowalker
 * @时间 2016年12月29日 上午11:24:56 
 *
 */
@Repository(value = "systemInfoMapper")
public interface SystemInfoMapper extends Mapper<SystemInformation> {

}
