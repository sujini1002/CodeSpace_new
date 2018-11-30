<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--경로가 달라서 주석풀고 사용해주세요 --%>
<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />


<!-- right Contents 시작 -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<div class="col-md-10 row justify-content-center"
	style="background-color: rgb(236, 240, 245); padding-top: 30px; padding-left: 50px;">
	<!--  여기다가 작성 해주세요 -->

	<script>
		/* $(function() {
			//클래스가 draggable인 요소에 드래그 기본 함수를 적용한다.
			$(".todoPost").draggable({
				cursor : "move",
				opacity : 0.5,
				stack : ".todoPost",
				snap : true
			});

			
		
			/* 	//  dragtest이벤트는 드래그가 시작하면 발생
				$("#draggable").bind("dragstart", function(event, ui) {
					$(this).addClass("invert");//   invert 클래스가 적용되어 배경 이미지가 변경됨
				});

				//  dragstop이벤트는 드래그가 멈추면 발생
				$("#draggable").bind("dragstop", function(event, ui) {
					$(this).removeClass("invert");//   invert클래스가 제거되어 원래 배경이미지로 돌아감
				}); 
		});  */
		
		$(function() {
			$("#animateBtn").on("click", function() {
				$(".todoPost1").animate(		// 클래스가 "todoPost1"인 요소를
					{
						left: "+=100",		// 오른쪽으로 100픽셀 이동하고,
						opacity: 0.2		// 투명도를 0.2로 변경함.
					}, 500
				);
			});
		});
		
		
		
	</script>

	<div class="col-3" style="background-color: gray">
		<h1>to do</h1>
		<div class="todoPost1"
			style="width: 200px; background-color: lightgoldenrodyellow; border: 1px solid black; box-shadow: 2px 2px 2px">
			<p>담당자 : 유자영</p>
			<p>할 일 : 작업지시</p>
			<p>시작일</p>
			<p>종료일</p>
			<button id="animateBtn">진행 시작</button>
		</div>

		<div class="todoPost"
			style="width: 200px; background-color: lightgoldenrodyellow; border: 1px solid black; box-shadow: 2px 2px 2px">
			<p>담당자 : 이민아</p>
			<p>할 일 : 보고서 작성</p>
			<p>시작일</p>
			<p>종료일</p>
		</div>

		<div class="todoPost"
			style="width: 200px; background-color: lightgoldenrodyellow; border: 1px solid black; box-shadow: 2px 2px 2px">
			<p>담당자 : 강수진</p>
			<p>할 일 : 이번주까지만 푹 쉬기</p>
			<p>시작일</p>
			<p>종료일</p>
		</div>


	</div>

	<div class="col-3 draggable ui-widget-content" id="doingTarget" style="background-color: gray; margin-left: 50px;">
		<h1>Doing</h1>

	</div>
	<div class="col-3" style="background-color: gray; margin-left: 50px;">
		<h1>Done</h1>

	</div>







	<jsp:include page="../common/layout_footer.jsp" />