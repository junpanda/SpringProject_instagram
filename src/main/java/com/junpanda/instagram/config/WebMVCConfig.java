package com.junpanda.instagram.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.junpanda.instagram.common.FileManagerService;



@Configuration
public class WebMVCConfig implements WebMvcConfigurer{
	
	//컴퓨터(서버)내 특정 경로를 클라이언트(브라우저)에서 특정 path로 접근 하도록 하는 설정
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry ) {
		registry.addResourceHandler("/images/**") //클라이언트에서 접근하도록 하는 Path
		.addResourceLocations("file:///" + FileManagerService.FILE_UPLOAD_PATH);
	}
}