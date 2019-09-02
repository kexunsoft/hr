package com.kexun.hr.service.system;

import com.kexun.hr.dao.TableMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class TableService {


    @Autowired
    private TableMapper tableMapper;
    //查询所有的表

    public List<Map<String, Object>> findAllTable() {
        return tableMapper.findAllTable();
    }


    //根据表名查询所有字段
    public List<Map<String, Object>> findColumnsByTableName(String tableName) {
        return tableMapper.findColumnsByTableName(tableName);
    }

    //根据表名生成数据
    public List<Map<String, Object>> findDateByTableName(String tableName) {

        return tableMapper.findDateByTableName(tableName);

    }


}
