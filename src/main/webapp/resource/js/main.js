/**
 * 
 */

        $(document).ready(function(){
    $("#main_menu").hover(function(){
        $("#show_main_menu").stop(true,false,true).slideToggle("fast");
    });
});


        $(document).ready(function(){
    $("#main_menu1").hover(function(){
        $("#show_main_menu1").stop(true,false,true).slideToggle("fast");
    });
});


$(document).ready(function(){
    $("#header_middle_cart").click(function(){
        $("#cart_toggle").stop(true,false,true).slideToggle("slow");
    });
});

        $("#myCarousel").hover(function(){
            $("#myCarousel").addClass(".left");
            $("#myCarousel").addClass(".right");
        });

	$(function() { 
		    $(function() {  
        		 var pull = $('#pull');  
           		 menu = $('.header_menu_bg .main_menu_bg');  
            	 menuHeight  = menu.height();  
      
        		$(pull).on('click', function(e) {  
           			 e.preventDefault();  
           		 menu.slideToggle();  
        		});  
    		});  

    		$(window).resize(function(){  
        		var w = $(window).width();  
        		if(w > 320 && menu.is(':hidden')) {  
           		 menu.removeAttr('submenu_v2');  
        	}  
   		 });    
    });  
$(document).ready(function(){
	$("#review_item_toggle").click(function(){
		$("#review_item_show").stop(true,false,true).slideToggle();
	})
})
$(document).ready(function(){
  // Add scrollspy to <body>
  $('body').scrollspy({target: ".infor-scroll", offset: 50});   

  // Add smooth scrolling on all links inside the navbar
  $("#infor-scroll-item a").on('click', function(event) {
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
      }, 800, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    }  // End if
  });
});


