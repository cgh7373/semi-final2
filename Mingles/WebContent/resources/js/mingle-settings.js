const m = $("#memNo").val();

$(function () {

    $('.top__left label').click(function () {
        $('.top__left .profilePhoto img').attr('src', $('top__left input').val());
    })
    
    $(".top__left input").change(function (event) {
        var reader = new FileReader();
        reader.onload = function (event) {
            var img = $(".top__left .profilePhoto img");
            img.attr("src", event.target.result);
            $(".top__left .profilePhoto").append(img);
        };
        reader.readAsDataURL(event.target.files[0]);
    });

})

function renderFavoritePosts() {
	
	let value = "";
	
	$.ajax({
		url : "/Mingles/favPosts.mi",
		data : {
			owner : m,
		},
		success : (result) => {
			
			let j = 0;
			j = result.length;
			
			for (let i in result) {
				
				value += "<div class='swiper-slide'><img src='" + result[i].postThumbnail + "' /><span data-pno='" + result[i].postNum + "'></span></div>"
						
			}
			
			while (j < 3) {
				value += "<div class='swiper-slide'><img src='../../resources/images/Mingles-움직임.gif'/></div>"
				j++;
			}
			
			$(".swiper-wrapper.favPost").html(value);
			
			new Swiper('.mid .promotion .swiper-container', {
	
			    slidesPerView: 3,
			    spaceBetween: 20,
			    centeredSlides: true, // 1번 슬라이드를 가운데 두기
			    loop: true,
			    speed: 1300,
			    autoplay: {
			        delay: 2500,
			        disableOnInteraction: false,
			    },
						navigation: {
			            prevEl: '.mid .promotion .swiper-prev',
			            nextEl: '.mid .promotion .swiper-next',
			        }
			})
		}
		
	})
	
};

function renderRecentReplied() {
	
	let value = "";
	
	$.ajax({
		url : "/Mingles/recentReplied.mi",
		data : {
			owner : m,
		},
		success : (result) => {
			
			let j = 0;
			j = result.length;
			
			for (let i in result) {
				
				value += "<div class='swiper-slide'><img src='" + result[i].postThumbnail + "' /><span data-pno='" + result[i].postNum + "'></span></div>"
						
			}
			
			while (j < 3) {
				value += "<div class='swiper-slide'><img src='../../resources/images/Mingles-움직임.gif'/></div>"
				j++;
			}
			
			$(".swiper-wrapper.recentRPost").html(value);
			
			new Swiper('.bot .promotion .swiper-container', {
	
			    slidesPerView: 3,
			    spaceBetween: 20,
			    centeredSlides: true, // 1번 슬라이드를 가운데 두기
			    loop: true,
			    speed: 1300,
			    autoplay: {
			        delay: 2500,
			        disableOnInteraction: false,
			    },
						navigation: {
			            prevEl: '.bot .promotion .swiper-prev',
			            nextEl: '.bot .promotion .swiper-next',
			        }
			})
		}
		
	});
	
};

$(".swiper-wrapper").on('click', '.swiper-slide', function() {
	
	 let dataPno = $(this).find('span').data('pno') ?? 0;
	 
	 if (dataPno > 0) {
		 location.href="/Mingles/toOthersPost.mi?owner=" + m + "&modal=on&pNum=" + dataPno;
     };
	
});

renderFavoritePosts();
renderRecentReplied();


