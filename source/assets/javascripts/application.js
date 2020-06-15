/* SETUP */
global.$ = global.jQuery = require('jquery');

// https://github.com/VodkaBears/Vide/issues/183#issuecomment-365603849
jQuery.fn.load = function(callback) { $(window).on("load", callback) };

require("@rails/ujs").start();

var Turbolinks = require("turbolinks");
Turbolinks.start();

$(document).ready(function(){
  $(document).trigger('turbolinks:load');
});
/* END SETUP */

require("./google_analytics");
require("./search");
require("./vendor/jquery.tablesorter")

$(document).on('turbolinks:load',  function(){
  /* Vertical Autosizing textarea tags */
  var textarea = $("textarea:not(.no-autosize)");
  textarea.not('.more-rows').prop('rows','1');
  autosize(textarea);

  $("a[href^='#'], a[href^='/#'], a[href^='tel'], a[href^='mailto']").attr('data-turbolinks','false');

  $('form').prop('autocomplete','off');

  $('table.table-sortable').tablesorter();
});

$(document).on('click','a[href^="#"]', function(event){
  var target = $($(this).attr('href'));

  if(target.length){
    event.preventDefault();
    $('html, body').animate({scrollTop: target.offset().top-25}, {duration: 1000, easing: ''});
  }

  $("#navbar-collapse").collapse('hide');
});

$(document).on("click", "a.slow, button.slow", function(){
  $("#loader").show();
});

$(document).on('submit', "form[enctype='multipart/form-data'], form.slow", function(){
  $("#loader").show();
});

/* Disabled because Turbolinks is so fast it doesnt require a loader */
/*
$(window).on('beforeunload', function(){
  if(!window.skipLoader){
    $('#loader').show();
  }
});
*/

/* If an input field has a pattern attribute, we expect it to contain a regular expression */
/* After a key is pressed, if the whole field does not match the regexp then we reject the last input key */
$(document).on('keydown', 'input[pattern]', function(e){
  var input = $(this);
  var oldVal = input.val();
  var regex = new RegExp(input.attr('pattern'), 'g');

  setTimeout(function(){
    var newVal = input.val();
    if(!regex.test(newVal)){
      input.val(oldVal); 
    }
  }, 0);
});

/* If a number input field has a maxlength attribute we limit the length of the input to the specified number of characters */
$(document).on('keydown', 'input[type=number][maxlength]', function(e){
  var input = $(this);
  var oldVal = input.val();
  var maxlength = Number(input.attr('maxlength'));

  setTimeout(function(){
    var newVal = input.val();
    if(newVal.length > maxlength){
      input.val(oldVal); 
    }
  }, 0);
});

/* Bootstrap AJAX Modals */
var active_modal = null;
$(document).on('click','a[data-toggle=ajax_modal]', function(e) {
  e.preventDefault();
  //$('body').modalmanager('loading');
  $('#loader').addClass('withmodal').show();
  if (active_modal) {
    active_modal.modal('hide');
    active_modal = null;
  }
  var target = $(this).attr('data-target');
  var width = $(this).attr('data-width');

  var url = $(this).attr('href');
  if ($(target).length > 0) {
    $(target).remove();
  }
  var $modal = $('<div/>', {
    id: target.split("#").join(""),
    // 'class': 'modal hide fade',
    'class': 'modal hide',
    data: {width: width, backdrop: 'static'}
  }).appendTo('body');;
  $modal.load(url, function(){
    $modal.modal('show');
    $('#loader').removeClass('withmodal').hide();
  });
  active_modal = $modal;
});

$('body').on('hide', '.modal', function(){
  active_modal = null;
});

$('a[data-toggle=modal]').on('click', function(e){
  var target = $(this).attr('data-target');
  var url = $(this).attr('href');
  $(target).load(url);
});
/* END bootstrap AJAX modals */
