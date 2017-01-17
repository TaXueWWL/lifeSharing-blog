package com.blog.facade.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.blog.facade.api.IUserService;
import com.blog.facade.bean.Blog;
import com.blog.facade.service.PropertiesService;

/**
 * @ClassName: PicUploadController 
 * @Description: 文件上传控制器
 * @作者 snowalker
 * @时间 2017年1月16日 下午8:52:10 
 */
@Controller
public class FileUploadController {
	
	@Autowired
	IUserService userService;
	
	@Autowired
	PropertiesService propertiesService;
	
	private static final Logger LOGGER = Logger.getLogger(FileUploadController.class);

	/**
	 * @功能 发送博客和图片
	 * @time 下午9:14:18
	 * @return String
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping(value = "writeBlogAndPic", method = RequestMethod.POST)
	public String uploadPicAndWriteBlog(
				@RequestParam("userId") String userId,
				@RequestParam("blogTitle") String blogTitle,
				@RequestParam("blogContent") String blogContent,
				@RequestParam("blogPicture") final MultipartFile pictureFile
			) throws IOException {
		/*图片不为空上传*/
		if (pictureFile != null) {
			//将图片地址写入数据库，并发送博文
			//文件上传地址
			String filePath = propertiesService.REPOSITORY_PATH;
			//获取文件原始名称，获取扩展名
			String originalFileName = pictureFile.getOriginalFilename();
			//文件新名称，从点往后截取，组装时去除UUID的“-”符号
			String newFileName = UUID.randomUUID().toString().replace("-", "") + 
					originalFileName.substring(originalFileName.lastIndexOf("."));
			final File file = new File(filePath + newFileName);
			//将内存中文件异步写入磁盘
			pictureFile.transferTo(file);
		
			//保存博客内容及图片链接到数据库
			Blog blog = Blog.builder().uId(Integer.valueOf(userId))
							.blogTitle(blogTitle)
							.blogContent(blogContent)
							.imgUrl(newFileName)
							.build();
					
			userService.saveBlogAndPicPath(blog);
		}
		return "redirect:index.html";
	}

	
	/**
	 * @功能 发送图片
	 * @time 下午9:14:18
	 * @return String
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping(value = "uploadPic", method = RequestMethod.POST)
	public String uploadPic(
				@RequestParam("userId") String userId,
				@RequestParam("blogTitle") String blogTitle,
				@RequestParam("blogPicture") final MultipartFile pictureFile
			) throws IOException {
		/*图片不为空上传*/
		if (pictureFile != null) {
			//将图片地址写入数据库，并发送博文
			//文件上传地址
			String filePath = propertiesService.REPOSITORY_PATH;
			//获取文件原始名称，获取扩展名
			String originalFileName = pictureFile.getOriginalFilename();
			//文件新名称，从点往后截取，组装时去除UUID的“-”符号
			String newFileName = UUID.randomUUID().toString().replace("-", "") + 
					originalFileName.substring(originalFileName.lastIndexOf("."));
			final File file = new File(filePath + newFileName);
			//将内存中文件异步写入磁盘
			pictureFile.transferTo(file);
		
			//保存博客内容及图片链接到数据库
			Blog blog = Blog.builder().uId(Integer.valueOf(userId))
							.blogTitle(blogTitle)
							.imgUrl(newFileName)
							.build();
					
			userService.saveBlogAndPicPath(blog);
		}
		return "redirect:index.html";
	}
	
}
