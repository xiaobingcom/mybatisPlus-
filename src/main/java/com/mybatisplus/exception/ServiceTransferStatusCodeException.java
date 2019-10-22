package com.mybatisplus.exception;

public class ServiceTransferStatusCodeException extends RuntimeException {

    private final int tatusCode;

    public ServiceTransferStatusCodeException(int statusCode, String message) {
        super(String.format("[status code: %d] %s", statusCode, message));
        this.tatusCode = statusCode;
    }

    public ServiceTransferStatusCodeException(int statusCode, Throwable cause) {
        super(cause);
        this.tatusCode = statusCode;
    }

    public int getStatusCode() {
        return tatusCode;
    }



}
