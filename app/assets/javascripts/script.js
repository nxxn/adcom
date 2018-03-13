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
  var autoplay_text = "?autoplay=1"

  $("#video_modal").attr('src', '');

  $("#videoModal").on('hide.bs.modal', function(){
    $("#video_modal").attr('src', '');
  });

  $("#video_modal_opener").on('click', function(){
    $("#video_modal").attr('src', video_url + autoplay_text);
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
  }

  function show_popup(){
    $('#newsModal').modal('show');
  };

  setInterval(function(){
    if( $.cookie('newsCookie') === 'unseen' ) {
      $.cookie('newsCookie', 'seen', { path: '/' });

      $('#videoModal').modal('hide');
      $('#newsModal').modal('hide');

      window.setTimeout( show_popup, 500 );
    }
  }, 10000);

  $('.mobile_links_list .top_nav_link').click(function() {
    $('#navbar-collapse').collapse('hide');
  });

  $to_contacts = $('.course_to_contacts');

  //smooth scroll to contacts
	$to_contacts.on('click', function(event){
    $('html,body').animate({
      scrollTop: $('#contact_us').offset().top
    }, 1000);
	});
});
