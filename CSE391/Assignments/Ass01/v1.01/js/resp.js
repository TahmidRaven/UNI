burger = document.querySelector('.burger')
navbar = document.querySelector('.navbar')
rightNav = document.querySelector('.rightNav')
navlist = document.querySelector('.nav-list')


burger.addEventListener('click',() => {
        navlist.classList.toggle('visibility');
        rightNav.classList.toggle('visibility');
        navbar.classList.toggle('height-nav');


})