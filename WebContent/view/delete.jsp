<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	function delete_ok(f) {
		if(f.pwd.value == "${vo.pwd}"){
			var chk = confirm("정말삭제할까요?");
			if(chk){
				f.action="/0202_MVC07_guestbook2/MyController?cmd=delete_ok";
				f.submit();
			}else{
				history.go(-1);
			}
		}else{
			alert("비밀번호가 틀립니다.\n다시 입력해주세요");
			f.pwd.value="";
			f.pwd.focus();
			return;
		}
	}
</script>
</head>
<body>
<div align="center">
		<h2>방명록 : 삭제화면</h2>
		<hr />
		<p>[<a href="/0202_MVC07_guestbook2/MyController?cmd=list">목록으로 이동</a>]</p>
		<form method="post">
			<table>
				<tr align="center">
					<td bgcolor="#99ccff">비밀번호</td>
					<td><input type="password" name="pwd" ></td>
				</tr>
				<tfoot>
					<tr align="center">
						<td colspan="2">
						    <input type="hidden" name="idx" value="${vo.idx }">
							<input type="button" value="삭제" onclick="delete_ok(this.form)" />
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>