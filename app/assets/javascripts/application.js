// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.purr
//= require best_in_place
//= require jquery.rest
//= require fullcalendar
//= require bootstrap
//= require_tree .
$('document').ready(function() {
  
  // display validation errors for the "request invitation" form
  if ($('.alert-error').length > 0) {
    $("#request-invite").modal('toggle');
  }
  
  // use AJAX to submit the "request invitation" form
  $('#invitation_button').live('click', function() {
    var email = $('form #user_email').val();
    if($('form #user_opt_in').is(':checked'))
        var opt_in = true;
    else
        var opt_in = false;
    var dataString = 'user[email]='+ email + '&user[opt_in]=' + opt_in;
    $.ajax({
      type: "POST",
      url: "/users",
      data: dataString,
      success: function(data) {
        $('#request-invite').html(data);
        loadSocial();
      }
    });
    return false;
  });
  
})

// load social sharing scripts if the page includes a Twitter "share" button
function loadSocial() {
    
    //Twitter
    if (typeof (twttr) != 'undefined') {
      twttr.widgets.load();
    } else {
      $.getScript('http://platform.twitter.com/widgets.js');
    }

    //Facebook
    if (typeof (FB) != 'undefined') {
      FB.init({ status: true, cookie: true, xfbml: true });
    } else {
      $.getScript("http://connect.facebook.net/en_US/all.js#xfbml=1", function () {
        FB.init({ status: true, cookie: true, xfbml: true });
      });
    }

    //Google+
    if (typeof (gapi) != 'undefined') {
      $(".g-plusone").each(function () {
        gapi.plusone.render($(this).get(0));
      });
    } else {
      $.getScript('https://apis.google.com/js/plusone.js');
    }
}

if (history && history.pushState) {
  $(function() {
    $("#users th a, #users .pagination a").live("click", function(e) {
      $.getScript(this.href);
      history.pushState(null, document.title, this.href);
      e.preventDefault();
    });
    $("#users_search input").keyup(function() {
      $.get($("#users_search").attr("action"), $("#users_search").serialize(), null, "script");
      history.replaceState(null, document.title, $("#users_search").attr("action") + "?" + $("#users_search").serialize());
    });
    $(window).bind("popstate", function() {
      $.getScript(location.href);
    });
  });
}
$('.best_in_place').best_in_place()

$.datepicker.setDefaults({
   showOn: 'both',
   dateFormat: "dd-mm-yy",
   showOtherMonths: true,
   buttonImageOnly: true,
   changeMonth: true,
   changeYear: true,
   gotoCurrent: true,
   currentText: "Now",
   buttonImage: '/assets/calendar.png',
   buttonText: 'Calendar' });

$(function() {
  $("#meeting_meeting_date").datetimepicker({ dateFormat: "dd-mm-yy", ampm: true, yearRange: "-00:+01", defaultDate: +4});
});

$(function() {
  $("#meeting_issue_date").datepicker({ dateFormat: "dd-mm-yy", yearRange: "-00:+01", appendText: "(dd-mm-yy)" });
});

$(function() {
  $("#staff_joining_date").datepicker({ dateFormat: "dd-mm-yy", yearRange: "-30:+00"  });
});

$(function() {
  $("#user_date_of_birth").datepicker({ dateFormat: "dd-mm-yy", yearRange: "-99:+00",  });
});

$(function() {
  $( "#draggable" ).draggable();
});

$(function() {
	$( "#event_starts_at" ).datetimepicker({
		changeMonth: true,
		gotoCurrent: true,
		showCurrentAtPos: 0,
		numberOfMonths: +2,
		onSelect: function( selectedDate ) {
			$( "#event_ends_at" ).datetimepicker( "option", "minDate", selectedDate );
		}
	});
	$( "#event_ends_at" ).datetimepicker({
		defaultDate: "+1",
		changeMonth: true,
		numberOfMonths: 2,
		onSelect: function( selectedDate ) {
			$( "#event_starts_at" ).datetimepicker( "option", "maxDate", selectedDate );
		}
	});
});

$(function() {
  $("#bill_header_bill_date").datepicker({ dateFormat: "dd-mm-yy", yearRange: "-00:+01", appendText: "(dd-mm-yy)" });
});

$(function() {
	$( "#bill_header_from_date" ).datepicker({
		changeMonth: false,
		gotoCurrent: true,
		showCurrentAtPos: 0,
		numberOfMonths: +1,
		onSelect: function( selectedDate ) {
			$( "#bill_header_to_date" ).datepicker( "option", "minDate", selectedDate );
		}
	});
	$( "#bill_header_to_date" ).datepicker({
		defaultDate: "+1",
		changeMonth: true,
		numberOfMonths: 2,
		onSelect: function( selectedDate ) {
			$( "#bill_header_from_date" ).datepicker( "option", "maxDate", selectedDate );
		}
	});
});
