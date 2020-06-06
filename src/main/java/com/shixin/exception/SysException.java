package com.shixin.exception;

/**
 * @author 今何许
 * @date 2020/5/1 16:02
 */
public class SysException extends Exception {
    @Override
    public String getMessage() {
        return message;
    }

    public SysException(String message) {
        this.message = message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    private String message;
}
