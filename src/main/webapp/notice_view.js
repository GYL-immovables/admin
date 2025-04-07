function notice_info(p){
	switch(p){
	case 1:
		location.href='./notice_list.do';
	break;
	case 2:
		location.href = './notice_modify.do?nidx=' + nidx;
	break;
	case 3:
		if (confirm("정말 이 공지사항을 삭제하시겠습니까?")) {
                document.getElementById("deleteForm").submit();  // ✅ 폼 전송만!
            }
			break;
	}
}