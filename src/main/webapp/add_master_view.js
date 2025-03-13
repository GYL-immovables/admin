function add_master_btn() {
	if (frm.aid.value == "") {
		alert("관리자 아이디를 입력하세요");
		frm.aid.focus();
	} else if (frm.apw.value == "") {
		alert("관리자 패스워드를 입력하세요");
		frm.apw.focus();
	} else if (frm.apw.value!=frm.apw2.value) {
		alert("동일한 관리자 패스워드를 입력하세요");
		frm.apw2.focus();
	} else if (frm.apw2.value == "") {
		alert("동일한 관리자 패스워드를 입력하세요");
		frm.apw2.focus();
	}else if (frm.aname.value == "") {
		alert("담당자 이름을 입력하세요");
		frm.aname.focus();
	} else if (frm.aemail.value == "") {
		alert("담당자 이메일을 입력하세요");
		frm.aemail.focus();
	} else if (frm.atel1.value == "" || frm.atel2.value == "" || frm.atel3.value == "") {
		alert("연락처를 입력하세요");
		frm.aid.focus();
	}else if (frm.atel1.value.length < 2 || frm.atel2.value.length < 3 || frm.atel3.value.length < 4) {
		alert("연락처를 다시 입력하세요");
		frm.aid.focus();
	}else if (frm.dept.value == "") {
		alert("담당자 부서를 선택하세요");
		frm.dept.focus();
	}else if (frm.rspofc.value == "") {
		alert("담당자 직책을 선택하세요");
		frm.rspofc.focus();
	} else {
		frm.atel.value = frm.atel1.value + frm.atel2.value + frm.atel3.value;
		//console.log(frm.atel.value);
		//console.log("ok");
		frm.submit();
	}
}

// 아이디 중복 체크 
function id_btn() {
	
}

//취소 => 어디로가나
function cancel_master_btn() {
	
}