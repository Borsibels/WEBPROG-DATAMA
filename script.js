document.addEventListener("DOMContentLoaded", function () {
    let categories = document.querySelectorAll(".category");

    function fadeInOnScroll() {
        let windowHeight = window.innerHeight;
        categories.forEach((category) => {
            let position = category.getBoundingClientRect().top;
            if (position < windowHeight - 100) {
                category.style.opacity = "1";
                category.style.transform = "translateY(0)";
            }
        });
    }

    window.addEventListener("scroll", fadeInOnScroll);
    fadeInOnScroll(); // Run initially in case elements are already in view
});
