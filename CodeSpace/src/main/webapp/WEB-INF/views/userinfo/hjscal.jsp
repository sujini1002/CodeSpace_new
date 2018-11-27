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
	font-weight: bolder;
	font-size: 20px;
}

a:hover {
	color: red;
}

table {
	width: 600px;
	border: 1px solid aqua;
}

tr {
	height: 50px;
}

td {
	width: 80px;
	border: 1px solid blue;
}

.holiday {
	color: red;
}
</style>
</head>

<body>
	<h2>${cal }</h2>
	<table>
		<tr>
			<td colspan="7"><a
				href="${pageContext.request.contextPath }/userinfo/precal?year=${cal.year-1 }&month=${cal.month }">&lt;&lt;</a>
				<a
				href="${pageContext.request.contextPath }/userinfo/precal?year=${cal.year }&month=${cal.month-1 }">&lt;</a>
				&nbsp;${cal.year }년 ${cal.month+1 }월&nbsp; <a
				href="${pageContext.request.contextPath }/userinfo/postcal?year=${cal.year }&month=${cal.month+1 }">&gt;</a>
				<a
				href="${pageContext.request.contextPath }/userinfo/postcal?year=${cal.year+1 }&month=${cal.month }">&gt;&gt;</a>
			</td>
		</tr>
		<tr>
			<td class="holiday">일</td>
			<td>월</td>
			<td>화</td>
			<td>수</td>
			<td>목</td>
			<td>금</td>
			<td class="holiday">토</td>
		</tr>
		<tbody class="day_of_the_week">
		</tbody>
	</table>
	<script>
		$(document).ready(function() {
			var kk = '${cal}';
			var day = '${cal.start}';
			var startDay = '${cal.startDay}';
			var endDay = '${cal.endDay}';
			var newLine = 0;
			var cnt = 0;
			console.log(day);
			var str = '<tr>';
			for (var i = 1; i < day; i++) {
				str += '<td class="h_date">&nbsp;</td>';
				/* newLine++; */
			}

			console.log("연산 끝,newLine:" + newLine);
			console.log(endDay * 1 + 6);
			for (var i = startDay; i <= ((endDay * 1) + 6); i++) {
				
				if (/* newLine % 7 == 0 */(i + ((day * 1) - 1)) % 7 == 0) {
					$('.day_of_the_week').append(str + '</tr>');

					if (/* newLine */i >= endDay) {
						break;
					} else {
						console.log("@@@"+i+":"+day);
						console.log((day * 1)+"@@@");
						console.log(i+(day)+"@@@");
						console.log((i + (day * 1)) - 1);
						console.log(i + ((day * 1) - 1));
						console.log(i + (day * 1) - 1);
						/* $('.day_of_the_week').append(str + '</tr>'); */
						str = '<tr>';
					}
				}
				if (i <= endDay) {
					console.log("dkr");
					str += '<td class="h_date">' + i + '</td>';
				} else {
					str += '<td class="h_date">&nbsp;</td>';
				}
				/* newLine++; */
			}

		});
	</script>
</body>
</html>