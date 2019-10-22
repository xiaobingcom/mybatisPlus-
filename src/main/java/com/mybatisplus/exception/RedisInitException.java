package com.mybatisplus.exception;

/**
 * Redis 初始化异常
 * @author zhouqi
 * @date 2019-08-28 15:24
 * @version v1.0.0
 * @Description
 *
 * Modification History:
 * Date                 Author          Version          Description
---------------------------------------------------------------------------------*
 * 2019-08-28 15:24     zhouqi          v1.0.0           Created
 *
 */
public class RedisInitException  extends GlobalException {


    public RedisInitException(String message, Throwable cause) {
        super(message,cause);
    }

}
