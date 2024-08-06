const iMain = document.querySelector('.iframe-main');
const iSettings = document.querySelector('.iframe-settings');
const iShop = document.querySelector('.iframe-shop');
const iStyle = document.querySelector('.iframe-style');
const iChat = document.querySelector('.iframe-chat');
const iExplore = document.querySelector('.explore-wrap');
const screens = document.querySelectorAll('.iframe-wrapper iframe');
const icons = document.querySelectorAll('.material-icons');
const loginBtn = document.querySelector('.login-btn');
const main = document.querySelector('.main-page');

function scrollToSection(index) {
    const sections = document.querySelectorAll('section');
    if (index >= 0 && index < sections.length) {
        sections[index].scrollIntoView({
            behavior: 'smooth',
            block: 'start'
        });
    }
}

function disableScroll(event) {
    event.preventDefault();
    event.stopPropagation();
    return false;
}

function preventMouseWheelScroll() {
    window.addEventListener('wheel', disableScroll, { passive: false });
}

function initializeFloatingAnimations() {

    for (let i = 0; i < icons.length; i++) {
        icons[i].classList.add(`float`)
    }

}

loginBtn.addEventListener('click', function () {

    scrollToSection(2);

    for (let i = 1; i < icons.length; i++) {

        icons[0].style.visibility = 'hidden';
        icons[0].style.opacity = 0;

        setTimeout(() => {
            icons[i].style.visibility = 'visible';
            icons[i].style.opacity = 1;
            icons[i].style.transition = '2s';
        }, 800 + (300 * (i + 1)));
    };

    initializeFloatingAnimations();

});

document.querySelector('.turtle').addEventListener('click', () => scrollToSection(0));
document.querySelector('.explore-tab').addEventListener('click', () => scrollToSection(1));
document.querySelector('.diver').addEventListener('click', function() {

    scrollToSection(2)
    iExplore.style.opacity = 0;
    iExplore.style.visibility = 'hidden';
    const b = document.querySelector('.explore-tab');
    b.style.opacity = 1;
    b.style.visibility = 'visible';
    restartFloatingAnimation(b);

});

function restartFloatingAnimation(element) {

    element.classList.remove('float');
    
    requestAnimationFrame(() => {
        requestAnimationFrame(() => {
            element.classList.add('float');
        });
    });
}

icons.forEach(icon => {
    icon.addEventListener('click', function () {
        this.animate(
            [
                { transform: 'scale(1)' },
                { transform: 'scale(1.25)' },
                { transform: 'scale(1)' }
            ],
            {
                duration: 400,
                fill: 'forwards',
                easing: 'ease'
            }
        );
        this.style.opacity = 0;
        this.style.visibility = 'hidden';
        this.style.transition = '.5s';
        this.classList.remove('float');

        icons.forEach(b => {
            if (b !== this) {
                if (b.style.visibility == 'hidden') {
                    b.style.opacity = 1;
                    b.style.visibility = 'visible';
                    restartFloatingAnimation(b);
                }
            }
        });
    });
});

function handleIframeNavigation(iframe) {
    screens.forEach(a => {
        a.style.opacity = 0;
        a.style.transition = '.6s';
        a.style.visibility = 'hidden';
    });
    document.querySelector('.iframe-wrapper').animate(
        [
            { transform: 'scale(1)' },
            { transform: 'scale(1.007)' },
            { transform: 'scale(1)' }
        ],
        {
            duration: 700,
            fill: 'forwards',
            easing: 'ease'
        }
    );
    setTimeout(() => {
        iframe.style.opacity = 1;
        iframe.style.visibility = 'visible';
    }, 100);
}

function showExplore(iframe) {
    setTimeout(() => {
        iframe.style.opacity = 1;
        iframe.style.visibility = 'visible';
        iframe.style.transition = '1s';
    }, 800);
}

preventMouseWheelScroll();

function applyFloatingAnimationWithDelay(element, index) {
    const delay = index * 0.4;
    element.style.animationDelay = `${delay}s`;
}

icons.forEach((icon, index) => {
    applyFloatingAnimationWithDelay(icon, index);
});

// 여기에 아이프레임
document.querySelector('.settings').addEventListener('click', () => handleIframeNavigation(iSettings));
document.querySelector('.mainTab').addEventListener('click', () => handleIframeNavigation(iMain));
document.querySelector('.shopTab').addEventListener('click', () => handleIframeNavigation(iShop));
document.querySelector('.styleTab').addEventListener('click', () => handleIframeNavigation(iStyle));
document.querySelector('.chatTab').addEventListener('click', () => handleIframeNavigation(iChat));
document.querySelector('.explore-tab').addEventListener('click', () => showExplore(iExplore));



