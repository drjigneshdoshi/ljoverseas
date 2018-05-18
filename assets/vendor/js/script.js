
function gridView(element,y) {
	var y1 = document.getElementById(y);    
	y1.style.display = 'none';
	$(element).fadeIn( 1200, function() {
	});				 	
}
function tableView(element,x) {
	var x1 = document.getElementById(x);
	x1.style.display = 'none';
    $(element).fadeIn( 1200, function() {
	});
}

function enableSelection(element){
	$(element).prop( "disabled", false );
}
$(function(){
    $("#upload_link").on('click', function(e){
        e.preventDefault();
        $("#upload:hidden").trigger('click');
    });
    $("#upload_link2").on('click', function(e){
        e.preventDefault();
        $("#upload2:hidden").trigger('click');
    });
});