package ${package.Entity};

import com.baomidou.mybatisplus.annotation.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.util.Date;


/**
 * ${table.comment} 实体类
 * Module: ${table.entityName}.java
 *
 * @author xiaobing
 * @since JDK 1.8
 * @version 1.1
 * @date ${date}
 * @Descriptions:
*/
@Getter
@Setter
@ToString
@TableName(value = "${table.name}")
public class ${table.entityName}  {


<#list table.fields as $column>
    /**
    ${$column.comment}
    */
    <#if  ("id" == $column.propertyName)>
    @TableId(value = "id", type = IdType.ID_WORKER)
    </#if>
    <#if  ("createTime" == $column.propertyName)>
    @TableField(fill = FieldFill.INSERT)
    </#if>
    <#if  ("updateTime" == $column.propertyName)>
    @TableField(fill = FieldFill.INSERT_UPDATE)
    </#if>
    <#if  ("date" == $column.type)>
    @JSONField(format = "yyyy-MM-dd")
    </#if>
    <#if  ("datetime" == $column.type)>
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    </#if>
    <#if  ("bigint" == $column.type)>
    @JsonSerialize(using = ToStringSerializer.class)
    </#if>
    @TableField(value = "${$column.name}",strategy = FieldStrategy.NOT_EMPTY)
    @ApiModelProperty(value = "${$column.comment}")
    private ${$column.propertyType} ${$column.propertyName};

</#list>
}