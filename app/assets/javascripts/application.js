//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require popper
//= require bootstrap
//= require font_awesome5
//= require toastr

let sidebar = false;
$(document).on('turbolinks:load', function() {
	if(sidebar) {
		$('#sidebar').toggleClass('active');
	}

	$('#sidebarCollapse').on('click', function () {
		$('#sidebar').toggleClass('active');
		if(sidebar) {
			sidebar = false;
		} else {
			sidebar = true;
		}
	});
});
