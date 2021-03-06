<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle"
	value="<span><i class='fas fa-user-plus'></i></span> <span>MEMBER MODIFY</span>" />

<%@ include file="../common/head.jspf"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<script>
let MemberModify__submitFormDone = false;
function MemberModify__submitForm(form) {
    if ( MemberModify__submitFormDone ) {
        return;
    }

    form.loginPwInput.value = form.loginPwInput.value.trim();

    if ( form.loginPwInput.value.length > 0 ) {
        form.loginPwConfirm.value = form.loginPwConfirm.value.trim();

        if ( form.loginPwConfirm.value.length == 0 ) {
            alert('로그인비밀번호 확인을 입력해주세요.');
            form.loginPwConfirm.focus();

            return;
        }

        if ( form.loginPwInput.value != form.loginPwConfirm.value ) {
            alert('로그인비밀번호가 일치하지 않습니다.');
            form.loginPwConfirm.focus();

            return;
        }
    }

    form.name.value = form.name.value.trim();

    if ( form.name.value.length == 0 ) {
        alert('이름을 입력해주세요.');
        form.name.focus();

        return;
    }

    form.nickname.value = form.nickname.value.trim();

    if ( form.nickname.value.length == 0 ) {
        alert('별명을 입력해주세요.');
        form.nickname.focus();

        return;
    }

    form.cellphoneNo.value = form.cellphoneNo.value.trim();

    if ( form.cellphoneNo.value.length == 0 ) {
        alert('휴대전화번호를 입력해주세요.');
        form.cellphoneNo.focus();

        return;
    }


    form.email.value = form.email.value.trim();

    if ( form.email.value.length == 0 ) {
        alert('이메일을 입력해주세요.');
        form.email.focus();

        return;
    }

    if ( form.loginPwInput.value.length > 0 ) {
        form.loginPw.value = sha256(form.loginPwInput.value);
        form.loginPwInput.value = '';
        form.loginPwConfirm.value = '';
    }

    form.submit();
    MemberModify__submitFormDone = true;
}
</script>

<div class="section-member section-member-modify flex px-2">
	<div class="container">
	    <form class="px-4 py-8" method="POST" action="doModify" onsubmit="MemberModify__submitForm(this); return false;">
	        <input type="hidden" name="loginPw">
	        
   			<div class="flex flex-center border-2 font-size-20">
                <span class="py-8">
                	개인정보수정
                </span>
            </div>
	        
	        <div class="flex flex-left border-1">
                <label class="label mr-8">
                    아이디
                </label>
                <div class="plain-text">
                  ${rq.loginedMember.loginId}
                </div>
            </div>

            <div class="flex flex-left border-1">
                <label class="mr-8">
                    비밀번호
                </label>
                <input type="password" maxlength="30" name="loginPwInput" placeholder="비밀번호를 입력해주세요." />
            </div>

            <div class="flex flex-left border-1">
                <label class="mr-8">
                    비밀번호 확인
                </label>
                <input type="password" maxlength="30" name="loginPwConfirm" placeholder="비밀번호를 다시 입력해주세요." />
            </div>

            <div class="flex flex-left border-1">
                <label class="mr-8">
                    이름
                </label>
                <input value="${rq.loginedMember.name}" type="text" maxlength="30" name="name" placeholder="이름을 입력해주세요." />
            </div>

            <div class="flex flex-left border-1">
                <label class="mr-8">
                    별명
                </label>
                <input value="${rq.loginedMember.nickname}" type="text" maxlength="30" name="nickname" placeholder="별명을 입력해주세요." />
            </div>

            <div class="flex flex-left border-1">
                <label class="mr-8">
                    휴대전화번호
                </label>
                <input value="${rq.loginedMember.cellphoneNo}" type="tel" maxlength="30" name="cellphoneNo" placeholder="휴대전화번호를 입력해주세요." />
            </div>

            <div class="flex flex-left border-1">
                <label class="mr-8">
                    이메일
                </label>
                <input value="${rq.loginedMember.email}" type="email" maxlength="50" name="email" placeholder="이메일을 입력해주세요." />
            </div>

            <div class="mt-4 flex form-control mt-8 border-1 gap-1">
                <button type="submit" href="#" class="flex flex-grow flex-center border-main mr-4">
                    <span><i class="fas fa-user-plus"></i></span>
                    &nbsp;
                    <span>수정</span>
                </button>

                <a href="../member/mypage" class="flex flex-grow flex-center border-2 ml-4 mr-4">
                    <span><i class="fas fa-home"></i></span>
                    &nbsp;
                    <span>마이페이지</span>
                </a>

                <a href="/" class="flex flex-grow flex-center border-2 ml-4">
                    <span><i class="fas fa-home"></i></span>
                    &nbsp;
                    <span>홈</span>
                </a>
            </div>
	    </form>
	</div>
</div>

<%@ include file="../common/foot.jspf"%>