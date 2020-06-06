package com.shixin.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author 今何许
 * @date 2020/5/1 14:34
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //判断请求地址
        String uri = request.getRequestURI();
        if (uri.indexOf("login") > 0 || uri.indexOf("register") >= 0) {
            return true;
        }
        //判断session存在
        if (request.getSession().getAttribute("user") != null) {
            return true;
        }
        request.getRequestDispatcher("/WEB-INF/pages/admin/login.jsp").forward(request, response);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
