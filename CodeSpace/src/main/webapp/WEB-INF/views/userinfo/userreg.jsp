<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/layout_top.jsp" />
<jsp:include page="../common/layout_content.jsp" />

<form method="post" enctype="multipart/form-data">
	<%-- <table class="table h_table">
		<thead>
			<tr>
				<th>아이디</th>
				<c:if test="${empty googlecheck}">
					<td><input class="h_id" type="text" name="user_id"/><div class="h_check"></div></td>
					
				</c:if>
				<c:if test="${!empty googlecheck}">
					<td><input type="text" name="user_id" value="${googlecheck}" readonly="readonly" /></td>
				</c:if>
			</tr>
		</thead>
		<thead>
			<tr>
				<th>이름</th>
				<td><input type="text" name="user_name" /></td>
			</tr>
		</thead>
		<thead>
			<tr>
				<th>별명</th>
				<td><input type="text" name="user_nickname" /></td>
			</tr>
		</thead>
		
		<thead>
			<tr>
				<th>개인 홈페이지</th>
				<td><input type="text" name="user_url" /></td>
			</tr>
		</thead>
		<thead>
			<tr>
				<th>자기 소개</th>
				<td><input type="text" name="user_intro" /></td>				
			</tr>
		</thead>
		<thead>
			<tr>
				<th>Tag</th>
				<td><input type="text" name="user_tag" /></td>
			</tr>
		</thead>
		<thead>
			<tr>
				<th>사진</th>
				<td><input type="file" name="photo" /></td>
			</tr>
		</thead>
			<tr>		
				<td><input type="submit" value="회원가입" /></td>
			</tr> 
	</table> --%>
	 <div class="form-group h_group">
            <label for="exampleInputEmail1">이메일 주소</label>
            <c:if test="${empty googlecheck}">
                <input type="email" class="form-control h_id" id="exampleInputEmail1" placeholder="이메일을 입력하세요" name="user_id" />
                <div class="h_check"></div>
            </c:if>
            <c:if test="${!empty googlecheck}">
                <input type="text" name="user_id" value="${googlecheck}" readonly="readonly" />
            </c:if>
        </div>
        <div class="form-group h_group">
            <label for="exampleInputPassword1">이름</label>
            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="이름을 입력 하세요">
        </div>
        <div class="form-group h_group">
            <label for="exampleInputPassword1">별명</label>
            <input type="text" class="form-control" id="exampleInputPassword1" placeholder="별명을 입력 하세요">
        </div>
        <div class="form-group h_group">
            <label for="exampleInputPassword1">개인 홈페이지</label>
            <input type="text" class="form-control" id="exampleInputPassword1" placeholder="URL을 입력 하세요">
        </div>
        <div class="form-group h_group">
            <label for="exampleInputPassword1">Tag</label>
            <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Tag를 입력하세요">
        </div>
        <div class="form-group h_group">
            <label for="exampleInputPassword1">자기 소개</label>
            <textarea class="form-control" rows="3"></textarea>
        </div>
        <div class="form-group h_group">
            <label for="exampleInputFile">파일 업로드</label>
            <input type="file" id="exampleInputFile">
            <!-- <p class="help-block">여기에 블록레벨 도움말 예제</p> -->
        </div>
</form>
<script>
/* $(function(){}) 와 같다*/
/* 정규식으로 아이디 적합테스트 */
$(document).ready(function(){
	var pattern = '^[a-zA-Z0-9][a-zA-Z0-9\.\_\-]{4,16}@[a-zA-Z0-9]+\.[a-zA-Z]{2,8}$';
	$('.h_id').focusout(function(){
		var data = $('.h_id');
		var matchid = data.val().match(pattern); 
		if(!matchid){
			$('.h_check').text('잘못된 이메일 형식입니다');
				if($('.h_id').text('')){				
					$('.h_check').text('필수 정보 입니다!!');
				}
		}else if(matchid){
			$('.h_check').text('멋진 Email이네요!');
		}
		
	});
});
</script>
<jsp:include page="../common/layout_footer.jsp" />
