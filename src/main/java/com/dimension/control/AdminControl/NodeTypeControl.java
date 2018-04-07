package com.dimension.control.AdminControl;

import com.dimension.dao.FieldMapper;
import com.dimension.dao.TableFieldMapper;
import com.dimension.dao.TableMapper;
import com.dimension.pojo.*;
import com.dimension.service.TableFieldService;
import com.dimension.serviceImpl.MapResultHandler;
import com.dimension.serviceImpl.SessionMapper;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class NodeTypeControl {
    @Resource
    private TableFieldService tableFieldService;
    @Resource
    private TableFieldMapper tableFieldMapper;
    @Resource
    private TableMapper tableMapper;
    @Resource
    SessionMapper sessionMapper;
    @Resource
    FieldMapper fieldMapper;

    private static final int count = 1;

    @RequestMapping("/nodeType")
    public String nodeType(Table table, Model model) throws JsonProcessingException {

        List<Table> tables = tableMapper.selectByCondition(table,0,count);
        Map<Integer,Integer> map=sessionMapper.count();
        System.out.println(map);

        for (Table table1:tables) {
            if(map.get(table1.getId())==null){
                table1.setCount(0);
            }
            else{
                table1.setCount(table1.getId());
            }

        }
        int totalCount = tableMapper.count(table);
        int totalPage = (totalCount + count - 1) / count;
        ObjectMapper mapper = new ObjectMapper();
        String tablesJson=mapper.writeValueAsString(tables);
        model.addAttribute("tables", tables);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("tablesJson", tablesJson);
        model.addAttribute("currentPage", 1);
        return "/admin/nodeType";
    }


    @RequestMapping("/nodeType/{start}")
    @ResponseBody
    public Map<String, Object> nodeTypeAjax(Table table,  @PathVariable int start) {
        MapResultHandler mapResultHandler=new MapResultHandler();
        start--;
        List<Table> tables = tableMapper.selectByCondition(table,start*count,count);
        if (tables.size() == 0) {
            start--;
        }
        tables = tableMapper.selectByCondition(table,start*count,count);
        Map<Integer,Integer> map1=sessionMapper.count();
        for (Table table1:tables) {
            table1.setCount(map1.get(table1.getId()));
        }
        int totalCount = tableMapper.count(table);
        int totalPage = (totalCount + count - 1) / count;
        Map<String, Object> map = new HashMap<>();
        map.put("tables", tables);
        map.put("totalPage", totalPage);
        map.put("currentPage", start + 1);
        return map;
    }

    @RequestMapping("/nodeType/validTable/{tableid}")
    @ResponseBody
    public Map<String, Object> validTable(@PathVariable int tableid,String state) {
        Map<String, Object> map = new HashMap<>();
        Table table=new Table();
        table.setId(tableid);
        table.setIsvalid(state);
        tableMapper.updateByPrimaryKeySelective(table);
        return map;
    }

    @RequestMapping("/nodeType/validField/{fieldid}")
    @ResponseBody
    public Map<String, Object> validField(@PathVariable int fieldid,String state) {
        Map<String, Object> map = new HashMap<>();

        Field field=new Field();
        field.setId(fieldid);
        field.setIsvalid(state);
        System.out.println(field);
        fieldMapper.updateByPrimaryKeySelective(field);
        return map;
    }
    @RequestMapping(value="/nodeType/update/{tableid}/{start}")
    @ResponseBody
    public Map<String, Object> update(@PathVariable int tableid,@PathVariable int start,
                                      @RequestBody Map<String,List<Field> > json,
                                       String tablechineseName,  String conditon) {

        Table table=new Table();
        table.setId(tableid);
        table.setChinesename(tablechineseName);
        tableMapper.updateByPrimaryKeySelective(table);
        table=tableMapper.selectByPrimaryKey(tableid);
        //需要更改信息的字段数组
        List<Field> update=json.get("update");
        for (Field field:update) {
            fieldMapper.updateByPrimaryKeySelective(field);
        }
        //需要更改表的数组
        List<Field> add=json.get("add");
        int fieldCount=fieldMapper.maxFieldId(tableid)+1;
        //更改表
        for (Field field:add) {
            String tableEnglish=table.getEnglishname();
            String fieldEnglish=tableEnglish+"_"+Integer.toString(fieldCount);
            field.setEnglishname(fieldEnglish);
            tableFieldMapper.addField(tableEnglish,fieldEnglish,field.getFieldtype());
            fieldCount++;
        }
        //插入到field中
        for (Field field:add) {
            field.setTableid(tableid);
            fieldMapper.insertSelective(field);
        }
        table=new Table();
        table.setChinesename(conditon);
        return nodeTypeAjax(table,start);
    }

    /**
     * 将要构造表，初始会有一个nodeid.这是唯一的检索，初始的时候插入到table_type中，构造的表名字的规则为table_id.
     * 然后构造每个字段。字段的构造规则为这个表中，id最大的那个字段为起始。{tablename}_id
     * @param start
     * @param table
     * @param conditon
     * @param json
     * @return
     */
    @RequestMapping(value="/nodeType/addTable/{start}")
    @ResponseBody
    public Map<String, Object> addTable(@PathVariable int start, String chinesename,  String conditon,
                                      @RequestBody Map<String,List<Field> > json) {
        Table table=new Table();
        table.setChinesename(chinesename);
        //设置table的name，并且插入到table_type中
        tableMapper.insertSelective(table);
        table.setEnglishname("table_"+Integer.toString(table.getId()));
        tableMapper.updateByPrimaryKeySelective(table);

        //插入第一个field
        Field field=new Field();
        field.setTableid(table.getId());
        field.setFieldtype("bigint");
        field.setEnglishname("nodeid");
        field.setChinesename(table.getChinesename()+"的唯一标识");
        fieldMapper.insertSelective(field);
        int fieldCount=field.getId()+1;
        //需要更改表的数组
        List<Field> add=json.get("add");
        //设置字段名称
        String tableEnglish=table.getEnglishname();
        for (Field field1: add) {
            field1.setTableid(table.getId());
            String fieldEnglish=tableEnglish+"_"+Integer.toString(fieldCount);
            field1.setEnglishname(fieldEnglish);
            fieldCount++;
        }
        //构造表
        tableFieldMapper.createTable(table.getEnglishname(),add);

        //插入到field中
        for (Field field1:add) {
            fieldMapper.insertSelective(field1);
        }
        table=new Table();
        table.setChinesename(conditon);
        return nodeTypeAjax(table,start);
    }
}
