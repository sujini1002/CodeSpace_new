package com.team.cos.project.vo;

import java.util.List;

public class calendarVo {
	private int year;
	private int month;
	private int date;
	private int startDay;
	private int endDay;
	private int start;
	private int newLine;
	private int today;
	private List<Integer> arrayDay;
	private List<String> fulldate;

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getDate() {
		return date;
	}

	public void setDate(int date) {
		this.date = date;
	}

	public int getStartDay() {
		return startDay;
	}

	public void setStartDay(int startDay) {
		this.startDay = startDay;
	}

	public int getEndDay() {
		return endDay;
	}

	public void setEndDay(int endDay) {
		this.endDay = endDay;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getNewLine() {
		return newLine;
	}

	public void setNewLine(int newLine) {
		this.newLine = newLine;
	}

	public int getToday() {
		return today;
	}

	public void setToday(int today) {
		this.today = today;
	}

	public List<Integer> getArrayDay() {
		return arrayDay;
	}

	public void setArrayDay(List<Integer> arrayDay) {
		this.arrayDay = arrayDay;
	}

	public List<String> getFulldate() {
		return fulldate;
	}

	public void setFulldate(List<String> fulldate) {
		this.fulldate = fulldate;
	}

	@Override
	public String toString() {
		return "calendarVo [year=" + year + ", month=" + month + ", date=" + date + ", startDay=" + startDay
				+ ", endDay=" + endDay + ", start=" + start + ", newLine=" + newLine + ", today=" + today
				+ ", arrayDay=" + arrayDay + ", fulldate=" + fulldate + "]";
	}

}
