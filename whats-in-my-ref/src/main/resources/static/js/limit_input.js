//id: 숫자와 영어의 조합
function idInput() {
    const input = document.getElementById('idInput').value;
    const pattern = /^[A-Za-z][A-Za-z0-9]{3,15}$/;
    const isValid = pattern.test(input);
    const errorSpan = document.getElementById('idError');
    if (!isValid) {
        errorSpan.textContent = '영어로 시작하는 영어와 숫자 조합의 3~15자리 아이디를 입력하세요.';
        return false;
    } else {
        errorSpan.textContent = '';
        return true;
    }
}

function idInput() {
    const input = document.getElementById('idInput').value;
    const pattern = /^[A-Za-z0-9]+$/;
    const isValid = pattern.test(input);
    const errorSpan = document.getElementById('idError');
    if (!isValid) {
        errorSpan.textContent = '영어와 숫자의 조합을 입력하세요.';
    } else {
        errorSpan.textContent = '';
    }
}