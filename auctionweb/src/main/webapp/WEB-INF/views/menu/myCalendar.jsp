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
		<link href='${path}/resources/js/lib/cupertino/jquery-ui.min.css' rel='stylesheet'  />
 		<link href='${path}/resources/css/fullcalendar.min.css' rel='stylesheet' />
		<link href='${path}/resources/css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
		<script src='${path}/resources/js/lib/moment.min.js'></script>
		<script src='${path}/resources/js/lib/jquery.min.js'></script>
		<script src='${path}/resources/js/fullcalendar.min.js'></script>	

		<script type="text/javascript">
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
			 format = format.replace("M", month);
			 format = (day < 10) ? format.replace("dd", "0" + day) : format.replace("dd", day);
			 format = format.replace("d", day);
			 format = (hour < 10) ? format.replace("HH", "0" + hour) : format.replace("HH", hour);
			 format = (minute < 10) ? format.replace("mm", "0" + minute) : format.replace("mm", minute);
			 format = (second < 10) ? format.replace("ss", "0" + second) : format.replace("ss", second);
			 return format;
		}	
		/*
			var dteinfo= [
				{
					title: '일정 변경 !!',
					start: '2017-05-01'
				},
				{
					title: 'Long Event',
					start: '2017-05-07',
					end: '2017-05-10'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2017-05-09T16:00:00'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2017-05-16T16:00:00'
				},
				{
					title: 'Conference',
					start: '2017-05-11',
					end: '2017-05-13'
				},
				{
					title: 'Meeting',
					start: '2017-05-12T10:30:00',
					end: '2017-05-12T12:30:00'
				},
				{
					title: 'Lunch',
					start: '2017-05-12T12:00:00'
				},
				{
					title: 'Meeting',
					start: '2017-05-12T14:30:00'
				},
				{
					title: 'Happy Hour',
					start: '2017-05-12T17:30:00'
				},
				{
					title: 'Dinner',
					start: '2017-05-12T20:00:00'
				},
				{
					title: 'Birthday Party',
					start: '2017-05-13T07:00:00'
				},
				{
					title: 'Click for Google',
					url: 'http://google.com/',
					start: '2017-05-28'
				}
			];
		*/
			$(document).ready(function(){
				
				$.ajax({
					type:"post",
					url:"calendar.do?method=list",
					dataType:"json",
					success:function( data ){
						dteinfo= data.list;
						alert(dteinfo.length);
						alert(JSON.stringify(dteinfo));
						loadView();
					}
				});
				
				loadView();
				
			});
			function loadView(){
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
					select: function(start, end) {
						var title = prompt('제목 등록하세요!!:');
						//alert(start+":"+end);
						var d1=new Date(start);
						d1.setHours(d1.getHours()-9);
						var d2=new Date(end);
						d2.setHours(d2.getHours()-9);
						//alert(d1.toFormatString("yyyy-MM-ddTHH:mm:ss"));
						//alert(d2.toFormatString("yyyy-MM-ddTHH:mm:ss"));
						var eventData;
						if (title) {
							insert(d1.toFormatString("yyyy-MM-ddTHH:mm:ss"),
									d2.toFormatString("yyyy-MM-ddTHH:mm:ss"),title,"");							
							eventData = {
								title: title,
								start: start,
								end: end
							};
							$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
						}
						$('#calendar').fullCalendar('unselect');
					},
					editable: true,
					eventLimit: true, // allow "more" link when too many events
					// id, title, start, end, url
					events:dteinfo 
				});				
				
				
			}		
			function insert(start,end,title,url){
				var sndDate="start="+start+"&end="+end+"&title="+title+"&url="+url;
				//alert(sndDate);
				$.ajax({
					type:"POST",
					url:"calendar.do?method=insert",
					data:sndDate,
					dataType:"json",
					success:function(data){
						//alert(data.list.length);
						dteinfo=data.list;
						loadView();
					}
				});		
			}

		</script>
	</head>
	<body>
		<div ><h3>왜 안보이나.. 흠..</h3></div>
		<div id='calendar'></div>
	</body>
</html>