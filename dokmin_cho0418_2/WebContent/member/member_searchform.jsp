<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<form action="<%=request.getContextPath()%>/library.dokmin.search.member" method="post">
	<select name="sk">
	    <option value="member_id">아이디</option>
	    <option value="member_name">이름</option>
	    <option value="member_birth">생년월일</option>
	    <option value="member_phone">연락처</option>
	    <option value="member_addr">주소</option>
	    <option value="member_level">권한</option>
	</select>
	<input type="text" name="sv">
	<input type="submit" value="검색버튼">
</form>



