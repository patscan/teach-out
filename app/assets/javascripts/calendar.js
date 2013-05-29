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

  $(document).on('click', '.prev_month', function(e){
    e.preventDefault();

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

  $(document).on('click', '.next_month', function(e){
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

  $(document).on('click', 'td', function(){

    if ($(this).text().trim().length < 3) {
       $(this).css({"background-color": "#FF6969"});
       var thisTd = this
       setTimeout(function(){
         $(thisTd).css({"background-color": "#FFF"});
         $(".single_day").slideUp("swing")
       },200)
    } else {

      $.ajax({
        url: "/teachers/render_single_day",
        type: "GET",
        dataType: "json",
        data: {date: $(this).attr("datenum")},
        success: function(singleDayHtml){
        $(".single_day").slideUp("ease")
        $(".single_day").slideDown("ease")
                  setTimeout(function(){
         $("#single_day").first().replaceWith(singleDayHtml.single_day);
       },300).stop()


          
        }      
      })
    }
    
  })

});