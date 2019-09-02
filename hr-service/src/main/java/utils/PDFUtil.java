package utils;


import com.itextpdf.text.*;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class PDFUtil {

    public static void create(String sheetName, String[] title, String[][] values, HttpServletResponse response) throws IOException, DocumentException {

        BaseFont baseFont = BaseFont.createFont(
                "STSong-Light",//宋体
                "UniGB-UCS2-H",//使用中文支持编码
                BaseFont.NOT_EMBEDDED);
        Font font = new Font(baseFont);


        //创建纸张显示的大小
        Rectangle rectangle = new Rectangle(PageSize.A4);
        //创建文档内容,设置边距
        Document document = new Document(rectangle, 50, 50, 50, 50);

        ExcelUtil.setResponseHeader(response, sheetName + ".pdf");

        ServletOutputStream outputStream = response.getOutputStream();

        PdfWriter.getInstance(document, outputStream);


        //打开文档
        document.open();

        //创建表格
        PdfPTable table = new PdfPTable(title.length);

        //设置表头
        for (int i = 0; i < title.length; i++) {
            PdfPCell pdfPCell = new PdfPCell(new Paragraph(title[i], font));

            table.addCell(pdfPCell);
        }

        for (int i = 0; i < values.length; i++) {
            for (int j = 0; j < values[i].length; j++) {
                //创建一个单元给紫
                PdfPCell pdfPCell = new PdfPCell(new Paragraph(values[i][j], font));
                table.addCell(pdfPCell);
            }

        }
        document.add(table);
        document.close();
        outputStream.flush();
        outputStream.close();
    }


}
