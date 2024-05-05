document.documentElement.style.setProperty('--window-width',document.documentElement.clientWidth);
document.documentElement.style.setProperty('--window-height',document.documentElement.clientHeight);

//index.html 애니메이션 처리 gsap
document.addEventListener("DOMContentLoaded", (event) => {
    gsap.set(".back", { opacity:0,rotationY:-180 });

    gsap.utils.toArray(".box").forEach((container) => {
        let back = container.querySelector(".back"),
            front=container.querySelector(".front"),
            tl = gsap.timeline({ paused: true }),
            t2=gsap.timeline({ paused: true }),
            t3=gsap.timeline({ paused: true });

    tl.to(back, {rotationY:0 ,ease:"none"});
    t2.to(front,{ rotationY:180, opacity:0,ease:"none"});
    t3.to(back, { opacity:1 ,delay:0.8,ease:"none"});

    container.addEventListener("mouseenter", () => tl.timeScale(2).play());
    container.addEventListener("mouseenter", () => t2.timeScale(2).play());
    container.addEventListener("mouseenter", () => t3.timeScale(4).play());
    container.addEventListener("mouseleave", () => tl.timeScale(3).reverse());
    container.addEventListener("mouseleave", () => t2.timeScale(3).reverse());
    container.addEventListener("mouseleave", () => t3.timeScale(3).reverse());
    });
});




//웹페이지 이동
function redirectToPage(str){
    window.location.href=str;
}