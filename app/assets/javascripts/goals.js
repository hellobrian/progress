// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$('.proof').click(function(){
  $(this).find('.simple_overlay').fadeToggle();
});

$('div#proof').hide(300);

// $('#new_goal.custom').on("ajax:success", function(e, data, status, xhr){
  
// })

$('a.details').on('click', function(){
  $(this).parent().find('div#proof').slideToggle(300);
  return false;
});

