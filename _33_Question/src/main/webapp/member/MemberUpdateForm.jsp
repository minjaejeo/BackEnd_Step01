<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="spms.vo.Member" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세 정보 조회 및 변경</title>
</head>
<body>
	<jsp:include page="/Header.jsp"/>
	<h1>회원 정보</h1>
	<jsp:useBean id="members"
				scope="request"
				class="java.util.ArrayList"
				type="java.util.List<spms.vo.Member>"/>
	<%
		for(Member member : members){
			
	%>
	
	<%		
		}
	%>
				
	<form action="update" method="post">
		번호: <input type='text' name='no' value=<%=members %>readonly>
		이름: <input type='text' name='name' value=<%=members %>>
		이메일: <input type='email' name='email' value=<%=members %>>
		가입일: <input >
		<input type='submit' value='저장'>
		<input type='button' value='삭제' onclick='location.href=\"list\"'>
		<input type='button' value='취소' onclick='location.href=\"list\"'>
	</form>
	<jsp:include page="/Tail.jsp"/>
</body>
</html>