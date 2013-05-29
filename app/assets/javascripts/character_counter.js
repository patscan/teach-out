function charCounter(textarea, counter) {
  this.textarea = textarea;
  this.counter = counter;

  this.initialize = function() {
    
    $(textarea).on('keyup', function(){
      var textLength = $(textarea).val().length;
      if (textLength > 160) {
        $(textarea).val($(textarea).val().substr(0, 160));
      } else {
      $(counter).html(160 - textLength + " characters left.");
      }
    })
  };
}

var scheduleTextCounter = new charCounter('#schedule_text_message_content', '#schedule_text_character_counter');
var newTextCounter = new charCounter('#new_text_message_content', '#new_text_character_counter');

$(document).ready(function(){
  scheduleTextCounter.initialize();
  newTextCounter.initialize();
})
