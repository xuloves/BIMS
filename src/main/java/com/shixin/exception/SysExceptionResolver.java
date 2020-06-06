package com.shixin.exception;

import com.google.gson.Gson;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * @author 今何许
 * @date 2020/5/1 16:03
 */
public class SysExceptionResolver implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object o, Exception ex) {
        //获取异常对象
        SysException e = null;
        if (ex instanceof SysException) {
            e = (SysException) ex;
        } else {
            e = new SysException("操作失败");
        }
        HandlerMethod handlerMethod = (HandlerMethod) o;
        ResponseBody annotation = handlerMethod.getMethod().getAnnotation(ResponseBody.class);
        if (annotation != null) {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("code", "2");
            map.put("message", e.getMessage());
            String json = new Gson().toJson(map);
            response.setContentType("UTF-8");
            response.setContentType("application/json;charset=utf-8");
            try {
                response.getWriter().write(json);
                response.getWriter().flush();
            } catch (IOException ioException) {
                ioException.printStackTrace();
            }
            //返回空的表示已经手动产生响应
            return new ModelAndView();
        }
        ModelAndView view = new ModelAndView();
        view.addObject("errorMsg", e.getMessage());
        view.setViewName("admin/error");
        return view;
    }

}
