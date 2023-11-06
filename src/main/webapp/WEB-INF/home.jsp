<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home.jsp</title>
<link rel="icon" type="image/png" href="/media/favicon.png"/>
<link rel="stylesheet" href="/css/cube.css">
<style type="text/css">



.menu {
	display: flex;
	list-style: none;
	align-items: flex-start;
	
	
	position: fixed;
	width: 100%;
	top: -16px;
	left: -10px;
 	background: white; 
	height: 100px;
/* 	border-bottom: 3px solid black; */
}

.menu-item {
/* 	min-width: 150px; */
	margin-top: 20px;
	opacity: 0.75;
	width: 240px;
	flex-shrink: 0;
	background: black;
	color: white;
	text-align: center;
	border: 1px solid gray;
}

.menu-item:hover > .menu-title {
	text-shadow: 10px 10px 5px white;
	color: white;
}

.menu-item:hover > .sub-menu {
	max-height: 300px;
	transition: max-height 1s;
}

.menu-item:nth-last-child(1) {
	margin-right: 30px;
}
.menu-item:nth-last-child(2) {
	margin-left: auto;
}

.menu-title {
	padding: 10px;
	font-size: 15pt;
}

.sub-menu {
	max-height: 0px;
	overflow: hidden;
	list-style: none;
	padding-left: 0px;
}

.sub-menu-item {

}

.sub-menu-item > a {
	display: block;
	padding: 10px;
	font-size: 12pt;
	text-decoration: none;
	color: white;
}

.menu-title > a {
	text-decoration: none;
	color: white;
}

.sub-menu-item:hover > a {
	background: #D8D8D8;
	color: black;
	text-shadow: 10px 10px 5px black;
}

iframe {
	margin-top: 100px;
}

body {
	background-size: cover;
}


</style>
<link rel="stylesheet" href="/css/style.css">
<script type="text/javascript" src="/webjars/jquery/jquery.js"></script>
<script type="text/javascript"> 
function resize() {
	let iframe = document.querySelector('iframe');
	iframe.style.height = getComputedStyle(iframe.contentDocument.documentElement).height;
}

window.onload = function() {
let star = document.querySelector('#star')
let star1 = document.querySelector('#star1')
let star2 = document.querySelector('#star2')
let star3 = document.querySelector('#star3')

setInterval(function() {
	star.style.top = parseInt(Math.random()*500) + 'px';
	star.style.left = parseInt(Math.random()*1700 + 10) + 'px';
  
}, 1500);
setInterval(function() {
	star1.style.top = parseInt(Math.random()*500) + 'px';
	star1.style.left = parseInt(Math.random()*1700 + 10) + 'px';
}, 1700);
setInterval(function() {
	star2.style.top = parseInt(Math.random()*500) + 'px';
	star2.style.left = parseInt(Math.random()*1700 + 10) + 'px';
}, 1600);
setInterval(function() {
	star3.style.top = parseInt(Math.random()*500) + 'px';
	star3.style.left = parseInt(Math.random()*1700 + 10) + 'px';
}, 1800);
}

$(document).ready(function() {
	setInterval(resize, 100);
});
</script>
</head>
<body>
<span class="star" id="star"></span>
<span class="star pink" id="star1"></span>
<span class="star blue" id="star2"></span>
<span class="star yellow" id="star3"></span>
<nav>
<ul class="menu">
	<li style="padding: 0px 20px; margin-top: 20px;">
		<section class="perspective" onclick="http://localhost:8088">
		<article class="cube">
			<div class="base">Base</div>
			<div class="base front">Front</div>
			<div class="base back">Back</div>
			<div class="base left">Left</div>
			<div class="base right">Right</div>
			<div class="base top">Top</div>
			<div class="base bottom">Bottom</div>
			 
		</article>
		</section>
	</li>
	<li class="menu-item">
		<div class="menu-title">Alpha</div>
		<ol class="sub-menu">
			<li class="sub-menu-item"><a target="content" href="/alpha/fill">fill</a></li>
			<li class="sub-menu-item"><a target="content" href="/alpha/cross">cross</a></li>
			<li class="sub-menu-item"><a target="content" href="/alpha/race">race</a></li>
			<li class="sub-menu-item"><a target="content" href="/alpha/zigzag">zigzag</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">Animation</div>
		<ol class="sub-menu">
			<li class="sub-menu-item"><a target="content" href="/ani/fill">fill</a></li>
			<li class="sub-menu-item"><a target="content" href="/ani/cube">cube</a></li>
			<li class="sub-menu-item"><a target="content" href="/ani/placeholder">placeholder</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">React</div>
		<ol class="sub-menu">
			<li class="sub-menu-item"><a target="content" href="/fill.jsp">fill</a></li>
			<li class="sub-menu-item"><a target="content" href="/sort.jsp">sort</a></li>
			<li class="sub-menu-item"><a target="content" href="/move.jsp">move</a></li>
			<li class="sub-menu-item"><a target="content" href="/flow.jsp">flow</a></li>
			<li class="sub-menu-item"><a target="content" href="/ping.jsp">ping</a></li>
			<li class="sub-menu-item"><a target="content" href="/rest/dept">dept</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">Employee</div>
		<ol class="sub-menu">
			<li class="sub-menu-item"><a target="content" href="/dept/list">dept</a></li>
			<li class="sub-menu-item"><a target="content" href="/emp/list">emp</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">City</div>
		<ol class="sub-menu">
			<li class="sub-menu-item"><a target="content" href="/city/list">city</a></li>
			<li class="sub-menu-item"><a target="content" href="/country/list">country</a></li>
		</ol>
	</li>
	<sec:authorize access="isAnonymous()">
	<li class="menu-item">
		<div class="menu-title">
		 <a href="/login">Login</a>
		</div>
	</li>
	<li class="menu-item">
		<div class="menu-title">
		 <a href="/join">Join</a>
		</div>
	</li>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
	<li class="menu-item">
		<div class="menu-title">
		 <a href="/logout">Logout</a>
		</div>
	</li>
	<li class="menu-item">
		<div class="menu-title">
		 <a href="#"><sec:authentication property="name"/></a>
		</div>
	</li>
	</sec:authorize>
</ul>
</nav>
<iframe 
		 name="content" 
		 width="100%"
		 scrolling="no"
		 frameborder='0'
		 sendbox="allow-same-origin"
		 onload="resize()">
iframe 태그를 지원하지 않는 브라우저는 이 글이 보입니다. 
</iframe>



</body>
</html>