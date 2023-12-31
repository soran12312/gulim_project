(function($) {
    "use strict"
    
    /************ Start of 연간매출 ************/
    
    // '.ssyTable tbody tr'에 해당하는 모든 테이블 행을 선택합니다.
	var tableRows_ssyTable = document.querySelectorAll('.ssyTable tbody tr');
	var data_year = []; // 년도별 데이터를 저장할 배열을 선언합니다.
	var chart_year;
	
	// 'line_chart_2' ID를 가진 부모 요소를 선택합니다.
	var lineChartParent = document.getElementById('line_chart_2');
	
	// SVG 요소가 존재한다면 제거합니다. 이는 이전 차트가 있을 경우 새 차트를 그리기 위함입니다.
	var svgElement = lineChartParent.querySelector('svg');
	if (svgElement) {
	    lineChartParent.removeChild(svgElement);
	}
	
	// div 요소가 존재한다면 제거합니다. 이전 차트의 일부일 수 있으므로 제거합니다.
	var divElement = lineChartParent.querySelector('div');
	if (divElement) {
	    lineChartParent.removeChild(divElement);
	}
	
	// 테이블의 모든 행에 대해 반복하면서 년도별 데이터를 추출합니다.
	for (var i = 0; i < tableRows_ssyTable.length; i++) {
	    // 각 열에서 필요한 데이터를 추출합니다.
	    var purchase_year = tableRows_ssyTable[i].querySelector('td:nth-child(1)').textContent;
	    var total_book_price = parseInt(tableRows_ssyTable[i].querySelector('td:nth-child(2)').textContent);
	    var total_subscribe_price = parseInt(tableRows_ssyTable[i].querySelector('td:nth-child(3)').textContent);
	    var total_price = parseInt(tableRows_ssyTable[i].querySelector('td:nth-child(4)').textContent);
	
	    // 추출한 데이터를 객체로 구성합니다.
	    var rowData = {
	        purchase_year: purchase_year,
	        total_book_price: total_book_price,
	        total_subscribe_price: total_subscribe_price,
	        total_price: total_price
	    };
	
	    // 구성한 객체를 data_year 배열에 추가합니다.
	    data_year.push(rowData);
	}

	    
	    chart_year = Morris.Area({
	        element: 'line_chart_2',
	        data: data_year,
	        xkey: 'purchase_year',
	        ykeys: ['total_book_price', 'total_subscribe_price', 'total_price'],
	        labels: ['설정집', '구독권', '총'],
	        pointSize: 3,
	        fillOpacity: 0,
	        behaveLikeLine: true,
	        gridLineColor: 'transparent',
	        lineWidth: 3,
	        hideHover: 'auto',
	        resize: true
	    });

    

	// 버튼 클릭 핸들러
	$("#btn_year").on("click", function() {
	    var tableRows_ssyTable = document.querySelectorAll('.ssyTable tbody tr');
	    data_year = [];
	    // SVG 요소를 담고 있는 부모 요소를 가져옵니다.
		var lineChartParent = document.getElementById('line_chart_2');
		// SVG 요소를 찾아서 제거합니다.
		var svgElement = lineChartParent.querySelector('svg');
		if (svgElement) {
		    lineChartParent.removeChild(svgElement);
		}
		var divElement = lineChartParent.querySelector('div');
		if (divElement) {
		    lineChartParent.removeChild(divElement);
		}
	
	    for (var i = 0; i < tableRows_ssyTable.length; i++) {
	        var purchase_year = tableRows_ssyTable[i].querySelector('td:nth-child(1)').textContent;
	        var total_book_price = parseInt(tableRows_ssyTable[i].querySelector('td:nth-child(2)').textContent);
	        var total_subscribe_price = parseInt(tableRows_ssyTable[i].querySelector('td:nth-child(3)').textContent);
	        var total_price = parseInt(tableRows_ssyTable[i].querySelector('td:nth-child(4)').textContent);
	
	        var rowData = {
	            purchase_year: purchase_year,
	            total_book_price: total_book_price,
	            total_subscribe_price: total_subscribe_price,
	            total_price: total_price
	        };
	
	        data_year.push(rowData);
	    }
	    
	    chart_year = Morris.Area({
	        element: 'line_chart_2',
	        data: data_year,
	        xkey: 'purchase_year',
	        ykeys: ['total_book_price', 'total_subscribe_price', 'total_price'],
	        labels: ['설정집', '구독권', '총'],
	        pointSize: 3,
	        fillOpacity: 0,
	        behaveLikeLine: true,
	        gridLineColor: 'transparent',
	        lineWidth: 3,
	        hideHover: 'auto',
	        resize: true
	    });
	});
	
	$("#btn_year_subscribe").on("click", function () {
	    var tableRows_ssysTable = document.querySelectorAll('.ssysTable tbody tr');
	    data_year = [];
	    chart_year = null;
	
	    // SVG 요소를 담고 있는 부모 요소를 가져옵니다.
	    var lineChartParent = document.getElementById('line_chart_2');
	    // SVG 요소를 찾아서 제거합니다.
	    var svgElement = lineChartParent.querySelector('svg');
	    if (svgElement) {
	        lineChartParent.removeChild(svgElement);
	    }
	    var divElement = lineChartParent.querySelector('div');
	    if (divElement) {
	        lineChartParent.removeChild(divElement);
	    }
	
	    for (var i = 0; i < tableRows_ssysTable.length; i++) {
	        var sub_date = tableRows_ssysTable[i].querySelector('td:nth-child(1)').textContent;
	        var price = parseInt(tableRows_ssysTable[i].querySelector('td:nth-child(2)').textContent);
	        var total_subscribe_price = parseInt(tableRows_ssysTable[i].querySelector('td:nth-child(3)').textContent);
	
	        var rowData = {};
	
	        if (sub_date === '2022') {
	            rowData.sub_date = sub_date;
	            if (price === 5000) {
	                rowData.total_subscribe_price_5000 = total_subscribe_price;
	            } else if (price === 9900) {
	                rowData.total_subscribe_price_9900 = total_subscribe_price;
	            } else if (price === 15000) {
	                rowData.total_subscribe_price_15000 = total_subscribe_price;
	            } else if (price === 29900) {
	                rowData.total_subscribe_price_29900 = total_subscribe_price;
	            } else if (price === 55000) {
	                rowData.total_subscribe_price_55000 = total_subscribe_price;
	            }
	        }
	
	        if (sub_date === '2023') {
	            rowData.sub_date = sub_date;
	            if (price === 5000) {
	                rowData.total_subscribe_price_5000 = total_subscribe_price;
	            } else if (price === 9900) {
	                rowData.total_subscribe_price_9900 = total_subscribe_price;
	            } else if (price === 15000) {
	                rowData.total_subscribe_price_15000 = total_subscribe_price;
	            } else if (price === 29900) {
	                rowData.total_subscribe_price_29900 = total_subscribe_price;
	            } else if (price === 55000) {
	                rowData.total_subscribe_price_55000 = total_subscribe_price;
	            }
	        }
	
	        // 만약 data_year 배열에 rowData의 sub_date와 같은 데이터가 없다면 추가
	        var foundIndex = data_year.findIndex(item => item.sub_date === rowData.sub_date);
	        if (foundIndex === -1) {
	            data_year.push(rowData);
	        } else {
	            // 만약 data_year 배열에 rowData의 sub_date와 같은 데이터가 있다면 해당 데이터에 추가
	            for (var prop in rowData) {
	                if (rowData.hasOwnProperty(prop) && prop !== 'sub_date') {
	                    data_year[foundIndex][prop] = rowData[prop];
	                }
	            }
	        }
	    }
	
	    chart_year = Morris.Area({
	        element: 'line_chart_2',
	        data: data_year,
	        xkey: 'sub_date',
	        ykeys: ['total_subscribe_price_5000', 'total_subscribe_price_9900', 'total_subscribe_price_15000', 'total_subscribe_price_29900', 'total_subscribe_price_55000'],
	        labels: ['일회권', '1개월권', '3개월권', '6개월권', '12개월권'],
	        pointSize: 3,
	        fillOpacity: 0,
	        behaveLikeLine: true,
	        gridLineColor: 'transparent',
	        lineWidth: 3,
	        hideHover: 'auto',
	        resize: true
	    });
	});


	$("#btn_year_book").on("click", function () {
	    var tableRows_ssybTable = document.querySelectorAll('.ssybTable tbody tr');
	    data_year = [];
	    chart_year = null;
	
	    // SVG 요소를 담고 있는 부모 요소를 가져옵니다.
	    var lineChartParent = document.getElementById('line_chart_2');
	    // SVG 요소를 찾아서 제거합니다.
	    var svgElement = lineChartParent.querySelector('svg');
	    if (svgElement) {
	        lineChartParent.removeChild(svgElement);
	    }
	    var divElement = lineChartParent.querySelector('div');
	    if (divElement) {
	        lineChartParent.removeChild(divElement);
	    }
	
	    // book_title들을 저장할 배열을 생성합니다.
	    var bookTitles = [];
	
	    for (var i = 0; i < tableRows_ssybTable.length; i++) {
	        var purchase_date = tableRows_ssybTable[i].querySelector('td:nth-child(1)').textContent;
	        var book_title = tableRows_ssybTable[i].querySelector('td:nth-child(2)').textContent;
	        var total_book_price = parseInt(tableRows_ssybTable[i].querySelector('td:nth-child(3)').textContent);
	
	        var rowData = {};
	
	        // purchase_date가 존재하지 않는 경우 해당 데이터는 건너뜁니다.
	        if (!purchase_date) {
	            continue;
	        }
	
	        rowData.purchase_date = purchase_date;
	
	        // book_title을 동적으로 추가합니다.
	        rowData['total_book_price_' + book_title] = total_book_price;
	
	        // book_title을 bookTitles 배열에 추가합니다.
	        if (!bookTitles.includes(book_title)) {
	            bookTitles.push(book_title);
	        }
	
	        // 만약 data_year 배열에 rowData의 sub_date와 같은 데이터가 없다면 추가
	        var foundIndex = data_year.findIndex(item => item.purchase_date === rowData.purchase_date);
	        if (foundIndex === -1) {
	            data_year.push(rowData);
	        } else {
	            // 만약 data_year 배열에 rowData의 sub_date와 같은 데이터가 있다면 해당 데이터에 추가
	            for (var prop in rowData) {
	                if (rowData.hasOwnProperty(prop) && prop !== 'purchase_date') {
	                    data_year[foundIndex][prop] = rowData[prop];
	                }
	            }
	        }
	    }
	
	    // book_title들을 기준으로 data_year 배열을 정렬합니다.
	    data_year.sort(function(a, b) {
	        var total_price_a = 0;
	        var total_price_b = 0;
	        bookTitles.forEach(function(book_title) {
	            total_price_a += a['total_book_price_' + book_title] || 0;
	            total_price_b += b['total_book_price_' + book_title] || 0;
	        });
	        return total_price_b - total_price_a;
	    });
	
	    chart_year = Morris.Area({
	        element: 'line_chart_2',
	        data: data_year,
	        xkey: 'purchase_date',
	        ykeys: bookTitles.map(title => 'total_book_price_' + title),
	        labels: bookTitles,
	        pointSize: 3,
	        fillOpacity: 0,
	        behaveLikeLine: true,
	        gridLineColor: 'transparent',
	        lineWidth: 3,
	        hideHover: 'auto',
	        resize: true
	    });
	});

		
	// Select 요소와 버튼 요소를 가져옵니다.
	var btnYear = $("#btn_year");
	var btnYearSubscribe = $("#btn_year_subscribe");
	var btnYearBook = $("#btn_year_book");
	var h6TagYear = $(".h6_year");
		
		// Select 요소와 버튼 요소의 변경 이벤트를 감지합니다.
		btnYear.addClass("active");
		updateH6TagYear();
		
		btnYear.on("click", function() {
		  btnYear.addClass("active");
		  btnYearSubscribe.removeClass("active");
		  btnYearBook.removeClass("active");
		  updateH6TagYear();
		});
		btnYearSubscribe.on("click", function() {
		  btnYear.removeClass("active");
		  btnYearSubscribe.addClass("active");
		  btnYearBook.removeClass("active");
		  updateH6TagYear();
		});
		btnYearBook.on("click", function() {
		  btnYear.removeClass("active");
		  btnYearSubscribe.removeClass("active");
		  btnYearBook.addClass("active");
		  updateH6TagYear();
		});

		// h6 태그 업데이트 함수
		function updateH6TagYear() {
		    var selectedButton = getSelectedButton_Year();
		
		    h6TagYear.text(selectedButton + " 연매출");
		}
		
		// 선택된 버튼을 반환하는 함수
		function getSelectedButton_Year() {
		    if (btnYear.hasClass("active")) {
		        return "전체";
		    } else if (btnYearSubscribe.hasClass("active")) {
		        return "구독권";
		    } else if (btnYearBook.hasClass("active")) {
		        return "설정집";
		    } else {
		        return "전체";
		    }
		}
    
    
    /************ End of 연간매출 ************/
    

    /************ Start of 일매출 ************/
    
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); // January is 0!
    var yyyy = today.getFullYear();

    today = yyyy + '-' + mm + '-' + dd;
    $("#selectDay").val(today);
 
 	// 초기화를 빈 배열로 변경
	var data_day = [];
	var purchase_day = $('#selectDay').val();
	console.log(purchase_day);

	$.ajax({
	    // 경로
	    url: "/admin/sales_stats/day",
	    // 전송방식: POST
	    method: "POST",
	    data: {purchase_day: purchase_day},
	    // 성공할 시
	    success: function(response){
			console.log(response);
		    data_day = [];
	        var donughtChartParent = document.getElementById('morris_donught');
		    // SVG 요소를 찾아서 제거합니다.
		    var svgElement = donughtChartParent.querySelector('svg');
		    if (svgElement) {
			    donughtChartParent.removeChild(svgElement);
		    }
	        data_day = [];
	        for (var i = 0; i < response.length; i++) {
					if(response[i].total_book_price){
						data_day.push({
			                label: "\xa0 \xa0 " + "설정집 매출" + " \xa0 \xa0",
			                value: response[i].total_book_price
			            });
			        } 
			        if(response[i].totalscribe_price){
						data_day.push({
			                label: "\xa0 \xa0 " + "구독권 매출" +" \xa0 \xa0",
			                value: response[i].totalscribe_price
			            });
					}
		        }
	        var chart_day = Morris.Donut({
	            element: 'morris_donught',
	            data: data_day,
	            resize: true
	        });
	    },
	    error: function(xhr, status, error){
	        alert('일매출 실패: '+ error);
	        console.log(xhr);
	        console.log(status);
	        console.log(error);
	    }
	});
	
	$("#selectDay").on("change", function() {
		btnQuarter.addClass("active");
		btnQuarterSubscribe.removeClass("active");
		btnQuarterBook.removeClass("active");
		
		purchase_day = $('#selectDay').val();
		$.ajax({
		    // 경로
		    url: "/admin/sales_stats/day",
		    // 전송방식: POST
		    method: "POST",
		    data: {purchase_day: purchase_day},
		    // 성공할 시
		    success: function(response){
				console.log(response);
			    data_day = [];
		        var donughtChartParent = document.getElementById('morris_donught');
			    // SVG 요소를 찾아서 제거합니다.
			    var svgElement = donughtChartParent.querySelector('svg');
			    if (svgElement) {
				    donughtChartParent.removeChild(svgElement);
			    }
		        data_day = [];
		        for (var i = 0; i < response.length; i++) {
					if(response[i].total_book_price){
						data_day.push({
			                label: "\xa0 \xa0 " + "설정집 매출" + " \xa0 \xa0",
			                value: response[i].total_book_price
			            });
			        }
			        if(response[i].totalscribe_price){
						data_day.push({
			                label: "\xa0 \xa0 " + "구독권 매출" +" \xa0 \xa0",
			                value: response[i].totalscribe_price
			            });
					}
		        }
		        var chart_day = Morris.Donut({
		            element: 'morris_donught',
		            data: data_day,
		            resize: true
		        });
		        
		        
		        
		    },
		    error: function(xhr, status, error){
		        alert('일매출 실패: '+ error);
		        console.log(xhr);
		        console.log(status);
		        console.log(error);
		    }
		});
	});
	
	$("#btn_day").on("click", function() {
		purchase_day = $('#selectDay').val();
		$.ajax({
		    // 경로
		    url: "/admin/sales_stats/day",
		    // 전송방식: POST
		    method: "POST",
		    data: {purchase_day: purchase_day},
		    // 성공할 시
		    success: function(response){
		        console.log(response);
		        data_day = [];
		        var donughtChartParent = document.getElementById('morris_donught');
			    // SVG 요소를 찾아서 제거합니다.
			    var svgElement = donughtChartParent.querySelector('svg');
			    if (svgElement) {
			        donughtChartParent.removeChild(svgElement);
			    }
		        data_day = [];
		        for (var i = 0; i < response.length; i++) {
					if(response[i].totalscribe_price){
						data_day.push({
			                label: "\xa0 \xa0 " + "구독권 매출" +" \xa0 \xa0",
			                value: response[i].totalscribe_price
			            });
					}
					if(response[i].total_book_price){
						data_day.push({
			                label: "\xa0 \xa0 " + "설정집 매출" + " \xa0 \xa0",
			                value: response[i].total_book_price
			            });
			        }
		        }
		        var chart_day = Morris.Donut({
		            element: 'morris_donught',
		            data: data_day,
		            resize: true
		        });
		    },
		    error: function(xhr, status, error){
		        alert('월매출 실패: '+ error);
		        console.log(xhr);
		        console.log(status);
		        console.log(error);
		    }
		});
	});
	
	
	$("#btn_day_subscribe").on("click", function() {
		purchase_day = $('#selectDay').val();
		$.ajax({
		    // 경로
		    url: "/admin/sales_stats/day_subs",
		    // 전송방식: POST
		    method: "POST",
		    data: {purchase_day: purchase_day},
		    // 성공할 시
		    success: function(response){
		        console.log(response);
		        data_day = [];
		        var donughtChartParent = document.getElementById('morris_donught');
			    // SVG 요소를 찾아서 제거합니다.
			    var svgElement = donughtChartParent.querySelector('svg');
			    if (svgElement) {
			        donughtChartParent.removeChild(svgElement);
			    }
		        data_day = [];
		        for (var i = 0; i < response.length; i++) {
					if(response[i].price==9900){
						data_day.push({
			                label: "\xa0 \xa0 1개월권 \xa0 \xa0",
			                value: response[i].total_subscribe_price
			            });
					} else if(response[i].price==15000){
						data_day.push({
			                label: "\xa0 \xa0 3개월권 \xa0 \xa0",
			                value: response[i].total_subscribe_price
			            });
					} else if(response[i].price==29900){
						data_day.push({
			                label: "\xa0 \xa0 6개월권 \xa0 \xa0",
			                value: response[i].total_subscribe_price
			            });
					} else if(response[i].price==55000){
						data_day.push({
			                label: "\xa0 \xa0 12개월권 \xa0 \xa0",
			                value: response[i].total_subscribe_price
			            });
					}
		        }
		        var chart_day = Morris.Donut({
		            element: 'morris_donught',
		            data: data_day,
		            resize: true
		        });
		    },
		    error: function(xhr, status, error){
		        alert('월매출 실패: '+ error);
		        console.log(xhr);
		        console.log(status);
		        console.log(error);
		    }
		});
	});
	
	$("#btn_day_book").on("click", function() {
		purchase_day = $('#selectDay').val();
		$.ajax({
		    // 경로
		    url: "/admin/sales_stats/day_book",
		    // 전송방식: POST
		    method: "POST",
		    data: {purchase_day: purchase_day},
		    // 성공할 시
		    success: function(response){
		        console.log(response);
		        data_day = [];
		        var donughtChartParent = document.getElementById('morris_donught');
			    // SVG 요소를 찾아서 제거합니다.
			    var svgElement = donughtChartParent.querySelector('svg');
			    if (svgElement) {
			        donughtChartParent.removeChild(svgElement);
			    }
		        data_day = [];
		        for (var i = 0; i < response.length; i++) {
					data_day.push({
			                label: "\xa0 \xa0 " + response[i].book_title + " \xa0 \xa0",
			                value: response[i].total_book_price
			        });
		        }
		        var chart_day = Morris.Donut({
		            element: 'morris_donught',
		            data: data_day,
		            resize: true
		        });
		    },
		    error: function(xhr, status, error){
		        alert('월매출 실패: '+ error);
		        console.log(xhr);
		        console.log(status);
		        console.log(error);
		    }
		});
	});
	
	
		
		// Select 요소와 버튼 요소를 가져옵니다.
		var selectYearQuarter = $("#selectDay");
		var btnQuarter = $("#btn_day");
		var btnQuarterSubscribe = $("#btn_day_subscribe");
		var btnQuarterBook = $("#btn_day_book");
		var h6TagQuarter = $(".h6_day");
		
		// Select 요소와 버튼 요소의 변경 이벤트를 감지합니다.
		btnQuarter.addClass("active");
		updateH6TagQuarter();
		
		selectYearQuarter.on("change", updateH6TagQuarter);
		btnQuarter.on("click", function() {
		  btnQuarter.addClass("active");
		  btnQuarterSubscribe.removeClass("active");
		  btnQuarterBook.removeClass("active");
		  updateH6TagQuarter();
		});
		btnQuarterSubscribe.on("click", function() {
		  btnQuarter.removeClass("active");
		  btnQuarterSubscribe.addClass("active");
		  btnQuarterBook.removeClass("active");
		  updateH6TagQuarter();
		});
		btnQuarterBook.on("click", function() {
		  btnQuarter.removeClass("active");
		  btnQuarterSubscribe.removeClass("active");
		  btnQuarterBook.addClass("active");
		  updateH6TagQuarter();
		});

		// h6 태그 업데이트 함수
		function updateH6TagQuarter() {
		    var selectedYear = selectYearQuarter.val();
		    var selectedButton = getSelectedButton_Quarter();
		
		    h6TagQuarter.text(selectedYear.substring(0,4) + "년 " + selectedYear.substring(5,7) + "월 " + selectedYear.substring(8, 10) + "일 " + selectedButton + " 매출");
		}
		
		// 선택된 버튼을 반환하는 함수
		function getSelectedButton_Quarter() {
		    if (btnQuarter.hasClass("active")) {
		        return "전체";
		    } else if (btnQuarterSubscribe.hasClass("active")) {
		        return "구독권";
		    } else if (btnQuarterBook.hasClass("active")) {
		        return "설정집";
		    } else {
		        return "전체";
		    }
		}
    /************ End of 일매출 ************/


	/************ Start of 월매출 ************/
	
	var data_month = [];
	var purchase_year_mon = $('#selectYear_month').val();
	
	$.ajax({
	    // 경로
	    url: "/admin/sales_stats/month",
	    // 전송방식: POST
	    method: "POST",
	    data: {purchase_year_mon: purchase_year_mon},
	    // 성공할 시
	    success: function(response){
	        
	        for (var i = 0; i < response.length; i++) {
	            data_month.push({
	                y: response[i].purchase_month + "월",
	                tsp: response[i].totalscribe_price,
	                tbp: response[i].total_book_price
	            });
	        }
	        
	        Morris.Bar({
		        element: 'morris_bar_2',
		        data: data_month,
		        xkey: 'y',
		        ykeys: ['tsp', 'tbp'],
		        labels: ['구독권 매출', '설정집 매출'],
		        stacked: true,
		        gridTextSize: 11,
		        hideHover: 'auto',
		        resize: true
		    });
	        
	    },
	    error: function(xhr, status, error){
	        alert('월매출 실패: '+ error);
	        console.log(xhr);
	        console.log(status);
	        console.log(error);
	    }
	});
	
	$("#selectYear_month").on("change", function() {
		
		purchase_year_mon = $('#selectYear_month').val();
		$.ajax({
		    // 경로
		    url: "/admin/sales_stats/month",
		    // 전송방식: POST
		    method: "POST",
		    data: {purchase_year_mon: purchase_year_mon},
		    // 성공할 시
		    success: function(response){
				var barChartParent = document.getElementById('morris_bar_2');
				// SVG 요소를 찾아서 제거합니다.
				var svgElement = barChartParent.querySelector('svg');
				if (svgElement) {
				    barChartParent.removeChild(svgElement);
				}
				var divElement = barChartParent.querySelector('div');
				if (divElement) {
				    barChartParent.removeChild(divElement);
				}
					
			    console.log(response);
			    data_month = [];
			        
			    for (var i = 0; i < response.length; i++) {
			        data_month.push({
			            y: response[i].purchase_month + "월",
			            tsp: response[i].totalscribe_price,
			            tbp: response[i].total_book_price
			        });
			    }
			        
			    Morris.Bar({
				    element: 'morris_bar_2',
				    data: data_month,
				    xkey: 'y',
				    ykeys: ['tsp', 'tbp'],
				    labels: ['구독권 매출', '설정집 매출'],
				    stacked: true,
				    gridTextSize: 11,
				    hideHover: 'auto',
				    resize: true
				});
		    },
		    error: function(xhr, status, error){
		        alert('월매출 실패: '+ error);
		        console.log(xhr);
		        console.log(status);
		        console.log(error);
		    }
		});
	});
	
	$("#btn_month").on("click", function() {
		$.ajax({
		    // 경로
		    url: "/admin/sales_stats/month",
		    // 전송방식: POST
		    method: "POST",
		    data: {purchase_year_mon: purchase_year_mon},
		    // 성공할 시
		    success: function(response){
				var barChartParent = document.getElementById('morris_bar_2');
				// SVG 요소를 찾아서 제거합니다.
				var svgElement = barChartParent.querySelector('svg');
				if (svgElement) {
				    barChartParent.removeChild(svgElement);
				}
				var divElement = barChartParent.querySelector('div');
				if (divElement) {
				    barChartParent.removeChild(divElement);
				}
					
			    console.log(response);
			    data_month = [];
			        
			    for (var i = 0; i < response.length; i++) {
			        data_month.push({
			            y: response[i].purchase_month + "월",
			            tsp: response[i].totalscribe_price,
			            tbp: response[i].total_book_price
			        });
			    }
			        
			    Morris.Bar({
				    element: 'morris_bar_2',
				    data: data_month,
				    xkey: 'y',
				    ykeys: ['tsp', 'tbp'],
				    labels: ['구독권 매출', '설정집 매출'],
				    stacked: true,
				    gridTextSize: 11,
				    hideHover: 'auto',
				    resize: true
				});
		    },
		    error: function(xhr, status, error){
		        alert('월매출 실패: '+ error);
		        console.log(xhr);
		        console.log(status);
		        console.log(error);
		    }
		});
	});
	
	$("#btn_month_subscribe").on("click", function() {
		$.ajax({
			url: "/admin/sales_stats/month_sub",
			method: "POST",
			data: { purchase_year_mon: purchase_year_mon },
			success: function(response) {
				var barChartParent = document.getElementById('morris_bar_2');
				var svgElement = barChartParent.querySelector('svg');
				if (svgElement) {
					barChartParent.removeChild(svgElement);
				}
				var divElement = barChartParent.querySelector('div');
				if (divElement) {
				    barChartParent.removeChild(divElement);
				}
				
				console.log(response);
				var data_month = []; // data_month 배열 초기화
				
				// 변수를 사용하여 이전 월을 기억
				var prevMonth = null;
				var tempObj = null;
	
				for (var i = 0; i < response.length; i++) {
					if (prevMonth === null || prevMonth !== response[i].purchase_month) {
						// 이전 월과 현재 월이 다르면 새로운 객체를 생성하고 tempObj에 할당
						tempObj = {
							y: response[i].purchase_month + "월",
						};
						data_month.push(tempObj);
					}
	
					// price 값에 따라 total_subscribe_price를 분류하여 추가
					var priceKey = getPriceKey(response[i].price);
					if (priceKey) {
						if (!tempObj[priceKey]) tempObj[priceKey] = 0;
						tempObj[priceKey] += response[i].total_subscribe_price;
					}
	
					// prevMonth를 현재 월로 갱신
					prevMonth = response[i].purchase_month;
				}
	
				Morris.Bar({
					element: 'morris_bar_2',
					data: data_month,
					xkey: 'y',
					ykeys: ['a', 'b', 'c', 'd', 'e'], // 필요에 따라 다른 price에 해당하는 키도 추가 가능
					labels: ['일회권', '1개월권', '3개월권', '6개월권', '12개월권'], // 라벨에 맞게 추가 또는 수정
					stacked: true,
					gridTextSize: 11,
					hideHover: 'auto',
					resize: true
				});
			},
			error: function(xhr, status, error) {
				alert('월매출 실패: ' + error);
				console.log(xhr);
				console.log(status);
				console.log(error);
			}
		});
	});
	
	$("#btn_month_book").on("click", function() {
		$.ajax({
			url: "/admin/sales_stats/month_book",
			method: "POST",
			data: { purchase_year_mon: purchase_year_mon },
			success: function(response) {
				var barChartParent = document.getElementById('morris_bar_2');
				var svgElement = barChartParent.querySelector('svg');
				if (svgElement) {
					barChartParent.removeChild(svgElement);
				}
				var divElement = barChartParent.querySelector('div');
				if (divElement) {
				    barChartParent.removeChild(divElement);
				}
				console.log(response);
				var data_month = []; // data_month 배열 초기화
				
				// 변수를 사용하여 이전 월을 기억
				var prevMonth = null;
				var tempObj = null;
				
				var ykeys = [];
	
				for (var i = 0; i < response.length; i++) {
	                if (prevMonth === null || prevMonth !== response[i].purchase_month) {
					    tempObj = {
					        y: response[i].purchase_month + "월",
					    };
					    data_month.push(tempObj);
					}
					
					// 월별 데이터 객체에 도서별 판매량 추가
					var bookTitleKey = getBookTitleKey(response[i].book_title);
					if (bookTitleKey && ykeys.indexOf(bookTitleKey) === -1) {
					    ykeys.push(bookTitleKey);
					}
					
					if (bookTitleKey) {
					    if (!tempObj[bookTitleKey]) tempObj[bookTitleKey] = 0;
					    tempObj[bookTitleKey] += response[i].total_book_price;
					}

			        
	                prevMonth = response[i].purchase_month;
	            }
	            
	            $('.morris-hover-point').each(function() {
				    if ($(this).text().includes('-')) {
				      $(this).remove();
				    }
				  });

            Morris.Bar({
		        element: 'morris_bar_2',
		        data: data_month,
		        xkey: 'y',
		        ykeys: ykeys,
		        labels: ykeys,
		        stacked: true,
		        gridTextSize: 11,
		        hideHover: 'auto',
		        resize: true
		    });
        },
			error: function(xhr, status, error) {
				alert('월매출 실패: ' + error);
				console.log(xhr);
				console.log(status);
				console.log(error);
			}
		});
	});

	// price 값에 따라 해당하는 키를 반환하는 함수
	function getPriceKey(price) {
		switch (price) {
			case 5000:
				return 'a';
			case 9900:
				return 'b';
			case 15000:
				return 'c';
			case 29900:
				return 'd';
			case 55000:
				return 'e';
			default:
				return null; // 알 수 없는 price 값인 경우 null 반환
		}
	}
	
	// 
	function getBookTitleKey(book_title) {
	    return book_title; // book_title 값을 그대로 반환하여 해당 값이 키로 사용되도록 함
	}

	// Select 요소와 버튼 요소를 가져옵니다.
	var selectYearMonth = $("#selectYear_month");
	var btnMonth = $("#btn_month");
	var btnMonthSubscribe = $("#btn_month_subscribe");
	var btnMonthBook = $("#btn_month_book");
	var h6TagMonth = $(".h6_month");
	
	// Select 요소와 버튼 요소의 변경 이벤트를 감지합니다.
	btnMonth.addClass("active");
	updateH6TagMonthMonth();
	
	selectYearMonth.on("change", function() {
	    btnMonth.addClass("active");
	    btnMonthSubscribe.removeClass("active");
	    btnMonthBook.removeClass("active");
	    updateH6TagMonthMonth();
	});
	
	btnMonth.on("click", function() {
	    btnMonth.addClass("active");
	    btnMonthSubscribe.removeClass("active");
	    btnMonthBook.removeClass("active");
	    updateH6TagMonthMonth();
	});
	
	btnMonthSubscribe.on("click", function() {
	    btnMonth.removeClass("active");
	    btnMonthSubscribe.addClass("active");
	    btnMonthBook.removeClass("active");
	    updateH6TagMonthMonth();
	});
	
	btnMonthBook.on("click", function() {
	    btnMonth.removeClass("active");
	    btnMonthSubscribe.removeClass("active");
	    btnMonthBook.addClass("active");
	    updateH6TagMonthMonth();
	});
	
	// h6 태그 업데이트 함수
	function updateH6TagMonthMonth() {
	    var selectedYear = selectYearMonth.val();
	    var selectedButton = getSelectedButton_Month();
	
	    h6TagMonth.text(selectedYear + "년 " + selectedButton + " 월매출");
	}
	
	// 선택된 버튼을 반환하는 함수
	function getSelectedButton_Month() {
	    if (btnMonth.hasClass("active")) {
	        return "전체";
	    } else if (btnMonthSubscribe.hasClass("active")) {
	        return "구독권";
	    } else if (btnMonthBook.hasClass("active")) {
	        return "설정집";
	    } else {
	        return "전체";
	    }
	}
	/************ END of 월매출 ************/


})(jQuery);