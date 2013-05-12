<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Demo Chat</title>

        <link href="/css/bootstrap.css" rel="stylesheet">

	<style>
		body { 
			padding:20px;
		}
		#console { 
			height: 400px; 
			overflow: auto; 
		}
		.username-msg {color:orange;}
		.connect-msg {color:green;}
		.disconnect-msg {color:red;}
		.send-msg {color:#888}
	</style>


	<script src="js/socket.io/socket.io.js"></script>
        <script src="js/moment.min.js"></script>
        <script src="js/jquery-1.7.2.min.js"></script>
	
	<script>
		
	
	
          var userName = 'user' + Math.floor((Math.random()*1000)+1);

		var socket =  io.connect('http://localhost:9092');

		socket.on('connect', function() {
			output('<span class="connect-msg">Client has connected to the server!</span>');
		});
		
		socket.on('chatevent', function(data) {
			var data2 = data[0]
			output('<span class="username-msg">' + data2.userName + ':</span> ' + data2.message);
		});
		
		socket.on('disconnect', function() {
			output('<span class="disconnect-msg">The client has disconnected!</span>');
		});

                function sendDisconnect() {
                        socket.disconnect();
                }
		
		function sendMessage() {
                        var message = $('#msg').val();
                        $('#msg').val('');
                        socket.emit('chatevent', {userName: userName, message: message});
		}
		
		function output(message) {
                        var currentTime = "<span class='time'>" +  moment().format('HH:mm:ss.SSS') + "</span>";
                        var element = $("<div>" + currentTime + " " + message + "</div>");
			$('#console').prepend(element);
		}
		
	</script>
</head>
<body>
	<h1>Netty-socketio Demo Chat</h1>
	
	<br/>

	<div id="console" class="well">
	</div>

        <form class="well form-inline" onsubmit="return false;">
           <input id="msg" class="input-xlarge" type="text" placeholder="Type something..."/>
           <button type="button" onClick="sendMessage()" class="btn">Send</button>
           <button type="button" onClick="sendDisconnect()" class="btn">Disconnect</button>
        </form>
</body>
</html>