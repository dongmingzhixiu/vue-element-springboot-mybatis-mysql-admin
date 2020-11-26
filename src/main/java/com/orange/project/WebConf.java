package com.orange.project;

/**
 * describe:
 * author:jpw
 * Date:2019/12/23
 * Time:10:36
 */

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.ShallowEtagHeaderFilter;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@Component
public class WebConf implements WebMvcConfigurer { // implements WebMvcConfigurer {
    @Bean
    public FilterRegistrationBean filterRegistrationBean() {
        ShallowEtagHeaderFilter eTagFilter = new ShallowEtagHeaderFilter();
        FilterRegistrationBean registration = new FilterRegistrationBean();
        registration.setFilter(eTagFilter);
        registration.addUrlPatterns("/*");
//		registration.addUrlPatterns("/types/*");
        return registration;
    }


    @Autowired
    //过滤器
    private LoginInterceptor loginInterceptor;

    private static String[] excludeStatic = new String[]{
            "/static/**",
            "/static/img/**",
            "/static/img/md/**",
            "/static/css/**",
            "/static/js/**",
            "/static/fonts/**",
            "/templates/**",
            "classpath:/static/**",
            "classpath:/static/css/**",
            "classpath:/static/js/**",
            "classpath:/static/fonts/**",
            "classpath:/static/img/**",
            "classpath:/static/md/**",
            "classpath:/templates/**",
//            "/error"
    };
    //配置资源过滤，比如js、css、html
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**")
                .addResourceLocations(excludeStatic);
    }


    private static String[] excludePath = new String[]{
            "/",
            "/#",
            "#/login",
            "/login/login",
            "/asserts/**",
            "/webjars/**",
            "/static/**",
            "/ops/shutdown"

//            "/error"
    };

    //
    //配置拦截器，写好的拦截器需要到这里注册才行
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //过滤/**下的所有请求，不过滤/login,/,/toLogin请求
        registry.addInterceptor(loginInterceptor)
                .excludePathPatterns(excludePath)
                .addPathPatterns("/**");
    }
//	}
}