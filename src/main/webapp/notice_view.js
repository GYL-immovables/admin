function notice_info(p) {
	switch (p) {
		case 1:
			location.href = './notice_list.do';
			break;
		case 2:
			document.getElementById("modifyForm").submit();
			break;
		case 3:
			if (confirm("정말 이 공지사항을 삭제하시겠습니까?")) {
				document.getElementById("deleteForm").submit();
			}
			break;
	}
}