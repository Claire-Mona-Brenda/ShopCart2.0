package com.po;
import java.util.*;
public class CalendarBean {
	private String calendar=null;
	private int year=2005,month=0;
	public void setYear(int year){
		this.year=year;
	}
	public int getYear(){
		return year;
	}
	public void setMonth(int month){
		this.month=month;
	}
	public int getMonth(){
		return month;
	}
	public String getCalendar(){
		StringBuffer buffer=new StringBuffer();
		Calendar ����=Calendar.getInstance();
		����.set(year, month-1,1);
		int ���ڼ�=����.get(Calendar.DAY_OF_WEEK)-1;
		int day=0;
		if(month==1||month==3||month==5||month==7||month==8||month==10||month==12){
			day=31;
		}
		if(month==4||month==6||month==9||month==11){
			month=30;
		}
		if(month==2){
			if(((year%4==0)&&(year%100!=0))||(year%400==0))
				day=29;
			else
				day=28;
		}
		String a[]=new String[42];
		for(int i=0;i<42;i++)
			a[i]=" ";
		for(int i=���ڼ�,n=1;i<���ڼ�+day;i++){
			if(n<=9)
				a[i]=String.valueOf(n)+" ";
			else
				a[i]=String.valueOf(n);
			n++;
		}
		buffer.append("<table>");
		buffer.append("<tr>");
		String xingqi[]={"������","����һ","���ڶ�","������","������","������","������"};
		for(int k=0;k<7;k++)
			buffer.append("<td>"+xingqi[k]+"</td>");
		buffer.append("</tr>");
		for(int k=0;k<42;k=k+7){
			buffer.append("<tr>");
			for(int j=k;j<7+k;j++)
				buffer.append("<td>"+a[j]+"</td>");
			buffer.append("</tr>");
		}
		buffer.append("</table>");
	    calendar=new String(buffer);
		return calendar;
	}
}
