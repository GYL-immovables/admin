function add_master_btn() {
	if (frm.aid.value == "") {
		alert("관리자 아이디를 입력하세요");
		frm.aid.focus();
	} else if (frm.apw.value == "") {
		alert("관리자 패스워드를 입력하세요");
		frm.apw.focus();
	} else if (frm.apw.value != frm.apw2.value) {
		alert("동일한 관리자 패스워드를 입력하세요");
		frm.apw2.focus();
	} else if (frm.apw2.value == "") {
		alert("동일한 관리자 패스워드를 입력하세요");
		frm.apw2.focus();
	} else if (frm.aname.value == "") {
		alert("담당자 이름을 입력하세요");
		frm.aname.focus();
	} else if (frm.aemail.value == "") {
		alert("담당자 이메일을 입력하세요");
		frm.aemail.focus();
	} else if (frm.atel1.value == "" || frm.atel2.value == "" || frm.atel3.value == "") {
		alert("연락처를 입력하세요");
		frm.aid.focus();
	} else if (frm.atel1.value.length < 2 || frm.atel2.value.length < 3 || frm.atel3.value.length < 4) {
		alert("연락처를 다시 입력하세요");
		frm.aid.focus();
	} else if (frm.dept.value == "") {
		alert("담당자 부서를 선택하세요");
		frm.dept.focus();
	} else if (frm.rspofc.value == "") {
		alert("담당자 직책을 선택하세요");
		frm.rspofc.focus();
	} else {
		if (document.getElementById("idck").value == "") {
			alert("아이디 중복체크를 하셔야만 회원가입이 진행됩니다.");
		} else {
			//console.log(frm.atel.value);
			//console.log("ok");
			frm.atel.value = frm.atel1.value + frm.atel2.value + frm.atel3.value;
			frm.submit();
		}
	}
}

//취소 => 로그인화면으로
function cancel_master_btn() {
	location.href="./index.jsp";
}


//아이디 중복체크 버튼
function id_btn() {
	if (frm.aid.value == "") {
		alert("아이디를 입력해주세요.");
	} else {
		//Ajax 역할 (Back-end와 통신)
		ajaxpost(frm.aid.value);
	}
}

//Ajax 함수를 이용하여 중복 체크 
var ok = "";	//Back에게 통신을 보내는 역할을 하는 변수 
function ajaxpost(data) {
	//console.log(data);
	function wck() {
		if (window.XMLHttpRequest) {
			return new XMLHttpRequest();
		}
	}

	function getdata() {
		if (ok.readyState == XMLHttpRequest.DONE && ok.status == 200) {
			console.log(this.response);	//Back-end 결과값을 받음 	
			if (this.response == "ok") {
				alert("사용가능한 아이디 입니다.");
				frm.aid.readOnly = true; // 아이디를 더 이상 수정하지 못하도록 읽기전용 변경
				document.getElementById("idck").value = "ok";
			} else if (this.response == "no") {
				alert("해당 아이디는 이미 사용 중입니다.");
				frm.aid.value = "";
			}
		}
	}

	//순서에 맞게 통신을 실행하는 역할 
	ok = wck();	//신규 XHR 생성 
	ok.onreadystatechange = getdata;	//해당 함수 결과를 받는 설정
	ok.open("GET", "./idcheck.do?aid=" + data, true);	//Back-end로 값을 이관
	//POST로 보낼땐 이렇게 안보냄  
	ok.send();	//Ajax 통신 실행 
}