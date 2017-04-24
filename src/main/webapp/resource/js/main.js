/**
 *
 */

$(document).ready(function () {
    $("#main_menu").hover(function () {
        $("#show_main_menu").stop(true, false, true).slideToggle("fast");
    });
});


$(document).ready(function () {
    $("#main_menu1").hover(function () {
        $("#show_main_menu1").stop(true, false, true).slideToggle("fast");
    });
});


$(document).ready(function () {
    $("#header_middle_cart").click(function () {
        $("#cart_toggle").stop(true, false, true).slideToggle("slow");
    });
});

$("#myCarousel").hover(function () {
    $("#myCarousel").addClass(".left");
    $("#myCarousel").addClass(".right");
});

$(function () {
    $(function () {
        var pull = $('#pull');
        menu = $('.header_menu_bg .main_menu_bg');
        menuHeight = menu.height();

        $(pull).on('click', function (e) {
            e.preventDefault();
            menu.slideToggle();
        });
    });

    $(window).resize(function () {
        var w = $(window).width();
        if (w > 320 && menu.is(':hidden')) {
            menu.removeAttr('submenu_v2');
        }
    });
});
$(document).ready(function () {
    $("#review_item_toggle").click(function () {
        $("#review_item_show").stop(true, false, true).slideToggle();
    })
})
$(document).ready(function () {
    $("#panel_checkout_order_toggle").click(function () {
        $("#panel_checkout_order_toggle_body").stop(true, false, true).slideToggle();
    })
})
$(document).ready(function () {
    // Add scrollspy to <body>
    $('body').scrollspy({target: ".infor-scroll", offset: 50});

    // Add smooth scrolling on all links inside the navbar
    $("#infor-scroll-item a").on('click', function (event) {
        // Make sure this.hash has a value before overriding default behavior
        if (this.hash !== "") {
            // Prevent default anchor click behavior
            event.preventDefault();

            // Store hash
            var hash = this.hash;

            // Using jQuery's animate() method to add smooth page scroll
            // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
            $('html, body').animate({
                scrollTop: $(hash).offset().top
            }, 800, function () {

                // Add hash (#) to URL when done scrolling (default click behavior)
                window.location.hash = hash;
            });
        }  // End if
    });
});
//function sticky_rolate(){
//	var window_top=$(window).scrollTop();
//	var div_top=$('#sticky-anchor').offset().top;
//	if(window_top > div_top){
//		$('#header_menu_bg_scroll').addClass('header_menu_bg');
//		$('#sticky-anchor').height($('#header_menu_bg_scroll').outerHeight());
//	}else{
//		$('#header_menu_bg_scroll').removeClass('header_menu_bg');
//		$('#sticky-anchor').height(0);
//	}
//}
//$(function() {
//    $(window).scroll(sticky_rolate);
//    sticky_rolate();
//});

//$(function(){
//	$(window).scroll(function(){
//		var scrollval=$(window).scrollTop();
//		if(scrollval >= 210){
//			$("#header_scroll_main").hide();
//			$("#header_detail_scroll").show();
//		}
//		else{
//			$("#header_scroll_main").show();
//			$("#header_detail_scroll").hide();
//		}
//	})
//})

//Instantiate the Bootstrap carousel
$('.multi-item-carousel').carousel({
  interval: false
});

// for every slide in carousel, copy the next slide's item in the slide.
// Do the same for the next, next item.
$('.multi-item-carousel .item').each(function(){
  var next = $(this).next();
  if (!next.length) {
    next = $(this).siblings(':first');
  }
  next.children(':first-child').clone().appendTo($(this));
  
  if (next.next().length>0) {
    next.next().children(':first-child').clone().appendTo($(this));
  } else {
  	$(this).siblings(':first').children(':first-child').clone().appendTo($(this));
  }
});