<html>
		<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
		<script type="text/javascript">
			function testText(){
				$("ul li:odd").css("background-color","red");
			}			  
	  	</script>	
	</head>
	<body>
		<ul>
			<li>-----1----</li>
			<li>-----2----</li>
			<li>-----3----</li>
			<li>-----4----</li>
			<li>-----5----</li>
			<li>-----6----</li>
			<li>-----7----</li>
			<li>-----8----</li>
			<li>-----9----</li>
		</ul>
		<input type="button" value="test" onclick="testText();"/>
	</body>
</html>
