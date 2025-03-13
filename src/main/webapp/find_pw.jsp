<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>

<form id="frm" method="post" action="./findok_pw.do">
<p>비밀번호 찾기</p>

<input type="text" name="aid" placeholder="아이디를 입력하세요"><br>
<input type="text" name="aname" placeholder="담당자 이름을 입력하세요"><br>
		<input type="text" name="atel" maxlength="11"
			placeholder="연락처를 - 없이 입력하세요"><br> <input type="text"
			name="aemail" placeholder="담당자 이메일을 입력하세요"><br>
			
<input type="button" value="비밀번호 찾기" onclick="find_pw()">
</form>

</body>
<script>
function find_pw() {
	if (frm.aid.value == "") {
		alert("아이디를 입력하세요");
		frm.aid.focus();
	} else if (frm.aname.value == "") {
		alert("담당자 이름을 입력하세요");
		frm.aname.focus();
	} else if (frm.atel.value == "") {
		alert("연락처를 입력하세요");
		frm.atel.focus();
	} else if (frm.aemail.value == "") {
		alert("담당자 이메일을 입력하세요");
		frm.aemail.focus();
	} else {
		frm.submit();
	}
}
</script>
</html>