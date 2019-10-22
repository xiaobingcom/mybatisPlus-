package ${package.Service};

import com.mybatisplus.response.ReturnValueLoader;
import ${package.Entity}.${table.entityName};


/**
 * ${table.comment} 接口层
 * Module: ${table.serviceName}.java
 *
 * @author xiaobing
 * @since JDK 1.8
 * @version 1.1
 * @date ${date}
 * @Descriptions:
*/
public interface ${table.serviceName}  {

    /**
     *
     * 功能描述: 新增${table.comment}
     *
     * @param: saveDto 新增需要的参数
     * @auther: xiaobing
     * @date: ${date}
     * @return:
    */
    Long put(${table.entityName} saveDto);


    /**
     *
     * 功能描述: 查看${table.comment}详情
     *
     * @param:
     * @auther: xiaobing
     * @date: ${date}
     * @return:
    */
    ${table.entityName} detail(Long id);

    /**
     *
     * 功能描述: 获取${table.comment}列表
     *
     * @param:
     * @auther: xiaobing
     * @date: ${date}
     * @return:
    */
    ReturnValueLoader list(Get${table.entityName}Dto searchDto);


    /**
     *
     * 功能描述: 新增${table.comment}提交
     *
     * @param:
     * @auther: xiaobing
     * @date: ${date}
     * @return:
    */
    int submit( ${table.entityName} saveDto);


    /**
     *
     * 功能描述: 移除一条${table.comment}信息
     *
     * @param:
     * @auther: xiaobing
     * @date: ${date}
     * @return:
     */
    int delete(Long id);
    }