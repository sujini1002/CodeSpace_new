<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<meta charset="UTF-8">
<title>Document</title>
<style>
* {
	margin: auto;
	text-align: center;
	text-decoration: none;
}

a {
	padding 0px;
	font-weight: bolder;
	font-size: 20px;
	color: black;
	border: 1px solid #b4b4b4;
	border-radius: 75px; 
	background-color: rgb(126, 148, 216);
	line-height: inherit;
}

a:hover {
	color: red;
}

.h_table {
	width: 600px;
	border: 1px solid black;
}

.h_table tr {
	height: 50px;
}

.h_table td {
	width: 80px;
	margin: 1px;
	/* border: 1px solid blue; */
}

.sun {
	color: red;
}
.sat {
	color: blue;
}
.week{
	border: 1px solid gray;
}
.empty_room{
	border:none;
}
.h_day:hover {
	background-color: #867979;
}
</style>
</head>

<body>
	<button onclick="today()">오늘 날짜로 이동!</button>
	<table class = "h_table">
		<tr>
			<td colspan="7">
			
				<a href="${pageContext.request.contextPath }/userinfo/precal?year=${cal.year-1 }&month=${cal.month }">&lt;&lt;</a>&nbsp;
				<a href="${pageContext.request.contextPath }/userinfo/precal?year=${cal.year }&month=${cal.month-1 }">&lt;</a>
				&nbsp;${cal.year }년 ${cal.month+1 }월&nbsp; 
				<a href="${pageContext.request.contextPath }/userinfo/postcal?year=${cal.year }&month=${cal.month+1 }">&gt;</a>&nbsp;
				<a href="${pageContext.request.contextPath }/userinfo/postcal?year=${cal.year+1 }&month=${cal.month }">&gt;&gt;</a>
			</td>
		</tr>
		<tr class="week">
			<td class="sun">일</td>
			<td>월</td>
			<td>화</td>
			<td>수</td>
			<td>목</td>
			<td>금</td>
			<td class="sat">토</td>
		</tr>
		<tbody class="day_of_the_week"></tbody>
	</table>
	<script>
		$(document).ready(function() {
			var kk = '${cal}';
			var day = '${cal.start}' * 1;	//day == 5
			var startDay = '${cal.startDay}' * 1;	//startDay == 1 
			var endDay = '${cal.endDay}' * 1;		//endDay == 30
			var newLine = 0;
			var str = '<tr>';
			
			//달력 앞쪽 공백 출력		   5
			for ( var i = 1 ; i < day ; i ++ ){
				str += '<td class="empty_room">&nbsp;</td>';
				newLine++;
			}
			
			//달력 1일 부터 날짜 계산
			for ( var i = startDay ; i <= endDay ; i++ ){
				str += '<td class="h_day">' + i + '</td>';
				newLine++;
				if(newLine % 7 == 0){
					str+='</tr>';
					$('.day_of_the_week').html(str);
				}else{
					$('.day_of_the_week').html(str);
				}
			}
		});
		
		function today(){
			location.href="${pageContext.request.contextPath}/userinfo/hjscal"
		}
	</script>
</body>
</html>