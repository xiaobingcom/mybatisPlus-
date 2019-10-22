package com.mybatisplus.response;


import com.fasterxml.jackson.annotation.JsonInclude;

/**
 * 返回值装载器
 *
 * @author zhouqi
 * @version v1.0.0
 * @date 2019-01-13 23:22
 * @Description 全部的API接口的返回信息必须返回成本类型的对象进行返回
 * 若没有返回信息也要返回本类型对象，data默认为null即可
 * <p>
 * Modification History:
 * Date                 Author          Version          Description
 * ---------------------------------------------------------------------------------*
 * 2019-01-13 23:22     zhouqi          v1.0.0           Created
 */
@JsonInclude(JsonInclude.Include.NON_EMPTY)
public class ReturnValueLoader {


    /**
     * 状态码
     */
    private Integer code;

    /**
     * 状态信息
     */
    private String msg;

    /**
     * 要返回的数据
     * 注：若data为null，data节点将不会出现在json中
     */
    private Object data;

    public ReturnValueLoader() {
        super();
    }

    /**
     * @param code 状态码
     * @param msg  状态信息
     */
    public ReturnValueLoader(Integer code, String msg) {
        this.code = code;
        this.msg = msg;

    }

    /**
     * @param code 状态码
     * @param msg  状态信息
     * @param data 要返回的数据
     */
    public ReturnValueLoader(Integer code, String msg, Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }


    /**
     * @param resultCode
     */
    public ReturnValueLoader(ResultCode resultCode) {
        this.code = resultCode.getCode();
        this.msg = resultCode.getMsg();
    }

    public static ReturnValueLoader validatorCount(int count) {
        if (count == 0) {
            return new ReturnValueLoader(ResultCode.ERROR);
        }
        return new ReturnValueLoader(ResultCode.SUCCESS);
    }

    public ReturnValueLoader(Object object) {

        this.code = ResultCode.SUCCESS.getCode();
        this.msg = ResultCode.SUCCESS.getMsg();
        this.data = object;

    }


    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "ReturnValueLoader{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", data=" + data +
                '}';
    }
}
