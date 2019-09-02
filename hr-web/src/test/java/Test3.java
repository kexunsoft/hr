import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public class Test3 {
    public static void main(String[] args) {
        String json = "[{\"itemId\":1,\"salary\":0.0},{\"itemId\":2,\"salary\":0.0},{\"itemId\":3,\"salary\":0.0},{\"itemId\":4,\"salary\":0.0},{\"itemId\":5,\"salary\":0.0},{\"itemId\":6,\"salary\":0.0}]";

        JSONArray objects = JSON.parseArray(json);

//        System.out.println(objects);

        for (int i = 0; i < objects.size(); i++) {

            System.out.println(((JSONObject) objects.get(i)).get("itemId"));

        }


    }
}
