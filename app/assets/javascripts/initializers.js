document.addEventListener('turbolinks:load', function() {

  //Initialize timepickers
  $('.timepicker').pickatime();

  //Initialize datepickers
  $('.datepicker').pickadate();

  //Initialize materialize selects
  $('select').material_select();

});
