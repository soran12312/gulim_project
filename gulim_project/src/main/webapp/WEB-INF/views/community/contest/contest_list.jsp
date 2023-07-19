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



<style>
.image-grid-cover {
    width: 100%;
    background-size: cover;
    min-height: 180px;
    position: relative;
    margin-bottom: 30px;
    text-shadow: rgba(0,0,0,.8) 0 1px 0;
    border-radius: 4px;
}
.image-grid-clickbox {
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    display: block;
    width: 100%;
    height: 100%;
    z-index: 20;
    background: rgba(0,0,0,.45);
}
.cover-wrapper {
    font-size: 18px;
    text-align: center;
    display: block;
    color: #fff;
    text-shadow: rgba(0,0,0,.8) 0 1px 0;
    z-index: 21;
    position: relative;
    top: 80px;
}
a, a:focus, a:hover {
    text-decoration: none;
    outline: 0;
}



html,
body {
    height: 100%;
}

body {
    display: flex;
    flex-direction: column;
}

.container {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
}

footer {
    margin-top: auto;
}



</style>

</head>


	<header>
		<jsp:include page="../../../../header_after.jsp"></jsp:include>
	</header>
	


	<div class="container">
		<div class="row">
				<div class="col-12 col-sm-6 col-md-4 image-grid-item">
					<div style="background-image: url(https://cdn.beam.usnews.com/dims4/USNEWS/59f1d50/2147483647/thumbnail/970x647/quality/90/?url=http%3A%2F%2Fcom-usnews-beam-media.s3.amazonaws.com%2F28%2F21%2F37a23a5f40048594e7e1209a842d%2F150427-networking-stock.jpg	);" class="image-grid-cover">
						<a href="#" class="image-grid-clickbox"></a>
						<a href="#" class="cover-wrapper">Etkinlikler</a>
					</div>
				</div>
				<div class="col-12 col-sm-6 col-md-4 image-grid-item">
					<div style="background-image: url(https://cdn.bolgegundem.com/d/news/333778.jpg	);" class="entry-cover image-grid-cover has-image">
						<a href="#" class="image-grid-clickbox"></a>
						<a href="#" class="cover-wrapper">Düğünler</a>
					</div>
				</div>
				<div class="col-12 col-sm-6 col-md-4 image-grid-item">
					<div style="background-image: url(https://www.trthaber.com/resimler/218000/218798.jpg	);" class="entry-cover image-grid-cover has-image">
						<a href="#" class="image-grid-clickbox"></a>
						<a href="#" class="cover-wrapper">Gezi / Tur</a>
					</div>
				</div>
				<div class="col-12 col-sm-6 col-md-4 image-grid-item">
					<div style="background-image: url(http://www.technocrazed.com/wp-content/uploads/2015/12/Airplane-wallpaper-112-640x360.jpg);" class="entry-cover image-grid-cover has-image">
						<a href="#" class="image-grid-clickbox"></a>
						<a href="#" class="cover-wrapper">Havalimanı Transferi</a>
					</div>
				</div>
				<div class="col-12 col-sm-6 col-md-4 image-grid-item">
					<div style="background-image: url(https://img-s2.onedio.com/id-5738f74cb6efafb314a46f07/rev-0/w-600/h-300/s-d707c9ec5af8f66dc5506a2796ac14fce1fbb35b.jpg	);" class="entry-cover image-grid-cover has-image">
						<a href="#" class="image-grid-clickbox"></a>
						<a href="#" class="cover-wrapper">Günlük Seyahat</a>
					</div>
				</div>
				<div class="col-12 col-sm-6 col-md-4 image-grid-item">
					<div style="background-image: url(https://image.stern.de/8205460/16x9-940-529/3c6ed305ea6e6f63c0454fda4dbc5d02/hx/pic-grand-calfornia-2018--9-.jpg	);" class="entry-cover image-grid-cover has-image">
						<a href="#" class="image-grid-clickbox"></a>
						<a href="#" class="cover-wrapper">Karavan Kiralama </a>
					</div>
				</div>
			</div>
		</div>

<footer>
	<jsp:include page="../../../../footer.jsp"></jsp:include>
</footer>
</html>