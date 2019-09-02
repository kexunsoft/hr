import java.util.*;

public class Test2 {
    public static void main(String[] args) {
        int[] newarr = {1, 2, 3};
        int[] lastarr = {1, 2, 4, 5};
        Set<Integer> slastarr = arrayToSet(lastarr);
        Set<Integer> snewarr = arrayToSet(newarr);
        System.out.println(ff(snewarr, slastarr));
    }

    public static Map<String, List<Integer>> ff(Set<Integer> snewarr, Set<Integer> slastarr) {
        List<Integer> list = new ArrayList<Integer>();
        Map<String, List<Integer>> map = new HashMap<String, List<Integer>>();
        for (int i : snewarr) {
            if (!slastarr.contains(i)) {
                list.add(i);
            }
        }
        map.put("tj", list);
        list = new ArrayList<Integer>();
        for (int n : slastarr) {
            //如果新的里面没有旧的
            if (!snewarr.contains(n)) {
                list.add(n);
            }
        }
        map.put("sc", list);
        return map;
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
