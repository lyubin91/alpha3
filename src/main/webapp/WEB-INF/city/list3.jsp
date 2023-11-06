<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list3.jsp</title>
<script type="text/javascript">
window.onload = function() {
	population.oninput = function(e) {
		let value = parseInt(e.target.value);
		pop_value.innerText = value.toLocaleString();
	}
	
	pop_value.innerText = parseInt(population.value).toLocaleString();
	
}
</script>
</head>
<body>
<h1 style="color: white;">City List</h1>
<hr>
<form action="/city/list">
<fieldset>
	<legend style="color: white;">code</legend>
	<input name="code" value="${param.code}" type="search" list="codes">
	<datalist id="codes">
	<c:forEach var="c" items="${codes}">
		<option value="${c.code}">[${c.code}] ${c.name}</option>
	</c:forEach>
	</datalist>
</fieldset>
<fieldset>
	<legend style="color: white;">population</legend>
	<input type="range" min="0" max="10000000" step="100000" name="population" id="population" value="${empty param.population ? 0 : param.population}">
	<label style="color: white;"><span id="pop_value"></span>이상</label>
</fieldset>
<input type="submit" value="도시검색">
</form>
<hr>
<table border="1" style="color: white;">
	<thead>
		<tr>
			<th>no</th>
			<th>id</th>
			<th>name</th>
			<th>countryCode</th>
			<th>district</th>
			<th>population</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="city" items="${list}" varStatus="status">
		<tr>
			<td>${status.count}</td>
			<td>${city.id}</td>
			<td>${city.name}</td>
			<td>${city.countryCode}</td>
			<td>${city.district}</td>
			<td align="right"><fmt:formatNumber pattern="###,###,###,###" value="${city.population}"/></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>