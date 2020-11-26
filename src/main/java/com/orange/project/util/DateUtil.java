package com.orange.project.util;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 说明：日期处理
 * 创建人：FH Q313596790
 * 修改时间：2015年11月24日
 */
public class DateUtil {

	private final static SimpleDateFormat sdfYear = new SimpleDateFormat("yyyy");
	private final static SimpleDateFormat sdfDay = new SimpleDateFormat("yyyy-MM-dd");
	private final static SimpleDateFormat sdfDays = new SimpleDateFormat("yyyyMMdd");
	private final static SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	/**
	 * 获取YYYY格式
	 *
	 * @return
	 */
	public static String getYear() {
		return sdfYear.format(new Date());
	}

	/**
	 * 获取YYYY-MM-DD格式
	 *
	 * @return
	 */
	public static String getDay() {
		return sdfDay.format(new Date());
	}

	/**
	 * 获取YYYYMMDD格式
	 *
	 * @return
	 */
	public static String getDays() {
		return sdfDays.format(new Date());
	}

	/**
	 * 获取YYYY-MM-DD HH:mm:ss格式
	 *
	 * @return
	 */
	public static String getTime() {
		return sdfTime.format(new Date());
	}

	public static Timestamp getCurrentTime() {
		return new Timestamp(new Date().getTime());
	}

	/**
	 * @param s
	 * @param e
	 * @return boolean
	 * @throws
	 * @Title: compareDate
	 * @Description: TODO(日期比较 ， 如果s > = e 返回true 否则返回false)
	 * @author fh
	 */
	public static boolean compareDate(String s, String e) {
		if (formatDate(s) == null || formatDate(e) == null) {
			return false;
		}
		return formatDate(s).getTime() >= formatDate(e).getTime();
	}

	/**
	 * 格式化日期
	 *
	 * @return
	 */
	public static Date formatDate(String date) {
		return formatDate(date,"yyyy-MM-dd");
	}
	/**
	 * 格式化日期
	 *
	 * @return
	 */
	public static Date formatDate(String date,String format) {
		if(format==null||format.equals("")){
			format= "yyyy-MM-dd";
		}
		DateFormat fmt = new SimpleDateFormat(format);
		try {
			return fmt.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * 格式化日期
	 *
	 * @return
	 */
	public static String formatDate(Date date,String format) {
		return new SimpleDateFormat(format).format(date);
	}
	/**
	 * 格式化日期
	 *
	 * @return
	 */
	public static Date formatDate(Object date,String format) {
		return formatDate(date.toString(),format);
	}


	/**
	 * 校验日期是否合法
	 *
	 * @return
	 */
	public static boolean isValidDate(String s) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			fmt.parse(s);
			return true;
		} catch (Exception e) {
			// 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
			return false;
		}
	}

	/**
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public static int getDiffYear(String startTime, String endTime) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			//long aa=0;
			int years = (int) (((fmt.parse(endTime).getTime() - fmt.parse(startTime).getTime()) / (1000 * 60 * 60 * 24)) / 365);
			return years;
		} catch (Exception e) {
			// 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
			return 0;
		}
	}

	/**
	 * <li>功能描述：时间相减得到天数
	 *
	 * @param beginDateStr
	 * @param endDateStr
	 * @return long
	 * @author Administrator
	 */
	public static long getDaySub(String beginDateStr, String endDateStr) {
		long day = 0;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date beginDate = null;
		Date endDate = null;

		try {
			beginDate = format.parse(beginDateStr);
			endDate = format.parse(endDateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		day = (endDate.getTime() - beginDate.getTime()) / (24 * 60 * 60 * 1000);
		//// //注释  System.out.println("相隔的天数="+day);

		return day;
	}

	/**
	 * 得到n天之后的日期
	 *
	 * @param days
	 * @return
	 */
	public static String getAfterDayDate(String days) {
		int daysInt = Integer.parseInt(days);

		Calendar canlendar = Calendar.getInstance(); // java.util包
		canlendar.add(Calendar.DATE, daysInt); // 日期减 如果不够减会将月变动
		Date date = canlendar.getTime();

		SimpleDateFormat sdfd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateStr = sdfd.format(date);

		return dateStr;
	}

	/**
	 * 得到n天之后的日期
	 *
	 * @param days
	 * @return
	 */
	public static String getAfterDayDate(String days, String dates) throws ParseException {
		int daysInt = Integer.parseInt(days);

		Calendar canlendar = Calendar.getInstance(); // java.util包
		SimpleDateFormat dateFormat;
		if (dates.indexOf(" ") >= 0) {
			dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		} else {
			dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		}
		// 指定一个日期
		Date _date = dateFormat.parse(dates);
		// 对 calendar 设置为 date 所定的日期
		canlendar.setTime(_date);
		canlendar.add(Calendar.DATE, daysInt); // 日期减 如果不够减会将月变动
		Date date = canlendar.getTime();

		String dateStr = dateFormat.format(date);

		return dateStr;
	}

	/**
	 * 得到n天之后是周几
	 *
	 * @param days
	 * @return
	 */
	public static String getAfterDayWeek(String days) {
		int daysInt = Integer.parseInt(days);
		Calendar canlendar = Calendar.getInstance(); // java.util包
		canlendar.add(Calendar.DATE, daysInt); // 日期减 如果不够减会将月变动
		Date date = canlendar.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("E");
		String dateStr = sdf.format(date);
		return dateStr;
	}

	public static void main(String[] args) throws ParseException {
//    	// //注释  System.out.println(getDays());
//    	// //注释  System.out.println(getAfterDayDate("3"));
		try {
			long s = DateUtil.getDateDiffByTime("2019-10-23 15:00:00", "2019-10-23 14:00:00");
			// //注释  System.out.println(s);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		// //注释  System.out.println(getWeekDate());
		// //注释  System.out.println(getAfterDayDate("1", "2019-11-3 11:52:46"));
	}


	/**
	 * 获取连个时间之间的天数差
	 */
	public static long getDateDiffDay(String date1, String date2) throws ParseException {
		long time = getDateDiff(date1, date2);
		return time / (1000 * 3600 * 24);
	}

	/**
	 * 获取连个时间之间的时数差
	 */
	public static long getDateDiffHours(String date1, String date2) throws ParseException {
		long time = getDateDiff(date1, date2);
		return time / (1000 * 3600);
	}

	/**
	 * 获取连个时间之间的分钟数差
	 */
	public static long getDateDiffMinute(String date1, String date2) throws ParseException {
		long time = getDateDiff(date1, date2);
		return time / (1000 * 60);
	}

	/**
	 * 获取连个时间之间的秒数差
	 */
	public static long getDateDiffSecond(String date1, String date2) throws ParseException {
		long time = getDateDiff(date1, date2);
		return time / (1000);
	}

	/**
	 * 获取连着之间的时间差  "yyyy-MM-dd"
	 *
	 * @param date1
	 * @param date2
	 * @return
	 * @throws ParseException
	 */
	public static long getDateDiff(String date1, String date2) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date fDate = sdf.parse(date1);
		Date oDate = sdf.parse(date2);
		return oDate.getTime() - fDate.getTime();
	}

	/**
	 * 获取连着之间的时间差  "yyyy-MM-dd  HH:mm:ss"
	 *
	 * @param date1
	 * @param date2
	 * @return
	 * @throws ParseException
	 */
	public static long getDateDiffByTime(String date1, String date2) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date fDate = sdf.parse(date1);
		Date oDate = sdf.parse(date2);
		return oDate.getTime() - fDate.getTime();
	}


	/**
	 * 当前时间所在一周的周一和周日时间
	 *
	 * @return
	 */
	public static Map<String, String> getWeekDate() {
		Map<String, String> map = new HashMap();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Calendar cal = Calendar.getInstance();
		cal.setFirstDayOfWeek(Calendar.MONDAY);// 设置一个星期的第一天，按中国的习惯一个星期的第一天是星期一
		int dayWeek = cal.get(Calendar.DAY_OF_WEEK);// 获得当前日期是一个星期的第几天
		if (dayWeek == 1) {
			dayWeek = 8;
		}

		cal.add(Calendar.DATE, cal.getFirstDayOfWeek() - dayWeek);// 根据日历的规则，给当前日期减去星期几与一个星期第一天的差值
		Date mondayDate = cal.getTime();
		String weekBegin = sdf.format(mondayDate);


		cal.add(Calendar.DATE, 4 + cal.getFirstDayOfWeek());
		Date sundayDate = cal.getTime();
		String weekEnd = sdf.format(sundayDate);

		map.put("mondayDate", weekBegin);
		map.put("sundayDate", weekEnd);
		return map;
	}

}
