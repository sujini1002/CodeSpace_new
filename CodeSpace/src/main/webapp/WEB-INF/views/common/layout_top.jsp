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

<!-- Bootstrap core CSS -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.12/jquery-ui.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/tag-it.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/tag-it-min.js" type="text/javascript" charset="utf-8"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<title>CodeSpace</title>
<!-- 우리가 적용시킨 css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css"> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/custom.css"> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/kang.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/moon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/yu.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/lee.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/ha.css">
<!-- tag it css -->
<link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/flick/jquery-ui.css">
<link href="${pageContext.request.contextPath}/css/jquery.tagit.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/tagit.ui-zendesk.css" rel="stylesheet" type="text/css">
<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Nanum+Myeongjo" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">


<!-- Quill 에디터 관련 -->
<!-- Main Quill library -->
<script src="//cdn.quilljs.com/1.3.6/quill.js"></script>
<script src="//cdn.quilljs.com/1.3.6/quill.min.js"></script>

<!-- Theme included stylesheets -->
<link href="//cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<link href="//cdn.quilljs.com/1.3.6/quill.bubble.css" rel="stylesheet"> 
<!-- 끝 -->

<!--  -->
</head>
<body style="overflow-x:hidden; overflow-y:auto;">

	<div id="k_hearder" >
		<!-- nav_bar 들어갈곳 -->
		<jsp:include page="layout_topNav_tmp.jsp" />
	</div>