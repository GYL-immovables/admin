function file_send() {
    var frm = document.getElementById("frm"); // form 요소 가져오기

    // 필수 입력값 검증
    if (frm.nsubject.value.trim() === "") {
        alert('제목을 입력하세요.');
        frm.nsubject.focus();
        return;
    } else if (frm.ntext.value.trim() === "") {
        alert('내용을 입력하세요.');
        frm.ntext.focus();
        return;
    }

    // 체크박스 값 설정
    frm.ncheck.value = frm.ncheck.checked ? 'Y' : 'N';
	console.log(frm.ncheck.value);

    // 폼 제출
    frm.submit();
}
