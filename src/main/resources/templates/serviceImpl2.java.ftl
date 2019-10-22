package ${package.ServiceImpl};

import com.mybatisplus.response.ReturnValueLoader;
import com.mybatisplus.exception.BaseParamException;
import com.mybatisplus.exception.GlobalExceptionCode;
import ${package.Entity}.${table.entityName};
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ${package.Mapper}.${table.mapperName};
import ${package.Service}.${table.serviceName};
import com.mybatisplus.response.ResultCode;
import java.util.Date;
import java.util.List;


/**
 * ${table.comment} 接口实现类
 * Module: ${table.serviceImplName}.java
 *
 * @author xiaobing
 * @since JDK 1.8
 * @version 1.1
 * @date ${date}
 * @Descriptions:
*/
public class ${table.serviceImplName}  implements ${table.serviceName} {

    @Autowired
    private ${table.mapperName} ${(table.mapperName)?uncap_first};


    /**
     * 功能描述: 新增${table.comment}
     *
     * @param:
     * @auther: xiaobing
     * @date: ${date}
     * @return:
    */
    @Override
    @Transactional
    public Long put(${table.entityName} saveDto) {

        //如果需要保存的数据为空，则直接抛错
        if (saveDto == null) {
        throw new BaseParamException("参数不合法", GlobalExceptionCode.NOT_FOUND_EXCEPTION_CODE);

        }
        //新建空白指向
        ${table.entityName} ${(table.entityName)?uncap_first};
        //如果有ID 为修改，查询要修改的对象
        if (saveDto.getId() != null && saveDto.getId() != 0L) {
            ${(table.entityName)?uncap_first} = this.${(table.mapperName)?uncap_first}.selectById(saveDto.getId());

            //查询不到抛出错误
            if (${(table.entityName)?uncap_first} == null) {
             throw new BaseParamException("主键ID不存在", GlobalExceptionCode.NOT_FOUND_EXCEPTION_CODE);
            }
        } else {
        //无ID 为新增
        //新建对象
        ${(table.entityName)?uncap_first} = new ${table.entityName}();
        //初始化对象
        saveDto.setId(null);
        ${(table.entityName)?uncap_first}.setCreateDate(CommonRequestHolder.getCurrentLocalDateTime());
        ${(table.entityName)?uncap_first}.setCreatePid(CommonRequestHolder.getCurrentUserId());
        }
        //设置必改项
        ${(table.entityName)?uncap_first}.setUpdateDate(CommonRequestHolder.getCurrentLocalDateTime());
        ${(table.entityName)?uncap_first}.setUpdatePid(CommonRequestHolder.getCurrentUserId());
        BeanUtils.copyProperties(saveDto, ${(table.entityName)?uncap_first});
        //修改或新增
          if (saveDto.getId() != null && saveDto.getId() != 0L) {

              this.${(table.mapperName)?uncap_first}.updateById(${(table.entityName)?uncap_first});
            return ${(table.entityName)?uncap_first}.getId();
          } else {
            this.${(table.mapperName)?uncap_first}.insert(${(table.entityName)?uncap_first});
            return ${(table.entityName)?uncap_first}.getId();
          }
    }





     /**
      * 功能描述: 查看${table.comment}详情
      *
      * @param:
      * @auther: xiaobing
      * @date: ${date}
      * @return:
     */
     @Override
     public ${table.entityName} detail(Long id) {
         ${table.entityName} ${(table.entityName)?uncap_first} = this.${(table.mapperName)?uncap_first}.selectById(id);
         //判断实体是否有数据
         if (${(table.entityName)?uncap_first} == null) {
         return new ReturnValueLoader(ResultCode.QUERY_DATA_IS_EMPTY);
         }
         //创建结算单位返回实体
         ${table.entityName} detailsVO = new ${table.entityName}();
         BeanUtils.copyProperties(${(table.entityName)?uncap_first}, detailsVO);
         return detailsVO;
     }



    /**
     *
     * 功能描述: 获取${table.comment}列表
     *
     * @param:
     * @auther: xiaobing
     * @date: ${date}
     * @return:
    */
    @Override
    public ReturnValueLoader list(Get${table.entityName}Dto searchDto) {

        //设置分页,pageNum不可以是空,是空的话会报空指针异常
        Page<${table.entityName}> voPage = new Page<>(searchDto.getPageNum(), searchDto.getPageSize);

       //根据条件查询合同集合，使用插件进行分页
       List<${table.entityName}> ${(table.entityName)?uncap_first}List = this.${(table.mapperName)?uncap_first}.searchByPage(voPage, searchDto.getSValue());

        //将数据放入分页插件中
        voPage.setRecords(${(table.entityName)?uncap_first}List);

        return new ReturnValueLoader(voPage);
    }


        /**
        *
        * 功能描述: 新增${table.comment}提交
        *
        * @param:
        * @auther: xiaobing
        * @date: ${date}
        * @return:
        */
        @Override
        @Transactional
        public int submit(${table.entityName} saveDto) {

        //先走一遍保存或修改方法
         Long id = this.put(saveDto);
        //查出实体对象
        ${table.entityName} ${(table.entityName)?uncap_first} = this.${(table.mapperName)?uncap_first}.selectById(id);

        //提交动作直接状态为待审核(state=1)
        /*
        todo 需要根据业务改变
        */

        return 1;
        }



        /**
        *
        * 功能描述: 移除一条${table.comment}信息
        *
        * @param:
        * @auther: xiaobing
        * @date: ${date}
        * @return:
        */
        @Override
        @Transactional
        public int delete(Long id) {

        //根据当前ID查询实体
        ${table.entityName} ${(table.entityName)?uncap_first} = this.${(table.mapperName)?uncap_first}.selectById(id);

        //判断查询的信息是否为空.如果为空,返回提示信息
        if(${(table.entityName)?uncap_first} == null){
        throw new BaseParamException("数据不合法", GlobalExceptionCode.METHOD_ARGUMENT_EXCEPTION_CODE);
        }
        //查询的状态进行判断,如果该数据是提交的数据的话,提示该数据不允许次操作
        /*
        todo 需要根据业务改变
        */

        //判断如果有联系,那么不能删除,返回相应提示信息
        /*
        todo 需要根据业务改变
        */
        //if (!canDelete) {
        //       }
        //执行删除
        int deleteCount = this.${(table.mapperName)?uncap_first}.deleteById(id);
        return deleteCount;
        }


    }