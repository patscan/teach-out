$(document).ready(function(){

  function ajaxCalendar(new_month){
    $.ajax({
      url: "/teachers/render_calendar",
      dataType: 'json',
      type: "GET",
      data: {month: new_month},
      success: function(data){
        $("#calendar").html(data.calendar)
      }
    })
  }

  $('#calendar').on('click', '.prev_month', function(e){
    e.preventDefault();
    console.log($(this));
    var month = $(this).parents(".calendar").data("month")
    var new_month = prevMonth(month)
    ajaxCalendar(new_month)
    function prevMonth(month) {
      this.month = month;
      var parts = month.split('-');
      var m = parts[1];
      var y = parts[0];
      return y+'-'+(parseInt(m)-1)
    };
  });

  $('#calendar').on('click', '.next_month', function(e){
    e.preventDefault();
    var month = $(this).parents(".calendar").data("month")
    var new_month = nextMonth(month)
    ajaxCalendar(new_month)
    function nextMonth(month) {
      this.month = month;
      var parts = month.split('-');
      var m = parts[1];
      var y = parts[0];
      return y+'-'+(parseInt(m)+1)
    };
  });

  $('#calendar').on('click', 'td', function(){
    if($(this).hasClass('yo')){
      $('.single_day').animate({
        left: '+=300'
      }, 400);
      $('#calendar').animate({
        left: '+=300'
      }, 400);
      $('#col1').animate({
        left: '+=300'
      }, 400);
      $('#calendar td').removeClass("yo");
    } else if($(this).text().trim().length < 3) {
     $(this).css({"background-color": "#FF6969"});
     var thisTd = this
     setTimeout(function(){
       $(thisTd).css({"background-color": "#FFF"});
     },200)
   }
   else {
    $.ajax({
      url: "/teachers/render_single_day",
      type: "GET",
      dataType: "json",
      data: {date: $(this).attr("datenum")},
      success: function(singleDayHtml){
        $('.single_day').animate({
          left: '-=300'
        }, 400);
        $('#calendar').animate({
          left: '-=300'
        }, 400);
        $('#col1').animate({
          left: '-=300'
        }, 400);
        $('#calendar td').addClass("yo");
        setTimeout(function(){
          $("#single_day").first().replaceWith(singleDayHtml.single_day);
        },300);

      }
    })
  }
})
});
