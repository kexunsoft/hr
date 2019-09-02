package com.kexun.hr.controller.statement;

import com.kexun.hr.service.system.TableService;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import utils.ExcelUtil;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("statement")
public class ExcelExportController {


    @Autowired
    private TableService tableService;

    //去Excel导出界面
    @RequestMapping("exportExcel")
    public String exportExcel(Model model, @RequestParam(value = "tableName", defaultValue = "humanfile") String tableName) {

        List<Map<String, Object>> tables = tableService.findAllTable();
        List<Map<String, Object>> columns = tableService.findColumnsByTableName(tableName);

        model.addAttribute("tableName", tableName);

        model.addAttribute("tables", tables);

        model.addAttribute("columns", columns);

        return "exportExcel";
    }

    @RequestMapping("executeExportExcel")
    public void executeExportExcel(String[] title, String tableName, HttpServletResponse response) throws IOException {


//        String [] []

        //根据表查询数据
        List<Map<String, Object>> dataList = tableService.findDateByTableName(tableName);

        String[][] values = new String[dataList.size()][title.length];

        //遍历一维
        for (int i = 0; i < values.length; i++) {

            for (int j = 0; j < values[i].length; j++) {
                values[i][j] = String.valueOf(dataList.get(i).get(title[j]));
            }

        }


        HSSFWorkbook ws = ExcelUtil.create(tableName, title, values);

        ServletOutputStream outputStream = response.getOutputStream();

        ExcelUtil.setResponseHeader(response, tableName + ".xls");

        ws.write(outputStream);

        outputStream.flush();

        outputStream.close();

//        return "";


    }


}
