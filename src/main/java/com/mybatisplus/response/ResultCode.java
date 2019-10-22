package com.mybatisplus.response;

/**
 * 全局返回状态码
 * @author zhouqi
 * @date 2019-06-24 18:05
 * @version v1.0.0
 * @Description
 *
 * Modification History:
 * Date                 Author          Version          Description
---------------------------------------------------------------------------------*
 * 2019-06-24 18:05     zhouqi          v1.0.0           Created
 *
 */
public enum ResultCode {

    /**
     * 请求成功
     */
    SUCCESS(0, "SUCCESS"),

    ERROR(1, "ERROR"),

    /**
     * 登陆时使用
     */
    USERNAME_OR_PASSWORD_ERROR(1001,"用户名或密码错误"),

    /**
     * 密码输入错误次数过多
     */
    PASSWORD_ERROR_MORE(1002, "密码错误次数过多"),

    /**
     * 账号被禁用提示
     */
    ACCOUNT_HAS_BEEN_DISABLED(1003, "账号已被禁用"),

    /**
     * 请求接口鉴权时使用
     */
    TOKEN_TIME_OUT(2001,"TOKEN过期"),

    /**
     * 请求接口鉴权时使用
     */
    NO_AUTH_CODE(2002,"TOKEN异常"),


    /**
     * 当前状态不允许操作
     * 可用于修改，新增等操作
     */
    CURRENT_STATE_CANNOT_OPERATE(3001,"当前状态不允许此操作"),



    QUERY_DATA_IS_EMPTY(4001,"未能查询到数据"),

    /**
     * 合同撤回提示信息
     * */

    PROPERTY_UNIT_ID_NULL(6001,"主键ID不存在"),


    CHECK_DATA_IS_EMPTY(7001,"未能查询到数据");

    private final int code;

    private final String msg;

    ResultCode(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }


    public int getCode() {
        return this.code;
    }

    public String getMsg() {
        return msg;
    }



}
