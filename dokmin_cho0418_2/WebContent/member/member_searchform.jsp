<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<form action="<%=request.getContextPath()%>/library.dokmin.search.member" method="post">
	<select name="sk">
	    <option value="member_id">���̵�</option>
	    <option value="member_name">�̸�</option>
	    <option value="member_birth">�������</option>
	    <option value="member_phone">����ó</option>
	    <option value="member_addr">�ּ�</option>
	    <option value="member_level">����</option>
	</select>
	<input type="text" name="sv">
	<input type="submit" value="�˻���ư">
</form>



