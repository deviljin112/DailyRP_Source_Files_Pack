$(document).ready(function(){
  $('select').formSelect();

  // Date of birth picker
  $('#dateofbirth').val('1990-01-01');
  $('.datepicker').datepicker({
    defaultDate : new Date(1990, 0, 1),
    setDefaultDate : true,
    yearRange: 100,
    format : 'yyyy-mm-dd',
    i18n : {
      cancel: 'Anuluj',
      done: 'OK',
      clear: 'Wyczysc',
      months: [ 'Styczen', 'Luty', 'Marzec', 'Kwiecien', 'Maj', 'Czerwiec', 'Lipiec', 'Sierpien', 'Wrzesien', 'Pazdziernik', 'Listopad', 'Grudzien' ],
      monthsShort: [ 'Sty', 'Lut', 'Mar', 'Kwi', 'Maj', 'Cze', 'Lip', 'Sie', 'Wrz', 'Paz', 'Lis', 'Gru' ],
      weekdays: [ 'Niedziela', 'Poniedzialek', 'Wtorek', 'Sroda', 'Czwartek', 'Piatek', 'Sobota' ],
      weekdaysShort: [ 'Nie', 'Pon', 'Wt', 'Sr', 'Czw', 'Pia', 'Sob' ],
      weekdaysLetter: [ 'N', 'Po', 'W', 'Sr', 'C', 'Pi', 'So' ],
    },
  });

  // LUA event listener
  window.addEventListener('message', function(event) {
    if (event.data.action == 'open') {
      $('#wrapper').show();
    } else if (event.data.action == 'close') {
      $('#wrapper').hide();
    }
  });

  // Register button
  $('#register').click(function() {
    if ($('#lastname').val() != '' && $('#firstname').val() != '' && $('#dateofbirth').val() != '' && $('#sex select').val() != null && $('#height').val() != '') {
      if ($('#height').val().length > 1 && $('#dateofbirth').val().length == 10) {
        var dob = $('#dateofbirth').val();

        $.post('http://jsfour-register/register', JSON.stringify({
          firstname: $("#firstname").val(),
          lastname: $("#lastname").val(),
          dateofbirth: $("#dateofbirth").val(),
          sex: $("#sex select").val(),
          height: $("#height").val()
        }));
      }
    }
  });

  // Disable space on the input
  $("form").on({
	  keydown: function(e) {
	    if (e.which === 32)
	      return false;
	  },
	});

  // Disable form submit
  $("form").submit(function() {
		return false;
	});
});
