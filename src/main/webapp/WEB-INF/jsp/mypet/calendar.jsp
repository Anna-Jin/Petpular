<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div id="calendar"></div>

<script>
	$(document).ready(function() {
		
		// full calendar
		var petId = "${pet.pet.id}";
		var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
        	locale: 'ko'
        	, initialView: 'dayGridMonth'
        	, themeSystem: 'bootstrap5'
        	, headerToolbar: {
        		left: 'prev,next',
				center: 'title',
				right: 'today'
			}
        	, events: function(info, successCallback, failureCallback) {
    			$.ajax({
    				type: 'GET'
    				,url: '/calendar/' + petId
    				, dataType: 'json'
    				, success: function(param) {
    					var events = [];
    					console.log(param);
    					console.log(':::::::::::');
    					
    					$.each(param, function(index, data) {
    						events.push(data);
    					}); 
    					console.log(events);
    					successCallback(events);
    				}
    			});
        	}
        });
        calendar.render();
	});
</script>