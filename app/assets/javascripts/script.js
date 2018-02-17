$(document).ready(function() {

  // Center modal
  function centerModals(){
    $('.modal').each(function(i){
      var $clone = $(this).clone().css('display', 'block').appendTo('body');
      var top = Math.round(($clone.height() - $clone.find('.modal-content').height()) / 2);
      top = top > 0 ? top : 0;
      $clone.remove();
      $(this).find('.modal-content').css("margin-top", top);
    });
  }
  $('.modal').on('show.bs.modal', centerModals);
  $(window).on('resize', centerModals);

  var video_url = $("#video_modal").attr('src');

  $("#video_modal").attr('src', '');

  $("#videoModal").on('hide.bs.modal', function(){
    $("#video_modal").attr('src', '');
  });

  $("#videoModal").on('show.bs.modal', function(){
    $("#video_modal").attr('src', video_url);
  });

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
    nextArrow: '<div class="slick-next slider_arrow slider_right_arrow"><i class="fa fa-angle-right"></i></div>',
    responsive: [
      {
        breakpoint: 1000,
        settings: {
          arrows: false,
          slidesToShow: 1
        }
      },
      {
        breakpoint: 550,
        settings: {
          arrows: false,
          slidesToShow: 1
        }
      }
    ]

  });

  $('.testimonial_slider').slick({
    infinite: true,
    slidesToShow: 1,
    prevArrow: '<div class="slick-prev slider_arrow testimonial_left_arrow"><i class="fa fa-angle-left"></i></div>',
    nextArrow: '<div class="slick-next slider_arrow testimonial_right_arrow"><i class="fa fa-angle-right"></i></div>',
    responsive: [
      {
        breakpoint: 1000,
        settings: {
          arrows: false,
          slidesToShow: 1
        }
      },
      {
        breakpoint: 550,
        settings: {
          arrows: false,
          slidesToShow: 1
        }
      }
    ]

  });

  if(!$.cookie('newsCookie')){
    $.cookie('newsCookie', 'unseen', { path: '/' });

    // var date = new Date();
    // var minutes = 2;
    // date.setTime(date.getTime() + (minutes * 60 * 1000));
    // $.cookie("expireCookie", "expire", { expires: date, path: '/' });

    console.log("ss");
  }

  function show_popup(){
    $('#newsModal').modal('show');
  };
  // window.setTimeout( show_popup, 5000 );

  setInterval(function(){
    console.log($.cookie('newsCookie'));
    if( $.cookie('newsCookie') === 'unseen' ) {
      console.log($.cookie('newsCookie'));
      $.cookie('newsCookie', 'seen', { path: '/' });

      $('#videoModal').modal('hide');
      $('#newsModal').modal('hide');

      window.setTimeout( show_popup, 500 );
    }
  }, 10000);

});
