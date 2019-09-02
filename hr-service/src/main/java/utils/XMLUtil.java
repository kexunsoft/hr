package utils;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

public class XMLUtil {

    public static void create(String sheetName, String[] title, String[][] values, HttpServletResponse response) {
        try {
            // 创建解析器工厂
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder db = factory.newDocumentBuilder();
            Document document = db.newDocument();
            // 不显示standalone="no"
            document.setXmlStandalone(true);
            Element list = document.createElement("list");

            for (int i = 0; i < values.length; i++) {
                Element book = document.createElement(sheetName);
                for (int j = 0; j < values[i].length; j++) {
                    // 向bookstore根节点中添加子节点book
                    Element name = document.createElement(title[j]);
                    name.setTextContent(values[i][j]);
                    book.appendChild(name);

                    list.appendChild(book);
                }

            }

            document.appendChild(list);

            // 创建TransformerFactory对象
            TransformerFactory tff = TransformerFactory.newInstance();
            // 创建 Transformer对象
            Transformer tf = tff.newTransformer();

            // 输出内容是否使用换行
            tf.setOutputProperty(OutputKeys.INDENT, "yes");
            // 创建xml文件并写入内容

            ExcelUtil.setResponseHeader(response, sheetName + ".xml");

            tf.transform(new DOMSource(document), new StreamResult(response.getOutputStream()));


        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
