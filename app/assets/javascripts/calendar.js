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
    ajaxCalendar(new_month)
    var month = $(this).parents(".calendar").data("month")
    var new_month = prevMonth(month)
    
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
    ajaxCalendar(new_month)
    var month = $(this).parents(".calendar").data("month")
    var new_month = nextMonth(month)
    
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
       },200)
       
    } else {
      $.ajax({
        url: "/teachers/render_single_day",
        type: "GET",
        dataType: "json",
        data: {date: $(this).attr("datenum")},
        success: function(singleDayHtml){
          $("#calendar").prepend(singleDayHtml)
        }
      })
    }
    
  })

});