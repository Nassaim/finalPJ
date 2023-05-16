package kr.or.ddit.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration
@EnableWebMvc
public class JueunConfig  implements WebMvcConfigurer{

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		log.debug("자동 실행되었는징 체킁");
		System.out.println("Real Check!!!");
		registry.addResourceHandler("/upload/**")             // 웹 접근 경로 
		        .addResourceLocations("file:///d:/FinalProject/uploadFile/");  // 서버내 실제 경로
	}

}
