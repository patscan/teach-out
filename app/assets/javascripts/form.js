
function checkFields (selector) {
  var acc = 0;
  selector.parent('fieldset').find('input[type="text"]').each(function(index, value){
  acc += $(value).val().length;
});
  return acc
};

$(document).ready(function(){
  $('form').on('click', '.remove-fields', function(e){

    var self = $(this);
    self.last().siblings('[data-command="delete_button"]').val('true');
    self.closest('fieldset').slideUp('fast', function(){
      if (checkFields(self) === 0) {
      self.closest('fieldset').remove();
    }
      else {
       self.closest('fieldset').hide(); 
      }
    });
    e.preventDefault;

  });

  $('form').on('ajax:error', function(event, xhr, status){
    $("#add_student_errors").html($.parseJSON(xhr.responseText).error);
  });
});




