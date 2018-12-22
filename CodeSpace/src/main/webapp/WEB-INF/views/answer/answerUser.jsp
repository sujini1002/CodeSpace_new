<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<table style="float:right; margin-right:20px" class="k_table">
	<tr>
		<td rowspan="3">
		<a onclick="moveUserpage(this)" class="k_cursor" id="k_userPage_${userInfoList[num.index].user_no}">
			<%-- <img class="k_userImg" src="${pageContext.request.contextPath}/uploadfile/userphoto/${userInfoList[num.index].user_photo}" /> --%>
			<img class="k_userImg" src="http://ec2-13-125-255-64.ap-northeast-2.compute.amazonaws.com:8080/cospicture/uploadfile/userphoto/<c:choose><c:when test="${userInfoList[num.index].user_photo==null}">noimage.png</c:when><c:otherwise>${userInfoList[num.index].user_photo}</c:otherwise></c:choose>" />
		</a>
		<input type="hidden" value="${userInfoList[num.index].user_no}" class="k_answerUsers"/>
		</td>
	</tr>
	<tr>
		<td><span  onclick="moveUserpage(this)"  class="k_userpage k_cursor" id="k_userPage_${userInfoList[num.index].user_no}">
				${userInfoList[num.index].user_nickname} </span></td>
	</tr>
</table>