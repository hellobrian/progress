// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$('input.ui-date-picker').datepicker();

var datepicker_widgets = $('input.ui-date-picker');

datepicker_widgets.datepicker( 'option', 'changeMonth', true );
datepicker_widgets.datepicker( 'option', 'changeYear', true );
datepicker_widgets.datepicker( 'option', 'yearRange', "-50:+0" );



