package com.kexun.hr.dao;

import java.util.List;
import java.util.Map;

public interface TableMapper {


    List<Map<String, Object>> findAllTable();


    List<Map<String, Object>> findColumnsByTableName(String tableName);


    List<Map<String, Object>> findDateByTableName(String tableName);


}
