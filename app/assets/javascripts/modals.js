function Modal(button, form, errors) {
  this.button = button;
  this.form = form;
  this.errors = errors;

  this.initialize = function() {
    $(button).on('click', this.toggleForm);
    // $(form).on('ajax:sucess', this.toggle());
    $(form).on('ajax:error', this.showErrors);

    $("#modal_background").click(function(){
      $(form).hide();
      $(this).hide();
      $(errors).html("");
    });
  };   

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
var loginModal = new Modal("#login_button", "#login_form", "#login_errors");
var addStudentModal = new Modal("#add_student_button", "#add_student_form", "#add_student_errors");
var scheduleTextModal = new Modal("#schedule_text_button", "#schedule_text_form", "#schedule_text_errors");
var sendTextModal = new Modal("#new_text_button", "#new_text_form", "#new_text_errors");

$(document).ready(function(){
  joinModal.initialize();
  loginModal.initialize();
  scheduleTextModal.initialize();
  addStudentModal.initialize();
  sendTextModal.initialize();

  $('form').on('click', ".add_fields", function(e){
    e.preventDefault;
    time = new Date().getTime();
    regex = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regex, time));
  })

});
