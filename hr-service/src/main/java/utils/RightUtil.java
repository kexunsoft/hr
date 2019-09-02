package utils;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class RightUtil {

    public static void main(String[] args) {
        //添加3 删除4,5

        int[] newarr = {1, 2, 3};
        int[] lastarr = {1, 2, 4, 5};
        Set<Integer> delete = delete(newarr, lastarr);
        System.out.println("删除");
        for (int i : delete) {
            System.out.println(i);
        }
        System.out.println("添加");
        Set<Integer> add = add(newarr, lastarr);
        for (int i : add) {
            System.out.println(i);
        }
    }


    //计算删除的
    public static Set<Integer> delete(int[] newarr, int[] lastarr) {

        HashSet<Integer> res = new HashSet<>();
        Set<Integer> newSet = arrayToSet(newarr);
        Set<Integer> lastSet = arrayToSet(lastarr);
        for (int last : lastSet) {
            //如果上传的里面不存在之前有的就要删除
            if (!newSet.contains(last)) {
                res.add(last);
            }
        }
        return res;

    }

    //添加的
    public static Set<Integer> add(int[] newarr, int[] lastarr) {
        HashSet<Integer> res = new HashSet<>();
        Set<Integer> newSet = arrayToSet(newarr);
        Set<Integer> lastSet = arrayToSet(lastarr);
        for (int news : newSet) {
            //如果之前的里面存在新的就要添加
            if (!lastSet.contains(news)) {
                res.add(news);
            }
        }
        return res;
    }

    //数组转set
    public static Set<Integer> arrayToSet(int[] arr) {


        HashSet<Integer> set = new HashSet<Integer>();
        for (int l : arr) {
            set.add(l);
        }
        return set;


    }

}
