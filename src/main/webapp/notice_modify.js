function file_send() {
    const frm = document.getElementById("frm");

    // 제목 검증
    if (frm.nsubject.value.trim() === "") {
        alert("공지사항 제목을 입력해주세요.");
        frm.nsubject.focus();
        return false;
    }

    // 내용 검증
    if (frm.ntext.value.trim() === "") {
        alert("공지사항 내용을 입력해주세요.");
        frm.ntext.focus();
        return false;
    }

    // 체크박스 값 설정
    frm.ncheck.value = frm.ncheck.checked ? "Y" : "N";

    frm.submit();
}

// 공지 목록으로 이동
function goNoticeList() {
    if (confirm("공지 수정을 취소하시겠습니까?")) {
        location.href = "./notice_list.do";
    }
}
