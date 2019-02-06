$(function(){
	window.onload = function(e){
		window.addEventListener('message', function(event){

			var item = event.data;
			if (item !== undefined && item.type === "scroll") {

				if (item.display === true) {
					$('#scroll').delay(100).fadeIn( "slow" );
				} else if (item.display === false) {
					$('#scroll').fadeOut( "slow" );
				}
			}