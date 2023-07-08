package project.gulim.config;

import java.io.IOException;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Configuration
public class ConnectConfig{
	
	@Bean
    public FilterRegistrationBean<HttpsRedirectFilter> httpsRedirectFilterRegistrationBean() {
        FilterRegistrationBean<HttpsRedirectFilter> registrationBean = new FilterRegistrationBean<>();
        registrationBean.setFilter(new HttpsRedirectFilter());
        registrationBean.addUrlPatterns("/*");
        return registrationBean;
    }

    public static class HttpsRedirectFilter implements Filter {

        @Override
        public void init(FilterConfig filterConfig) throws ServletException {
            // 필터 초기화 로직
        }

        @Override
        public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
            HttpServletRequest request = (HttpServletRequest) servletRequest;
            HttpServletResponse response = (HttpServletResponse) servletResponse;

            if (!request.isSecure()) {
                String redirectUrl = "https://" + request.getServerName() + request.getRequestURI();
                response.sendRedirect(redirectUrl);
                return;
            }

            filterChain.doFilter(servletRequest, servletResponse);
        }

        @Override
        public void destroy() {
            // 필터 종료 로직
        }

    }
    
}
