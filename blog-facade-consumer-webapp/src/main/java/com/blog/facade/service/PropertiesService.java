package com.blog.facade.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

/**
 * @author snowalker
 * @描述 在父容器注入属性值，通过VALUE注解
 * 访问到当前容器的值
 * 然后将该service注入到子容器Controller中
 * 间接获取到父容器中的值
 * @date 	2016年10月26日
 */
@Service
public class PropertiesService {
    
    //value注解在当前的容器中拿值，一般情况下父容器不能访问子容器的值，子容器可以访问父容器的值
    @Value(value = "${REPOSITORY_PATH}")
    public String REPOSITORY_PATH;
    @Value(value = "${IMAGE_BASE_URL}")
    public String IMAGE_BASE_URL;
}
