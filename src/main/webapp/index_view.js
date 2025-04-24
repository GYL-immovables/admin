//로그인 
function mlogin() {
	if (frm.aid.value == "") {
		alert("관리자 아이디를 입력하세요");
		frm.aid.focus();
	} else if (frm.apw.value == "") {
		alert("관리자 패스워드를 입력하세요");
		frm.apw.focus();
	} else {
		frm.submit();
	}
}