<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="google-signin-client_id" content="1062959771507-ui43lp0bcded58qcei1h2co2r8gqi55c.apps.googleusercontent.com">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>CodeSpace</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="${pageContext.request.contextPath}/resources/js/ie10-viewport-bug-workaround.js"></script>

<!-- 구글 로그인 api -->

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Nanum+Myeongjo" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<!-- 우리가 적용시킨 css -->
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/resources/css/custom.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/kang.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/moon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/yu.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/lee.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ha.css">


<!-- Quill 에디터 관련 -->
<!-- Main Quill library -->
<script src="//cdn.quilljs.com/1.3.6/quill.js"></script>
<script src="//cdn.quilljs.com/1.3.6/quill.min.js"></script> 

<!-- Theme included stylesheets -->
<link href="//cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<link href="//cdn.quilljs.com/1.3.6/quill.bubble.css" rel="stylesheet"> 
<!-- 끝 -->


<style>
#k_hearder {
	width: 100%;
	background-color: red;
}

#k_photo {
	background-image:
		url("${pageContext.request.contextPath}/resources/images/back_3333.jpg");
	background-size: cover;
	color: white;
	width: 100%;
	margin-top:51px;
	height:300px;
}

#k_content {
	margin:0px 100px;
	width: 1400px;
	/* height: 1600px; */
	float: left;
	position: relative;
}

#k_leftNavBar {
	width: 20%;
	height: 100%;
	position: absolute;
	padding-left: 50px;
	left: 0;
	top: 0;
}

#k_rightContent {
	width: 80%;
	height: 1600px;
	position: absolute;
	right: 0;
	top: 0;
	padding: 50px 50px;
}

</style>
<!--  -->
</head>
<body>

	<div id="k_hearder">
		<!-- nav_bar 들어갈곳 -->
		<jsp:include page="/resources/common/layout_topNav.jsp" />
	</div>