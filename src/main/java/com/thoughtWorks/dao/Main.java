package com.thoughtWorks.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Main {
    public static void main(String[] args) {
        String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        String b = "2018-02-15 12:30:00";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

        try {
            System.out.println(sdf.parse(nowTime).before(sdf.parse(b)));
            System.out.println(sdf.parse(b).before(sdf.parse(nowTime)));
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }
}
