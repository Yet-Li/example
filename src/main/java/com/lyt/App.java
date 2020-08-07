package com.lyt;


import java.util.ArrayList;
import java.util.Random;

public class App {
    public static void main( String[] args ) {

        //产生50万个不重复的整数，并且有一个记录数组位置下标的ArrayList集合。。。
        int[] arrayBefore = new int[500000];
        ArrayList<Integer> location = new ArrayList<>();
        for (int i = 0; i < arrayBefore.length; i++) {
            arrayBefore[i] = i;
            location.add(i);
        }

        Random random = new Random();
        int[] arrayAfter = new int[100000];
        for (int i = 0; i < arrayAfter.length; i++) {
            //在一个0-500000的数组下标中产生一个随机的下标。。。
            int indexValue = random.nextInt(location.size());
            int indexArray = location.get(indexValue);
            location.remove(indexValue);

            arrayAfter[i] = arrayBefore[indexArray];

            System.out.println(arrayAfter[i]);
        }


    }
}
