// This function is called from Objective-C-land to apply
// the surf information to the HTML template
// +data+ is a hash of key -> value
function loadData(data) {
  $('.data').html('N/A');
  $('.itemList div').remove();
  $('img.image_data').removeAttr('src');
  $('.button').hide();

	// Assume that any data key can be copied into any HTML element with the same ID
	for (var key in data) {
		var value = data[key];
		var value_exists = typeof value == 'undefined' || value == null || value.length == 0;
		var data_value = value_exists ? 'N/A' : value;
		var img_src_value = value;
		$('#' + key).
			filter('.data').html(data_value).end().
			filter('.image_data').attr('src', img_src_value);
	};
	if (typeof data.primaryImage == 'undefined' || data.primaryImage == null) {
	  $('#primaryImage').hide();
	}
	
	for (var i=0; i < data.athleteQA.length; i++) {
    var question = data.athleteQA[i].question;
    var answer   = data.athleteQA[i].answer;
    $('<div class="content"><h3>' + question + '</h3>' 
      + '<p>' + answer + '</p>'
      + '</div>').appendTo($('#athleteQA'));
    
	};

}

function enableButton(elementId, url) {
  $('#' + elementId).show()
  .find('a').attr('href', url);
}
