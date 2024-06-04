//댓글의 입력 유무 체크
function comment_check(){
    var form=document.getElementById("comment-form");
   
    if(form.commentContentInput.value.trim()===''){
        alert("댓글 내용을 입력해주세요.")
        return false;
    }
    form.submit();
    return true;
}

//글자 수 출력
document.addEventListener('DOMContentLoaded', function () {
    let textarea = document.getElementById('commentContentInput'),
        charCount = document.getElementById('char-count');

    textarea.addEventListener('input', function () {
        let currentLength = textarea.value.length,
            maxLength = textarea.getAttribute('maxlength');
        charCount.textContent = `${currentLength}/${maxLength}`;
        if(currentLength>=maxLength){
            charCount.style.color="red";
        }
        else{
            charCount.style.color="grey";
        }
    });
});