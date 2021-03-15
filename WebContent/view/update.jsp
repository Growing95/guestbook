<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	a { text-decoration: none;}
	table{width: 500px; border-collapse:collapse; }
	table,tr,td{border: 1px solid black; padding: 3px}
</style>
<script type="text/javascript">
	function update_ok(f) {
		// 비밀번호 체크하기 
		if(f.pwd.value!="${vo.pwd}"){
			alert("비밀번호가 틀립니다.\n다시입력해주세요");
			f.pwd.value="";
			f.pwd.focus();
			return ;
		}
		f.action="/0202_MVC07_guestbook2/MyController?cmd=update_ok&idx=${idx}";
		f.submit();
	}
	
</script>
</head>
<body>
<div align="center">
		<h2>방명록 : 수정화면</h2>
		<hr />
		<p>[<a href="/0202_MVC07_guestbook2/MyController?cmd=list">목록으로 이동</a>]</p>
		<form method="post" enctype="multipart/form-data">
			<table>
				<tr align="center">
					<td bgcolor="#99ccff">번호</td>
					<td><input type="text" name="idx" value="${vo.idx }" disabled></td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">작성자</td>
					<td><input type="text" name="name" value="${vo.name }" disabled></td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">제  목</td>
					<td><input type="text" name="subject" value="${vo.subject }"></td>
				</tr>
				<tr align="left">
					<td colspan="2" style="padding: 0px 50px;">
					  <textarea  rows="10" cols="60" name="content">${vo.content}</textarea>
					</td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">email</td>
					<td><input type="text" name="email" value="${vo.email }"></td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">비밀번호</td>
					<td><input type="password" name="pwd"></td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">첨부파일</td>
					<td> 
					    <%--  <input type="file" name="file_name" disabled> ${vo.file_name}<br> --%>
					     <input type="file" name="file_name"> ${vo.file_name}<br>
					     <input type="radio" name="f_name" value="" > 파일없음
 						 <input type="radio" name="f_name" value="${vo.file_name}" checked>이전파일	
					     <%--  <input type="radio" name="f_name" value="${vo.file_name}"  >다른파일 --%>
					</td>
				</tr>
				<tfoot>
					<tr align="center">
						<td colspan="2">
						    <input type="hidden" name="idx" value="${vo.idx }">
							<input type="button" value="저장" onclick="update_ok(this.form)" />
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>