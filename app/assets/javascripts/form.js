$(document).ready(function(){
  $('form').on('click', '.remove-fields', function(e){
   
    // debugger
    var self = $(this);
    self.last().siblings('[data-command="delete_button"]').val('true');
    self.closest('fieldset').slideUp('fast', function(){
      self.closest('fieldset').hide();
    });
    e.preventDefault;
  });
});
