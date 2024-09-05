$(function () {
  const swiper = new Swiper("header .swiper", {
    // Optional parameters
    slidesPerView: 7,
    loop: true,
    spaceBetween: 20,
  });

  const swiperHp = new Swiper(".homepage .swiper", {
    // Optional parameters
    slidesPerView: 4,
    loop: true,
    spaceBetween: 30,
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });

  const swiperPp = new Swiper(".popularPost .swiper", {
    // Optional parameters
    slidesPerView: 4,
    loop: true,
    spaceBetween: 30,
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });
});
