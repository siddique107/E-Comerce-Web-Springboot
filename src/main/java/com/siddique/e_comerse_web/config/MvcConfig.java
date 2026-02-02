package com.siddique.e_comerse_web.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // This links the URL path to the physical folder on your E: drive
        registry.addResourceHandler("/product-images/**")
                .addResourceLocations("file:/E:/proct-images/");
    }
}