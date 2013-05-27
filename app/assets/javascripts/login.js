var Login = {
  init: function() {
    $("#join_button").on('click', this.toggleLoginForm);
    // $("#join_form").on('ajax:error', alert('error!'));
    $("#join_form").on('ajax:error', this.showErrors);
    $("#modal_background").click(function(){
      $("#join_form").hide();
      $(this).hide();
    });


  },

  toggleLoginForm: function(e) {
    e.preventDefault();
    $('#modal_background').toggle();
    $('#join_form').toggle();
  },

  showErrors: function(event, xhr, status, error) {
    $("#join_form").append($.parseJSON(xhr.responseText).error);
    debugger
  }

}

$(document).ready(function(){
  Login.init();
})
