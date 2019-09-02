import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public class Test {

    public static void main(String[] args) {
        //获取交集
        int[] newarr = {1, 2, 3};
        int[] lastarr = {1, 2, 4, 5};

        Set<Integer> intersection = intersection(lastarr, newarr);

        for (int i : intersection) {
            System.out.println(i);
        }

        System.out.println("==delete==");
        Set<Integer> delete = delete(intersection, lastarr);
        for (int i : delete) {
            System.out.println(i);
        }

        System.out.println("==add==");
        Set<Integer> add = add(intersection, newarr);
        for (int i : add) {
            System.out.println(i);
        }


    }

    //计算并集
    public static Set<Integer> intersection(int[] lastarr, int[] newarr) {

        Set<Integer> all = new HashSet<Integer>();

        Set<Integer> lastset = arrayToSet(lastarr);

        for (int n : newarr) {
            if (lastset.contains(n)) {
                all.add(n);
            }
        }
        return all;

    }

    //计算删除的
    public static Set<Integer> delete(Set<Integer> intersection, int[] lastarr) {

        Set<Integer> integers = arrayToSet(lastarr);
        integers.removeAll(intersection);

        return integers;

    }

    //添加的
    public static Set<Integer> add(Set<Integer> intersection, int[] newarr) {

        Set<Integer> integers = arrayToSet(newarr);
        integers.removeAll(intersection);
        return integers;

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
