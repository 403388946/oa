package com.oa.utils;

public class OAExceptionHandler {
    public OAExceptionHandler(Exception e) {
        e.printStackTrace();
        new RuntimeException(e.getMessage());
    }
}
