$(document).ready(function(){

$(document).on('click', '.prev_month', function(e){
    e.preventDefault();
    var month = $(this).parents(".calendar").data("month")
    var new_month = prevMonth(month)
    
    function prevMonth(month) {
      this.month = month;
      var parts = month.split('-');
      var m = parts[1];
      var y = parts[0];
      return y+'-'+(parseInt(m)-1)
    };

    $.ajax({
      url: "/teachers/render_calendar",
      dataType: 'json',
      type: "GET",
      data: {month: new_month}, //date needs to increment month line 35
      success: function(data){
        $("#calendar").html(data.calendar)
      }
    })
  });

  $(document).on('click', '.next_month', function(e){
    e.preventDefault();
    var month = $(this).parents(".calendar").data("month")
    var new_month = nextMonth(month)
    
    function nextMonth(month) {
      this.month = month;
      var parts = month.split('-');
      var m = parts[1];
      var y = parts[0];
      return y+'-'+(parseInt(m)+1)
    };

    $.ajax({
      url: "/teachers/render_calendar",
      dataType: 'json',
      type: "GET",
      data: {month: new_month}, //date needs to increment month line 35
      success: function(data){
        $("#calendar").html(data.calendar)
      }
    })
  });
});