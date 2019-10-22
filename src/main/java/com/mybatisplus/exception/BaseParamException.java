package com.mybatisplus.exception;


/**
 * 基础参数异常
 * @author zhouqi
 * @date 2019-07-25 10:34
 * @version v1.0.0
 * @Description
 *
 * Modification History:
 * Date                 Author          Version          Description
---------------------------------------------------------------------------------*
 * 2019-07-25 10:34     zhouqi          v1.0.0           Created
 *
 */
public class BaseParamException extends GlobalException {


    public BaseParamException(String message) {
        super(message);
    }

    public BaseParamException(String message, GlobalExceptionCode code) {
        super(message, code);
    }


}
