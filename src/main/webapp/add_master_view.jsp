<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="admin_login_add">
    <ul>
        <li class="font_color1">아이디 및 패스워드 정보</li>
        <li>
        <input type="text" class="add_input1" placeholder="생성할 관리자 아이디를 입력하세요">
        <button type="button"  class="btn_button">중복체크</button>
        </li>
        <li>
            <input type="text" class="add_input1" placeholder="접속할 패스워드를 입력하세요">
            <input type="text" class="add_input1" placeholder="동일한 패스워드를 입력하세요">
        </li>
        <li class="font_color1">관리자 기본정보 입력</li>
        <li>
            <input type="text" class="add_input1" placeholder="담당자 이름을 입력하세요">
        </li>
        <li>
        <input type="text" class="add_input1 emails" placeholder="담당자 이메일을 입력하세요">
        </li>
        <li class="font_color1">
        <input type="text" class="add_input1 hp1" placeholder="HP" value="010" maxlength="3">
        -
        <input type="text" class="add_input1 hp2" placeholder="1234" maxlength="4">
        -
        <input type="text" class="add_input1 hp2" placeholder="5678" maxlength="4">
        </li>
        <li class="font_color1">관리자 담당부서 및 직책</li>
        <li>
            <select class="add_select1">
                <option>담당자 부서를 선택하세요</option>
                <option>임원</option>
                <option>전산팀</option>
                <option>디자인팀</option>
                <option>CS팀</option>
                <option>MD팀</option>
            </select>
            <select class="add_select1">
                <option>담당자 직책을 선택하세요</option>
                <option>대표</option>
                <option>부장</option>
                <option>팀장</option>
                <option>과장</option>
                <option>대리</option>
                <option>사원</option>
            </select>
        </li>
        <li class="font_color1">※ 가입완료 후 전산 담당자가 확인 후 로그인 할 수 있습니다.</li>
    </ul>
    <span class="admin_addbtn">
        <button type="button" class="btn_button btncolor1" title="관리자 등록">관리자 등록</button>
        <button type="button" class="btn_button btncolor2" title="관리자 취소">등록 취소</button>
    </span>
</div>
