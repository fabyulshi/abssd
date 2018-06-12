/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.util;

import java.text.DateFormat;
import java.util.Date;
import java.text.SimpleDateFormat;
import org.joda.time.Days;
import org.joda.time.ReadableInstant;

/**
 *
 * @author jaydeep
 */
public class Test {
    
    public static void main(String[] args)throws Exception
    {
        String date = "2018-04-18 01:00:00 PM";
         String dat = "2018-04-18 03:00:00 PM";
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm");
        Date date1 = dateFormat.parse(date);
        Date date2 = dateFormat.parse(dat);
        String str = dateFormat.format(date1);
        String str1 = dateFormat.format(date2);
        //System.out.println(str);
        int flag = Test.dateDiffernce(str,str1);
        System.out.println(flag);
     
        long difference = date2.getTime() - date1.getTime();
	       float daysBetween = (difference / (1000*60*60*24));
               System.out.println(daysBetween);
                       
        
        
    }
    
    public static int dateDiffernce(String sdate,String ldate)throws Exception
    {
    	System.out.println("ssssssssssss");
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm");
Date date = new Date();
//System.out.println(dateFormat.format(date));
  //System.out.println(new1);  
     SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
        Date date1 =  sdf.parse(sdate);
        Date date2 =  sdf.parse(dateFormat.format(date));
        //Date date2 =  sdf.parse(ldate);

        System.out.println("date1 : " + sdf.format(date1));
        System.out.println("date2 : " + sdf.format(date2));
        //System.out.println(date1.compareTo(date2));
        if (date1.compareTo(date2) > 0) {
            System.out.println("Date1 is after Date2");
        } else if (date1.compareTo(date2) < 0) {
            System.out.println("Date1 is before Date2");
        } else if (date1.compareTo(date2) == 0) {
            System.out.println("Date1 is equal to Date2");
        } else {
            System.out.println("How to get here?");
        }
        
          return date1.compareTo(date2);
        }
}

