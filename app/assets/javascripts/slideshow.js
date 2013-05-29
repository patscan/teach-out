function slideSwitch() {
  var $active = $('#slideshow span.active');
  if ( $active.length == 0 ) $active = $('#slideshow span:last');
  var $next = $active.next().length ? $active.next() : $('#slideshow span:first');
  $active.addClass('last-active');
  $next.css({opacity: 0.0}).addClass('active').animate({opacity: 1.0}, 1000, function() {
    $active.removeClass('active last-active');
  });
}

$(document).ready(function(){
 setInterval( "slideSwitch()", 3000 ); 
});