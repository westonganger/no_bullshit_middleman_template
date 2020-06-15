//= require zepto
//= require turbolinks

$(document).on('turbolinks:visit', function(){
  window.loaderTimer = setTimeout(function(){
    $('#loader').show();
  }, 800);
});

$(document).on('ready turbolinks:load',  function(){
  clearTimeout(window.loaderTimer);
  $('#loader').hide();

  $("a[href^='#'], a[href^='/#'], a[href^='tel'], a[href^='mailto']").attr('data-turbolinks','false');

  //disable autocomplete for all forms in application
  $('form').prop('autocomplete','off');
});
