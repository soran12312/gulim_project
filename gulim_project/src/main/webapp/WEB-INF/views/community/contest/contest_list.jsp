<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공모전 리스트</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>
	<header>
		<jsp:include page="../../../../header_before.jsp"></jsp:include>
	</header>

	<table class="table table-hover">
	  <thead> 
	    <tr>
	      <th scope="col">NAME</th>
	      <th scope="col">PRICE</th>
	      <th scope="col">DATE</th>
	    </tr>
	  </thead>
	  <tbody>
	    <tr>
	      <th scope="row">Silver</th>
	      <td> 5000 USD</td>
	      <td> 7 DAYS </td>
	   </tr>
	
	    <tr>
	      <th scope="row">Gold</th>
	      <td>10000 usd</td>
	      <td>1 mnt</td>
	    </tr>
	    <tr>
	      <th scope="row">DIMAND</th>
	      <td>30000 usd</td>
	      <td> 2 mnt </td>
	    </tr>
	  </tbody>
	</table>
</body>

<footer>
	<jsp:include page="../../../../footer.jsp"></jsp:include>
</footer>
</html>