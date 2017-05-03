$(document).ready(function() {

  $('a[href*=#]:not([href=#])').click(function() {
      if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'')
          || location.hostname == this.hostname) {

          var target = $(this.hash);
          target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
             if (target.length) {
               $('html,body').animate({
                   scrollTop: target.offset().top
              }, 1000);
              return false;
          }
      }
  });

  $('.portfolio_slider').slick({
    infinite: true,
    slidesToShow: 1,
    prevArrow: '<div class="slick-prev slider_arrow slider_left_arrow"><i class="fa fa-angle-left"></i></div>',
    nextArrow: '<div class="slick-next slider_arrow slider_right_arrow"><i class="fa fa-angle-right"></i></div>'
    // responsive: [
    //   {
    //     breakpoint: 1200,
    //     settings: {
    //       prevArrow: '<div class="slick-prev arrow left_arrow"></div>',
    //       nextArrow: '<div class="slick-next arrow right_arrow"></div>',
    //       centerMode: true,
    //       slidesToShow: 1
    //     }
    //   },
    //   {
    //     breakpoint: 550,
    //     settings: {
    //       arrows: false,
    //       centerMode: true,
    //       slidesToShow: 1
    //     }
    //   }
    // ]

  });

  $('.testimonial_slider').slick({
    infinite: true,
    slidesToShow: 1,
    prevArrow: '<div class="slick-prev slider_arrow testimonial_left_arrow"><i class="fa fa-angle-left"></i></div>',
    nextArrow: '<div class="slick-next slider_arrow testimonial_right_arrow"><i class="fa fa-angle-right"></i></div>'
    // responsive: [
    //   {
    //     breakpoint: 1200,
    //     settings: {
    //       prevArrow: '<div class="slick-prev arrow left_arrow"></div>',
    //       nextArrow: '<div class="slick-next arrow right_arrow"></div>',
    //       centerMode: true,
    //       slidesToShow: 1
    //     }
    //   },
    //   {
    //     breakpoint: 550,
    //     settings: {
    //       arrows: false,
    //       centerMode: true,
    //       slidesToShow: 1
    //     }
    //   }
    // ]

  });

});
