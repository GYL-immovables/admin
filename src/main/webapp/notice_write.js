function file_send() {
    var frm = document.getElementById("frm"); // form 요소 가져오기
	// 체크박스 체크 여부
	if(frm.ncheck.value == "false"){
		frm.ncheck.value = "N";
	}
	else{
		frm.ncheck.value = "Y";
	}
    // 필수 입력값 검증
    if (frm.nsubject.value.trim() === "") {
        alert('제목을 입력하세요.');
        frm.nsubject.focus();
        return;
    } else if (frm.ntext.value.trim() === "") {
        alert('내용을 입력하세요.');
        frm.ntext.focus();
        return;
    } else{
    	frm.submit();
	}
}
