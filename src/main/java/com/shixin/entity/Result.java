package com.shixin.entity;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 * @author 今何许
 * @date 2020/5/1 16:23
 */
public class Result implements Serializable {
    private String code;
    private String message;
    private Map<String, Object> data = new HashMap<String, Object>();

    public Map<String, Object> getData() {
        return data;
    }

    public void setData(Map<String, Object> data) {
        this.data = data;
    }

    public static Result error(String message) {
        Result result = new Result();
        result.setCode("2");
        result.setMessage(message);
        return result;
    }

    public Result add(String key, Object value) {
        this.getData().put(key, value);
        return this;
    }

    public static Result success() {
        Result result = new Result();
        result.setCode("1");
        result.setMessage("操作成功");
        return result;
    }


    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
