<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="./add_master_view.js?v=2"></script>
<div class="admin_login_add">
	<form id="frm" method="post" action="./add_master_ok.do">
<!-- 전화번호 / 아이디중복체크여부("", "ok") -->
		<input type="hidden" name="atel">	
		<input type="hidden" id="idck" value="">

		<ul>
			<li class="font_color1">아이디 및 패스워드 정보</li>
			<li><input type="text" name="aid" class="add_input1"
				placeholder="생성할 관리자 아이디를 입력하세요">
				<button type="button" class="btn_button" onclick="id_btn()">중복체크</button>
			</li>
			<li><input type="password" name="apw" class="add_input1"
				placeholder="접속할 패스워드를 입력하세요"> <input type="password"
				name="apw2" class="add_input1" placeholder="동일한 패스워드를 입력하세요">
			</li>
			<li class="font_color1">관리자 기본정보 입력</li>
			<li><input type="text" name="aname" class="add_input1"
				placeholder="담당자 이름을 입력하세요"></li>
			<li><input type="text" name="aemail" class="add_input1 emails"
				placeholder="담당자 이메일을 입력하세요"></li>
			<li class="font_color1"><input type="text" name="atel1"
				class="add_input1 hp1" placeholder="HP" value="010" maxlength="3">
				- <input type="text" name="atel2" class="add_input1 hp2"
				placeholder="1234" maxlength="4"> - <input type="text"
				name="atel3" class="add_input1 hp2" placeholder="5678" maxlength="4">
			</li>
			<li class="font_color1">관리자 담당부서 및 직책</li>
			<li><select name="dept" class="add_select1">
					<option value="">담당자 부서를 선택하세요</option>
					<option value="임원">임원</option>
					<option value="전산팀">전산팀</option>
					<option value="디자인팀">디자인팀</option>
					<option value="CS팀">CS팀</option>
					<option value="MD팀">MD팀</option>
			</select> <select name="rspofc" class="add_select1">
					<option value="">담당자 직책을 선택하세요</option>
					<option value="대표">대표</option> 
					<option value="부장">부장</option>
					<option value="팀장">팀장</option>
					<option value="과장">과장</option>
					<option value="대리">대리</option>
					<option value="사원">사원</option>
			</select></li>
			<li class="font_color1">※ 가입완료 후 전산 담당자가 확인 후 로그인 할 수 있습니다.</li>
		</ul>
		<span class="admin_addbtn">
			<button type="button" class="btn_button btncolor1" title="관리자 등록"
				onclick="add_master_btn()">관리자 등록</button>
			<button type="button" class="btn_button btncolor2" title="관리자 취소"
				onclick="cancel_master_btn()">등록 취소</button>
		</span>
	</form>
</div>
