function Modal(button, form, errors) {
  this.button = button;
  this.form = form;
  this.errors = errors;

  this.initialize = function() {
    $(button).on('click', this.toggleForm);
    $(form).on('ajax:error', this.showErrors);
    $("#modal_background").click(function(){
      $(form).hide();
      $(this).hide();
      $(errors).html("");
    });
  }

  this.toggleForm = function(e) {
    e.preventDefault();
    $('#modal_background').toggle();
    $(form).toggle();
  };

  this.showErrors = function(event, xhr, status, error) {
    $(errors).html($.parseJSON(xhr.responseText).error);
  };

}

var joinModal = new Modal("#join_button", "#join_form", "#join_errors");
var loginModal = new Modal("#login_button", "#login_form", "#login_errors")

$(document).ready(function(){
  joinModal.initialize();
  loginModal.initialize();
});
