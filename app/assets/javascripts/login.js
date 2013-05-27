/// Yes, we know we have to refactor this.

var Join = {
  init: function() {
    $("#join_button").on('click', this.toggleForm);
    $("#join_form").on('ajax:error', this.showErrors);
    $("#modal_background").click(function(){
      $("#join_form").hide();
      $(this).hide();
      $("#join_errors").html("");
    });
  },

  toggleForm: function(e) {
    e.preventDefault();
    $('#modal_background').toggle();
    $('#join_form').toggle();
  },

  showErrors: function(event, xhr, status, error) {
    $("#join_errors").html($.parseJSON(xhr.responseText).error);
  }
}

var LogIn = {
  
  init: function() {
    $("#login_button").on('click', this.toggleForm);
    $("#login_form").on('ajax:error', this.showErrors);
    $("#modal_background").click(function(){
      $("#login_form").hide();
      $(this).hide();
      $("#login_errors").html("");
    });
  },

  toggleForm: function(e) {
    e.preventDefault();
    $('#modal_background').toggle();
    $('#login_form').toggle();
  },

  showErrors: function(event, xhr, status, error) {
    $("#login_errors").html($.parseJSON(xhr.responseText).error);
  }
}

$(document).ready(function(){
  Join.init();
  LogIn.init();
})
