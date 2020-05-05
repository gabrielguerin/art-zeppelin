/* Custom JS ########################################################## */
/* ##################################################################### */

/* ######## Mobile Nav */
const burgerBtn = document.querySelector('.burger-btn');
const ddownLinks = document.querySelector('.header-links-ctn');
const burgerOpen = document.querySelector('#burger-open');
const burgerClose = document.querySelector('#burger-close');


function toggleNav() {
    if (!ddownLinks.classList.contains('header-links-ctn-active')) {
        ddownLinks.classList.add('header-links-ctn-active');
        burgerOpen.style.opacity = 0;
        burgerClose.style.opacity = 1;
    } else {
        ddownLinks.classList.remove('header-links-ctn-active');
        burgerOpen.style.opacity = 1;
        burgerClose.style.opacity = 0;
    }
}
burgerBtn.addEventListener('click', toggleNav); 


/* ######## Nav Dropdown */
const ddownLink = document.querySelector('.header-ddown-link');
const ddownCtt = document.querySelector('.header-ddown-ctt');

function toggleDdown() {
    if (!ddownCtt.classList.contains('header-ddown-ctt-active')) {
        ddownCtt.classList.add('header-ddown-ctt-active');
        ddownCtt.classList.remove('header-ddown-ctt-inactive');
    } else {
        ddownCtt.classList.remove('header-ddown-ctt-active');
        ddownCtt.classList.add('header-ddown-ctt-inactive');
    }
}
ddownLink.addEventListener('click', toggleDdown);


/* ######## Carousel */
const crslNextBtn = document.querySelector('.crsl-next');
const crslPrevBtn = document.querySelector('.crsl-prev');
const crslAllImgs = document.querySelector('.crsl-all-img-ctn');
const crslImgs = document.querySelectorAll('.crsl-img');
const crslImgsLength = document.querySelectorAll('.crsl-img').length;
var nextCount = 0;

crslImgs[nextCount+1].style.transform = "scale(1.2)";

function crslPrevImg() {
    nextCount -= 1;
    if (nextCount < -1) {
        nextCount = crslImgsLength - 2;
    }
    crslAllImgs.style.transform = `translateX(${nextCount*50*-1}vw)`;
    if (nextCount > -1) crslImgs[nextCount].style.transform = "scale(1)";
    crslImgs[nextCount+1].style.transform = "scale(1.2)";
    if (nextCount < crslImgsLength - 1) crslImgs[nextCount + 2].style.transform = "scale(1)";
}
function crslNextImg() {
    nextCount += 1;
    if (nextCount > crslImgsLength - 2) {
        nextCount = -1;
    }

    crslAllImgs.style.transform = `translateX(${nextCount*50*-1}vw)`;
    if (nextCount > -1) crslImgs[nextCount].style.transform = "scale(1)";
    crslImgs[nextCount+1].style.transform = "scale(1.2)";
    if (nextCount < crslImgsLength - 1) crslImgs[nextCount + 2].style.transform = "scale(1)";
}
crslPrevBtn.addEventListener('click', crslPrevImg);
crslNextBtn.addEventListener('click', crslNextImg);