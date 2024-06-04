//댓글의 입력 유무 체크
function comment_check(){
    var form=document.getElementById("comment-form");
    if(!form.comment-content-input.value){
        return false;
    }
    form.submit();
}

//글자 수 출력
document.addEventListener('DOMContentLoaded', function () {
    let textarea = document.getElementById('comment-content'),
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