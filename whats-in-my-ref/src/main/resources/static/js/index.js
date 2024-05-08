document.documentElement.style.setProperty('--window-width',document.documentElement.clientWidth);
document.documentElement.style.setProperty('--window-height',document.documentElement.clientHeight);

//index.html 애니메이션 처리 gsap
document.addEventListener("DOMContentLoaded", (event) => {
    gsap.set(".back", { opacity:0,y:30 });
    

    gsap.utils.toArray(".big-box").forEach((container) => {
        let back = container.querySelector(".back"),
            box=container.querySelector(".box"),
            tl = gsap.timeline({ paused: true }),
            t2 = gsap.timeline({ paused: true });

    tl.to(back, { opacity:1,y:0 ,ease:"none"});
    t2.to(box,{scale:1.05,duration:1});


    box.addEventListener("mouseenter", () => tl.timeScale(5).play());
    box.addEventListener("mouseenter", () => t2.timeScale(3).play());
    box.addEventListener("mouseleave", () => tl.timeScale(3).reverse());
    box.addEventListener("mouseleave", () => t2.timeScale(3).reverse());
    });
});




//웹페이지 이동
function redirectToPage(str){
    window.location.href=str;
}