function file_send() {
    var ncheck = document.getElementById("ncheck");
    var nsubject = document.getElementById("nsubject");
    var writer = document.getElementById("writer");
    var nfile = document.getElementById("nfile");
    var ntext = document.getElementById("ntext");

    if (nsubject.value == "") {
        alert('제목을 입력하세요.');
        return;
    } else if (ntext.value == "") {
        alert('내용을 입력하세요.');
        return;
    }

    // 체크박스 값 변환
    var ncheckValue = ncheck.checked ? 'Y' : 'N';

    // AJAX 요청 실행
    ajax_post(ncheckValue, nsubject.value, writer.value, nfile, ntext.value);
}

// AJAX I/O로 데이터 및 파일 전송하는 함수
function ajax_post(ncheck, nsubject, writer, nfile, ntext) {
    var http;
	http = new XMLHttpRequest();
    var formdata = new FormData(); // FormData 객체 생성

    // 필수 데이터 추가
    formdata.append("ncheck", ncheck); 
    formdata.append("nsubject", nsubject);
    formdata.append("writer", writer);
    formdata.append("ntext", ntext);

    // 파일이 있을 경우에만 추가
    if (nfile.files.length > 0) {
        formdata.append("nfile", nfile.files[0]);
    }

    http.onreadystatechange = function () {
        if (http.readyState == 4 && http.status == 200) {
            console.log(this.responseText); // 서버 응답 확인
        }
    };

    // POST 요청 설정 및 데이터 전송
    http.open("POST", "./notice_writeok.do", true);
    http.send(formdata);
}
