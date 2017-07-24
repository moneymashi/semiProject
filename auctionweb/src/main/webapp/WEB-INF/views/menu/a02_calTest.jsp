<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>justification</title>
		<style type="text/css">
			body {
				margin: 40px 10px;
				padding: 0;
				font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
				font-size: 14px;
			}
		
			#calendar {
				max-width: 900px;
				margin: 0 auto;
			}
		
		
		</style>
		<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
		<link href='${path }/resources/js/lib/cupertino/jquery-ui.min.css' rel='stylesheet'  />
 		<link href='${path}/resources/css/fullcalendar.min.css' rel='stylesheet' />
		<link href='${path}/resources/css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
		<script src='${path}/resources/js/lib/moment.min.js'></script>
		<script src='${path}/resources/js/lib/jquery.min.js'></script>
		<script src='${path}/resources/js/fullcalendar.min.js'></script>

		<script type="text/javascript">
		
/* 	캘린더 적용 테스트중 -Jul 24, 2017 00:25 - JB */		
		
		Date.prototype.toFormatString = function(format) {
			 var year = this.getFullYear();
			 var month = this.getMonth() + 1;
			 var day = this.getDate();
			 var hour = this.getHours();
			 var minute = this.getMinutes();
			 var second = this.getSeconds();
			 if (format == null) format = "yyyy-MM-dd";
			 format = format.replace("yyyy", year);
			 format = (month < 10) ? format.replace("MM", "0" + month) : format.replace("MM", month);
			 format = (day < 10) ? format.replace("dd", "0" + day) : format.replace("dd", day);
			 format = (hour < 10) ? format.replace("HH", "0" + hour) : format.replace("HH", hour);
			 format = (minute < 10) ? format.replace("mm", "0" + minute) : format.replace("mm", minute);
			 format = (second < 10) ? format.replace("ss", "0" + second) : format.replace("ss", second);
			 return format;
		}		
			var dteinfo;
			$(document).ready(function(){
				 $.ajax({
					type:"post",
					url:"${path}/calendar.do?method=list",
					dataType:"json",
					success:function( data ){
						$.each(data.list, function(idx) {
							item= data.list[idx]; 
							
							console.log(item) 
							loadView(item);
						})
					}
				}); 
				
				/*  $('#calendar').fullCalendar({
					theme: true,  // 테마적용.
					header: {
						left: 'prev,next today',
						center: 'title',
						right: 'month,agendaWeek,agendaDay,listMonth'
					},
					defaultDate: new Date(),
					navLinks: true, // can click day/week names to navigate views
					editable: false,
					eventLimit: true, // allow "more" link when too many events
					events: [
						{
							title: 'All Day Event',
							start: '2017-07-01'
						},
						{
							title: 'Long Event',
							start: '2017-07-07',
							end: '2017-07-10'
						},
						{
							title: 'Business Lunch',
							start: '2017-07-03T13:00:00',
							constraint: 'businessHours'
						},
						{
							title: 'Meeting',
							start: '2017-07-13T11:00:00',
							constraint: 'availableForMeeting', // defined below
							color: '#257e4a'
						},
						{
							title: 'Conference',
							start: '2017-07-18',
							end: '2017-07-20'
						},
						{
							title: 'Party',
							start: '2017-07-29T20:00:00'
						},

						// areas where "Meeting" must be dropped
						{
							id: 'availableForMeeting',
							start: '2017-07-11T10:00:00',
							end: '2017-07-11T16:00:00',
							rendering: 'background'
						},
						{
							id: 'availableForMeeting',
							start: '2017-07-13T10:00:00',
							end: '2017-07-13T16:00:00',
							rendering: 'background'
						},

						// red areas where no events can be dropped
						{
							start: '2017-07-24',
							end: '2017-07-28',
							overlap: false,
							rendering: 'background',
							color: '#ff9f89'
						},
						{
							start: '2017-07-06',
							end: '2017-07-08',
							overlap: false,
							rendering: 'background',
							color: '#ff9f89'
						}
					]
				});  */
				
			});
			function loadView(item){
				$('#calendar').fullCalendar({
					theme: true,  // 테마적용.
					header: {
						left: 'prev,next today',
						center: 'title',
						right: 'month,agendaWeek,agendaDay,listMonth'
					},
					defaultDate: new Date(),
					navLinks: true, // can click day/week names to navigate views
					eventLimit: true, // allow "more" link when too many events
					// id, title, start, end, url
					events: {
						 	title: item.title,
			                start_date : item.start_date,
			                end_date : item.end_date,
			                url : item.url
					}
						/* {
			             
			            url: "${path}/calendar.do?method=list",
			            error: function(e) 
			            {
			                console.log("error" + e);
			                for(i in e){
			                	console.log('?? ' + e[i])
			                }
			            }, 
			            var title01;
			            var start_date01;
			            var end_date01;
			            var url01;
			            
			            success: function(dteinfo) {
			                $.each(dteinfo.list, function(col) {
			                	title01= dteinfo.list[col].title;
			                	start_date01= dteinfo.list[col].start_date;
			                	end_date01= dteinfo.list[col].end_date;
			                	url01= dteinfo.list[col].url; 
				            	console.log(dteinfo.list[col].title);
				            	
			                });
			            title: title01,
		                start_date : start_date01,
		                end_date : end_date01,
		                url : url01
			                
				        } // success END   
				        
				        
				        
				        
				}  //events END				*/
				
				}); // fullCalendar END
			}// function END				

			
	/*  		function loadView(){
				$('#calendar').fullCalendar({
					header: {
						left: 'prev,next today',
						center: 'title',
						right: 'month,agendaWeek,agendaDay'
					},
					defaultDate: '2017-06-29',
					navLinks: true, // can click day/week names to navigate views
					selectable: true,
					selectHelper: true,
					editable: true,
					eventLimit: true, // allow "more" link when too many events
					// id, title, start, end, url
					events:dteinfo 
				});				
				
				
			}		 */
			
			
			
		</script>
	</head>
	<body>
		<div ><h3>왜 안보이나.. 흠.224.</h3></div>
		<div id='calendar'></div>
	</body>
</html>