<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="./admin_settingok.js?v=1"></script>

<section>
<form id ="frm" method="get" action="./admin_siteinfo.do">
	    <p>홈페이지 가입환경 설정</p>
	<div class="subpage_view">
	<ul class="info_form">
	    <li>홈페이지 제목</li>
	    <li>
	        <input type="text" name="atitle" value="" class="in_form1"> 
	    </li>
	</ul>    
	<ul class="info_form">
	    <li>관리자 메일 주소</li>
	    <li>
	        <input type="text" name="aemail" class="in_form2"> ※ 관리자가 보내고 받는 용도로 사용하는 메일 주소를 입력합니다.(회원가입,인증메일,회원메일발송 등에서 사용)
	    </li>
	</ul> 
	<ul class="info_form">
	    <li>포인트 사용 유/무</li>
	    <li class="checkcss">
	        <em><label><input type="radio" name="apoint_use" value="YES" class="ckclass">포인트 사용</label></em> 
	        <em><label><input type="radio" name="apoint_use" value="NO" class="ckclass" checked>포인트 미사용</label></em>
	    </li>
	</ul>
	<ul class="info_form2" style="border-bottom:1px solid rgb(81, 61, 61);">
	    <li>회원가입시 적립금</li>
	    <li>
	        <input type="text" name="sign_point" class="in_form3" maxlength="5"> 점
	    </li>
	    <li>회원가입시 권한레벨</li>
	    <li>
	        <input type="text" name="sign_lv" class="in_form3" maxlength="1"> 레벨
	    </li>
	</ul> 
	</div>

	<p>홈페이지 기본환경 설정</p>
	<div class="subpage_view">
	<ul class="info_form2">
	    <li>회사명</li>
	    <li>
	        <input type="text" name="comp_nm" class="in_form0"> 
	    </li>
	    <li>사업자등록번호</li>
	    <li>
	        <input type="text" name="business_no" maxlength="10" class="in_form0"> 
	    </li>
	</ul> 
	<ul class="info_form2">
	    <li>대표자명</li>
	    <li>
	        <input type="text" name="ceo_nm" class="in_form0"> 
	    </li>
	    <li>대표전화번호</li>
	    <li>
	        <input type="text" name="tel" maxlength="11" class="in_form0"> 
	    </li>
	</ul>
	<ul class="info_form2">
	    <li>통신판매업 신고번호</li>
	    <li>
	        <input type="text" name="com_no" maxlength="40" class="in_form0"> 
	    </li>
	    <li>부가통신 사업자번호</li>
	    <li>
	        <input type="text" name="add_no" maxlength="15" class="in_form0"> 
	    </li>
	</ul>
	<ul class="info_form2">
	    <li>사업장 우편번호</li>
	    <li>
	        <input type="text" name="addr_no" maxlength="5" class="in_form0"> 
	    </li>
	    <li>사업장 주소</li>
	    <li>
	        <input type="text" name="com_addr" class="in_form2"> 
	    </li>
	</ul>
	<ul class="info_form2" style="border-bottom:1px solid rgb(81, 61, 61);">
	    <li>정보관리책임자명</li>
	    <li>
	        <input type="text" name="info_nm" class="in_form0"> 
	    </li>
	    <li>정보책임자 E-mail</li>
	    <li>
	        <input type="text" name="info_email" class="in_form1"> 
	    </li>
	</ul>
	</div>

	<p>결제 기본환경 설정</p>
	<div class="subpage_view">  
	<ul class="info_form2">
	    <li>무통장 은행</li>
	    <li>
	        <input type="text" name="bank_nm" class="in_form0"> 
	    </li>
	    <li>은행계좌번호</li>
	    <li>
	        <input type="text" name="bank_no" class="in_form1"> 
	    </li>
	</ul>
	<ul class="info_form">
	    <li>신용카드 결제 사용</li>
	    <li class="checkcss">
	        <em><label><input type="radio" name="card_use" class="ckclass" value="YES"> 사용</label></em> 
	        <em><label><input type="radio" name="card_use" class="ckclass" value="NO" checked> 미사용</label></em> ※ 해당 PG사가 있을 경우 사용으로 변경합니다.
	    </li>
	</ul>
	<ul class="info_form">
	    <li>휴대폰 결제 사용</li>
	    <li class="checkcss">
	        <em><label><input type="radio" name="mobile_use" value="YES" class="ckclass"> 사용</label></em> 
	        <em><label><input type="radio" name="mobile_use" value="NO" class="ckclass" checked> 미사용</label></em> ※ 주문시 휴대폰 결제를 가능하게 할 것인지를 설정합니다.
	    </li>
	</ul>
	<ul class="info_form">
	    <li>도서상품권 결제사용</li>
	    <li class="checkcss">
	        <em><label><input type="radio" name="book_coupon" value="YES" class="ckclass"> 사용</label></em> 
	        <em><label><input type="radio" name="book_coupon" value="NO" class="ckclass" checked> 미사용</label></em> ※ 도서상품권 결제만 적용이 되며, 그 외에 상품권은 결제 되지 않습니다.
	    </li>
	</ul>
	<ul class="info_form2">
	    <li>결제 최소 포인트</li>
	    <li>
	        <input type="text" name="min_point"  class="in_form0" maxlength="5" value="1000"> 점
	    </li>
	    <li>결제 최대 포인트</li>
	    <li>
	        <input type="text" name="max_point" class="in_form0" maxlength="5"> 점
	    </li>
	</ul>
	<ul class="info_form">
	    <li>현금 영수증 발급사용</li>
	    <li class="checkcss">
	        <em><label><input type="radio" name="cash_receipt" value="YES" class="ckclass"> 사용</label></em> 
	        <em><label><input type="radio" name="cash_receipt" value="NO" class="ckclass" checked> 미사용</label></em> ※ 현금영수증 관련 사항은 PG사 가입이 되었을 경우 사용가능 합니다.
	    </li>
	</ul>
	<ul class="info_form2">
	    <li>배송업체명</li>
	    <li>
	        <input type="text" name="del_com" class="in_form0"> 
	    </li>
	    <li>배송비 가격</li>
	    <li>
	        <input type="text" name="del_price" class="in_form0" maxlength="7"> 원
	    </li>
	</ul>
	<ul class="info_form" style="border-bottom:1px solid rgb(81, 61, 61);">
	    <li>희망배송일</li>
	    <li class="checkcss">
	        <em><label><input type="radio" name="del_date" value="YES" class="ckclass" > 사용</label></em> 
	        <em><label><input type="radio" name="del_date" value="NO" class="ckclass" checked> 미사용</label></em> ※ 희망배송일 사용시 사용자가 직접 설정 할 수 있습니다.
	    </li>
	</ul>
	</div>
	<div class="btn_div">
	    <button type="button" class="sub_btn1" title="설정 저장" onclick="setok()">설정 저장</button>
	    <button type="button" class="sub_btn2" title="저장 취소" onclick="setno()">저장 취소</button>
	</div>
</form>
	</section>
	<section></section>
	<section></section>