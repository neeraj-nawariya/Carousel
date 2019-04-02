$(document).ready(function(){
  $('.carousel').slick({
    dots: false,
    infinite: true,
    slidesToShow: 4,
    slidesToScroll: 1,
    autoplay:true,
    autoplaySpeed:0,
    arows:false,
    speed:1000,
    centerMode:false,
    pauseOnHover: true,
    cssEase: 'linear',
  initialSlide: 1,
  draggable: false,
  });
});