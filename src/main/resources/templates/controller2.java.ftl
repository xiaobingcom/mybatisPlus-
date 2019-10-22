package ${package.Controller};

import io.swagger.annotations.*;
import com.mybatisplus.response.ReturnValueLoader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import ${package.Service}.${table.serviceName};
import ${package.Entity}.${table.entityName};
import javax.validation.Valid;

/**
 * ${table.comment} 控制层
 *
 * @author xiaobing
 * @version v1.0.0
 * @date ${date}
 * @Description Modification History:
 * Date                 Author          Version          Description
 * ---------------------------------------------------------------------------------*
 * ${date}             xiaobing          v1.0.0           Created
*/
@Api(tags = "${table.comment}")
@RestController
@RequestMapping("/${table.entityName}")
public class ${table.controllerName} {

    @Autowired
    private ${table.serviceName} ${(table.serviceName)?uncap_first};

    /**
     * 功能描述: 新增${table.comment}
     *
     * @param: saveDto 新增需要的参数
     * @auther: xiaobing
     * @date: ${date}
     * @return:
    */
    @PutMapping
    @ApiOperation(value = "新增${table.comment}")
    @ApiResponses({@ApiResponse(code = 0, response = int.class, message = "获取数据成功")})
    public ReturnValueLoader put(@Valid @RequestBody ${table.entityName} saveDto) {

    Long id  = ${(table.serviceName)?uncap_first}.put(saveDto);
    return new ReturnValueLoader();
    }

    /**
     * 功能描述: 查看${table.comment}
     *
     * @param:
     * @auther: xiaobing
     * @date: ${date}
     * @return:
    */
    @ApiOperation(value = "查看${table.comment}")
    @ApiResponses({@ApiResponse(code = 0, response = ${table.entityName}.class, message = "获取数据成功")})
    @GetMapping
    public ReturnValueLoader detail(@RequestParam Long id) {
    ${table.entityName} ${(table.entityName)?uncap_first} = ${(table.serviceName)?uncap_first}.detail(id);
    return ReturnValueLoader(${(table.entityName)?uncap_first});
    }

    /**
     * 功能描述: ${table.comment}列表
     *
     * @param:
     * @auther: xiaobing
     * @date: ${date}
     * @return:
    */

    @ApiOperation(value = "${table.comment}列表")
    @ApiResponses({@ApiResponse(code = 0, response =  ${table.entityName}.class, message = "获取数据成功"),})
    @PostMapping
    public ReturnValueLoader list(@Valid @RequestBody Get${table.entityName}Dto searchDto) {

    return ${(table.serviceName)?uncap_first}.list(searchDto);
    }

    /**
    * 功能描述: 提交新增的${table.comment}
    *
    * @param:
    * @auther: xiaobing
    * @date: ${date}
    * @return: returnValueLoader
    */
    @ApiOperation(value = "新增${table.comment}提交")
    @ApiResponses({
    @ApiResponse(code = 0, response = ReturnValueLoader.class, message = "提交成功"),
    })
    @PostMapping("/submit")
    public ReturnValueLoader submit(@Valid @RequestBody ${table.entityName} saveDto) {

    int submitCount = this.${(table.serviceName)?uncap_first}.submit(saveDto);
    return ReturnValueLoader.validatorCount(submitCount);
    }


    /**
    * 功能描述: ${table.comment}移除
    *
    * @param:
    * @auther: xiaobing
    * @date: ${date}
    * @return:
    */
    @ApiOperation(value = "${table.comment}删除", notes = "删除使用")
    @ApiResponses({
    @ApiResponse(code = 0, response = ReturnValueLoader.class, message = "success"),
    })
    @DeleteMapping
    public ReturnValueLoader delete(@RequestParam @ApiParam("${table.comment}ID") Long id) {

    int deleteCount = this.${(table.serviceName)?uncap_first}.delete(id);
    return ReturnValueLoader.validatorCount(deleteCount);
    }


}
