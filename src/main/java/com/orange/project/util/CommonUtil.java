package com.orange.project.util;

import java.io.UnsupportedEncodingException;
import java.util.Random;

public class CommonUtil {

    /**
     * 产生随机数,包前不包后
     *
     * @param min
     * @param max
     * @return
     */
    public static int random(int min, int max) {
        Random rand = new Random();
        return (rand.nextInt(max - min) + (min));
    }

    /**
     * 将GBK转成utf8
     *
     * @param str
     * @return
     */
    public static String enGbkToUtf8(String str) throws UnsupportedEncodingException {
        return new String(str.getBytes("GBK"), "UTF-8");
    }


    /**
     * 判断字符是否为空或空字符串
     *
     * @param str
     * @return
     */
    public static Boolean isNotOrEmpty(String str) {
        return str == null || str.equals("");
    }

    /**
     * 判断字符是否为空或空字符串
     *
     * @param str
     * @return
     */
    public static Boolean isNotOrEmpty(Object str) {
        return str == null || str.equals("");
    }


    /**
     * 判断字符是否为空或空字符串
     *
     * @param str
     * @return
     */
    public static String isNotOrEmpty(String str, String defaults) {
        boolean flg = str == null || str.equals("");
        return flg ? defaults : str;
    }

    /**
     * 判断字符是否为空或空字符串
     *
     * @param str
     * @return
     */
    public static Object isNotOrEmpty(Object str, String defaults) {
        boolean flg = str == null || str.equals("");
        return flg ? defaults : str;
    }
}
