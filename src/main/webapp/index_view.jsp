<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script src="./index_view.js?v=2"></script>
<section class="admin_bgcolor">
	<div class="admin_login">
		<span>
			<form id="frm" method="post" action="./index_ok.do">
				<div class="left_div">
					<ul>
						<li><input type="text" name="aid" class="input_text1"
							placeholder="관리자 아이디를 입력하세요"></li>
						<li><input type="password" name="apw" class="input_text1"
							placeholder="관리자 패스워드를 입력하세요"></li>
					</ul>
				</div>
				<div class="right_div">
					<button type="submit" class="btn_submit" title="MASTER LOGIN" onclick="mlogin()">MASTER
						LOGIN</button>
				</div>
				<em class="alert_msg">※ 본 사이트는 관리자 외에는 접근을 금합니다. 페이지 접근에 대한 접속
					정보는 모두 기록 됩니다.</em>
		</span> <span>
			<ol class="admin_info">
				<li title="신규 관리자 등록요청"><a href="./add_master.jsp">신규 관리자 등록요청</a></li>
			
				<li title="아이디/패스워드 찾기"><a href="./find_id.html">아이디/패스워드 찾기</a></li>
			
			</ol>
			</form>
		</span>
	</div>
</section>