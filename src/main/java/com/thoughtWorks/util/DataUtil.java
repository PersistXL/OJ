package com.thoughtWorks.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by 马欢欢 on 2018/4/13.
 */
public  class DataUtil {
    public static String outDate(){
        Date day=new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        return df.format(day);
    }
    public static String outDateAddMin(int mm){
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Calendar nowTime = Calendar.getInstance();
        nowTime.add(Calendar.MINUTE, mm);
        return df.format(nowTime.getTime());
    }
}
