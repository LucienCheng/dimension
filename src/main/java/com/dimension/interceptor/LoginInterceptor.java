package com.dimension.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dimension.pojo.User;
import org.springframework.ui.Model;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        // TODO Auto-generated method stub

    }

    @Override
    public void postHandle(HttpServletRequest request,
                           HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
        // TODO Auto-generated method stub

    }
//拦截的对象应该是user不是同一个在权限范围内的事情，还有是没有登陆的
    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {
        //获取请求的URL
        String url = request.getRequestURI();
        HttpSession session=request.getSession();
        User user= (User) session.getAttribute("user");
        System.out.println(url);

        if (url.indexOf("login")>=0||url.indexOf("/source")>=0||url.indexOf("verifyLogin")>=0){
            return true;
        }
        //可能会是空的user，这时候需要拦截
        if (user==null){
            response.sendRedirect("/login?"+"error=error");
            return false;
        }
        int roleId=user.getRoleid();
        //普通业务员
        if (roleId==2){
            //找不到前缀
            if (url.indexOf("/user")==-1){
                response.sendRedirect("/login?"+"error=error");
                return false;
            }
        }
        else {
            if (url.indexOf("/admin")==-1){
                response.sendRedirect("/login?"+"error=error");
                return false;
            }
        }

        return true;
    }

}
