$ ->
	$('.inline-slider').each ->
		$(this).find('ul').jScrollPane
			showArrows: false
			hideFocus: true
			horizontalDragMinWidth: 53
			horizontalDragMaxWidth: 53

	$('.list-numeric').addClass('js')
	$('.list-numeric>li').each (i) ->
		$(this).prepend("<span class='n'>#{i+1}</span>")

