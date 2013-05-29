$(document).ready(function(){
  $('form').on('click', '.remove-fields', function(e){
    var self = $(this)
  $(self).prev('input[type=hidden]').val('1');
  $(self).closest('fieldset').slideUp('fast', function(){
    $(self).closest('fieldset').remove();
  })

  e.preventDefault();
 });
});
