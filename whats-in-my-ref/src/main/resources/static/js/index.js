document.documentElement.style.setProperty('--window-width',document.documentElement.clientWidth);
document.documentElement.style.setProperty('--window-height',document.documentElement.clientHeight);

//index.html 애니메이션 처리 gsap
document.addEventListener("DOMContentLoaded", (event) => {
    gsap.set(".back", { opacity:0,rotationY:-180 });

    gsap.utils.toArray(".box").forEach((container) => {
        let info = container.querySelector(".back"),
            front=container.querySelector(".front"),
            tl = gsap.timeline({ paused: true }),
            t2=gsap.timeline({ paused: true }),
            t3=gsap.timeline({ paused: true });

    tl.to(info, {rotationY:0 ,ease:"none"});
    t2.to(front,{rotationY:180,opacity:0,ease:"none"});
    t3.to(info, {opacity:1 ,delay:0.8,ease:"none"});

    container.addEventListener("mouseenter", () => tl.timeScale(2).play());
    container.addEventListener("mouseenter", () => t2.timeScale(2).play());
    container.addEventListener("mouseenter", () => t3.timeScale(4).play());
    container.addEventListener("mouseleave", () => tl.timeScale(3).reverse());
    container.addEventListener("mouseleave", () => t2.timeScale(3).reverse());
    container.addEventListener("mouseleave", () => t3.timeScale(3).reverse());
    });
});

//헤더
function updateFontSize() {
    let clientWidth = document.querySelector('.Container2').scrollWidth;
    let fontScale = clientWidth / 80; // 원하는 비율로 조정하세요.
    document.querySelector("#header").style.fontSize = fontScale + 'px';
    document.querySelector(".navbar").style.fontSize = fontScale -5+ 'px';
    document.querySelector('.navbar').style.top=clientWidth/300+'px';
    document.querySelector('.brandName').style.top=clientWidth/900+'px';
}
window.addEventListener("load", updateFontSize); // 페이지 로드 시
window.addEventListener("resize", updateFontSize); // 창 크기 변경 시

function updateBoxPlace(){
    let height = document.querySelector('.Container2').scrollHeight,
        width=document.querySelector('.Container2').scrollWidth;
    
        document.getElementById("Search_recipe").style.left = width/57*16+ 'px';
        document.getElementById("Search_recipe").style.top = height/12+ 'px';
        document.getElementById("Make_recipe").style.left = width/3*2+ 'px';
        document.getElementById("Make_recipe").style.top = height/19+ 'px';
}
window.addEventListener("load", updateBoxPlace); // 페이지 로드 시
window.addEventListener("resize", updateBoxPlace); // 창 크기 변경 시