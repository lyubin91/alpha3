<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>race.jsp</title>
<style type="text/css">
#surface {
	border-collapse: collapse;
 	font-family: fantasy;
	font-size: 1.5em;
	background-color: red;
	background-image: url("/img/BackgroundFront.png"), url("/img/BackgroundBack.png");
	background-size: 100%; 
}

#surface td {
	opacity: 0.7;
}

#startBtn {
	padding: 5px 20px 5px 20px;
}
</style>
<script type="text/javascript">

function race(alpha) {
	console.log("race()..." + alpha);
	let cnt = 0;
	let speed = Math.random()*1000 + 10;
	let direction = 0; // 0: right, 1: down, 2:left, 3:up
	let goal = 0;
	
	alpha.line = 7;
	alpha.column = 1;
	
	let td = surface.rows[alpha.line-1].cells[alpha.column-1]
	td.style.color = alpha.fg;
	td.style.background = alpha.bg;
	td.innerText = alpha.ch;
	
	setTimeout(function move() {
		console.log(cnt++, speed)

		let td = surface.rows[alpha.line-1].cells[alpha.column-1]
		td.style.color = 'black';
		td.style.background = 'black';
	
		if (direction==0) {
			alpha.column++;
		}
		else if (direction==1) {
			alpha.line++;
			alpha.column--;
			alpha.column--;
			alpha.column--;
		}
		else if (direction==2) {
			alpha.line--;
			alpha.column++;
		}
		else if(direction==3) {
			alpha.line++;
			alpha.column++;
		}
		else if(direction==4) {
			alpha.line--;
			alpha.column--;
			alpha.column--;
			alpha.column--;
		}
		
		td = surface.rows[alpha.line-1].cells[alpha.column-1];
		td.style.color = alpha.fg;
		td.style.background = alpha.bg;
		td.innerText = alpha.ch;
		
		if (cnt == 39 && direction==0) {
			
			direction++;
			cnt = 0;
		}
		else if (cnt == 13 && direction==1) {
			
			direction++;
			cnt = 0;
		}
		else if (cnt == 19 && direction==2) {
			
			direction++;
			cnt = 0;
		}
		else if (cnt == 20 && direction==3) {
			
			direction++;
			cnt = 0;
		}
		else if (cnt==13 && direction==4) {
			direction;
			cnt = 0;
			
		}
		
	setTimeout(move, 30);
	}, speed);
	
	
}

window.onload = function() {
	
	startBtn.onclick = e => {
		fetch('/alpha/data')
		.then(response => response.json())
		.then(alpha => {
			race(alpha);
		});
	}
	
}
</script>
</head>
<body>
<h1 style="color: white;">Ajax => fetch 활용</h1>
<hr>
<button id="startBtn">Start</button>
<hr>
<table id="surface" onmousedown="event.preventDefault();" oncontextmenu="event.preventDefault();">
	<tbody>
	<c:forEach var="i" begin="0" end="${surface.size()-1}" >
		<tr>
		<c:forEach var="j" begin="0" end="${surface.get(i).size()-1}">
			<c:set var="alpha" value="${surface[i][j]}"/>
			<td style="color: black; background: black;">${alpha.ch}</td>
		</c:forEach>
		</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>