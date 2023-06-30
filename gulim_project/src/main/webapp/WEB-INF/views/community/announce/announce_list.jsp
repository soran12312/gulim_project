<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<!-- Bootstrap core CSS -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<!-- Bootstrap core JS -->
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<!-- Additional CSS Files -->


<style>
  html,
  body {
    height: 100%;
    margin: 0;
    padding: 0;
  }

  body {
    display: flex;
    flex-direction: column;
    justify-content: center;
  }

  .container {
    flex: 1;
  }

  footer {
    position: fixed;
    bottom: 0;
    width: 100%;
  }
</style>

</head>



<body class="d-flex flex-column min-vh-100">
	<header>
		<jsp:include page="../../../../header_before.jsp"></jsp:include>
	</header>

	<div class="container">
		<div class="row">

			<section class="content">
				<!-- <h1>Table Filter</h1> -->
				<div class="col-md-8 col-md-offset-2">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="pull-right">
								<div class="btn-group">
									<button type="button" class="btn btn-success btn-filter"
										data-target="pagado">자유게시판</button>
									<button type="button" class="btn btn-warning btn-filter"
										data-target="pendiente">이벤트게시판</button>
									<button type="button" class="btn btn-danger btn-filter"
										data-target="cancelado">공모전게시판</button>
									<button type="button" class="btn btn-default btn-filter"
										data-target="all">공지사항</button>
								</div>
							</div>
							<div class="table-container d-flex align-items-center justify-content-center">
								<table class="table table-filter">
									<tbody>

										<tr>
											<td></td>
											<th>공지사항</th>
											<th>관리자</th>
										</tr>

										<tr data-status="pagado">

											<td><a href="javascript:;" class="star"> <i
													class="glyphicon glyphicon-star"></i>
											</a></td>
											<td>
												<div class="media">
													<div class="media-body">
														<span class="media-meta pull-right">Febrero 13,
															2016</span>
														<h4 class="title">
															Lorem Impsum <span class="pull-right pagado">(Pagado)</span>
														</h4>
														<p class="summary">Ut enim ad minim veniam, quis
															nostrud exercitation...</p>
													</div>
												</div>
											</td>
										</tr>
										<tr data-status="pendiente">

											<td><a href="javascript:;" class="star"> <i
													class="glyphicon glyphicon-star"></i>
											</a></td>
											<td>
												<div class="media">
													<div class="media-body">
														<span class="media-meta pull-right">Febrero 13,
															2016</span>
														<h4 class="title">
															Lorem Impsum <span class="pull-right pendiente">(Pendiente)</span>
														</h4>
														<p class="summary">Ut enim ad minim veniam, quis
															nostrud exercitation...</p>
													</div>
												</div>
											</td>
										</tr>
										<tr data-status="cancelado">

											<td><a href="javascript:;" class="star"> <i
													class="glyphicon glyphicon-star"></i>
											</a></td>
											<td>
												<div class="media">

													<div class="media-body">
														<span class="media-meta pull-right">Febrero 13,
															2016</span>
														<h4 class="title">
															Lorem Impsum <span class="pull-right cancelado">(Cancelado)</span>
														</h4>
														<p class="summary">Ut enim ad minim veniam, quis
															nostrud exercitation...</p>
													</div>
												</div>
											</td>
										</tr>
										<tr data-status="pagado" class="selected">

											<td><a href="javascript:;" class="star star-checked">
													<i class="glyphicon glyphicon-star"></i>
											</a></td>
											<td>
												<div class="media">

													<div class="media-body">
														<span class="media-meta pull-right">Febrero 13,
															2016</span>
														<h4 class="title">
															Lorem Impsum <span class="pull-right pagado">(Pagado)</span>
														</h4>
														<p class="summary">Ut enim ad minim veniam, quis
															nostrud exercitation...</p>
													</div>
												</div>
											</td>
										</tr>
										<tr data-status="pendiente">

											<td><a href="javascript:;" class="star"> <i
													class="glyphicon glyphicon-star"></i>
											</a></td>
											<td>
												<div class="media">

													<div class="media-body">
														<span class="media-meta pull-right">Febrero 13,
															2016</span>
														<h4 class="title">
															Lorem Impsum <span class="pull-right pendiente">(Pendiente)</span>
														</h4>
														<p class="summary">Ut enim ad minim veniam, quis
															nostrud exercitation...</p>
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</section>

		</div>
	</div>
</body>
<footer>
	<jsp:include page="../../../../footer.jsp"></jsp:include>
</footer>
</html>