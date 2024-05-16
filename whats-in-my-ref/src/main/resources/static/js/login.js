var recent_longinId="";

/*---------------------------------------------------------------
유효성 검사
----------------------------------------------------------------*/
function loginChk() {
    var form = document.login-form;
    //아이디 입력 없음.
    if (!form.loginId.value) {
        alert("아이디를 입력해 주십시오.");
        form.loginId.focus();
        return;
    }
    //비밀번호 입력 없음.
    else if (!form.password.value) {
        alert("비밀번호를 입력해 주십시오.");
        form.password.focus();
        return;
    }
    recent_longinId=form.loginId.value;
    form.submit();
}

/*---------------------------------------------------------------
로그인 실패 메시지
----------------------------------------------------------------*/
var error_code = "[[${error_code}]]";
if(error_code!=""){
    if(error_code=="0"){    //에러코드 0 : 비밀번호 틀림
        if(!localStorage.getItem(recent_longinId)){
            let zero=0;
            localStorage.setItem(recent_longinId, zero.toString());
        }
        else{
            let count=localStorage.getItem(recent_longinId);
            localStorage.setItem(recent_longinId,(count+1).toString());
        }
    }
}