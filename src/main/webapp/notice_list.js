function movePage(pageNo) {
    location.href = "notice_list.do?pageno=" + pageNo;
}

function notice_view(no){
	//해당 게시물의 내용 및 첨부파일을 확인 할 수 있는 view 페이지
	location.href='./notice_view.do?nidx='+no;
}