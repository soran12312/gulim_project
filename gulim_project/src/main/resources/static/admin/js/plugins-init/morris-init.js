(function($) {
    "use strict"
    
    /************ Start of 연간매출 ************/
    
    var tableRows_ssyTable = document.querySelectorAll('.ssyTable tbody tr');
    var data_year = [];
    var chart_year;
    
    
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
    

    /************ Start of 분기매출 ************/
 
 	// 초기화를 빈 배열로 변경
	var data_quarter = [];
	var purchase_year_qua = $('.selectYear').val();

	$.ajax({
	    // 경로
	    url: "/admin/sales_stats",
	    // 전송방식: POST
	    method: "POST",
	    // JSON data를 string으로 변환
	    //data: JSON.stringify({ purchase_year_sub: 2022 }), // "2022"를 직접 넣음
	    data: {purchase_year_qua: purchase_year_qua},
	    // data 전송할 때의 타입
	    //contentType: "application/json; charset=UTF-8",
	    // 성공할 시
	    success: function(response){
	        console.log(response);
	        
	        data_quarter = [];
	        for (var i = 0; i < response.length; i++) {
	            data_quarter.push({
	                label: "\xa0 \xa0 " + response[i].purchase_quarter + "분기 \xa0 \xa0",
	                value: response[i].total_price
	            });
	        }
	        var chart_quarter = Morris.Donut({
	            element: 'morris_donught',
	            data: data_quarter,
	            resize: true
	        });
	    },
	    error: function(xhr, status, error){
	        alert('실패: '+ error);
	        console.log(xhr);
	        console.log(status);
	        console.log(error);
	    }
	});

	  
	  
	  
	
	  var data_quarter_subscribe = [{
	    label: "\xa0 \xa0 Online Sales \xa0 \xa0",
	    value: 14,
	  }, {
	    label: "\xa0 \xa0 In-Store Sales \xa0 \xa0",
	    value: 19
	  }, {
	    label: "\xa0 \xa0 Direct Sales \xa0 \xa0",
	    value: 15
	  }];
	  
	  var data_quarter_book = [{
	    label: "\xa0 \xa0 Online Sales \xa0 \xa0",
	    value: 32,
	  }, {
	    label: "\xa0 \xa0 In-Store Sales \xa0 \xa0",
	    value: 9
	  }, {
	    label: "\xa0 \xa0 Direct Sales \xa0 \xa0",
	    value: 7
	  }];
	  
	  var data_quarter2 = [{
	    label: "\xa0 \xa0 Download Sales \xa0 \xa0",
	    value: 29,
	  }, {
	    label: "\xa0 \xa0 In-Store Sales \xa0 \xa0",
	    value: 49
	  }, {
	    label: "\xa0 \xa0 Mail-Order Sales \xa0 \xa0",
	    value: 1
	  }];
	
	  var data_quarter_subscribe2 = [{
	    label: "\xa0 \xa0 Online Sales \xa0 \xa0",
	    value: 67,
	  }, {
	    label: "\xa0 \xa0 In-Store Sales \xa0 \xa0",
	    value: 15
	  }, {
	    label: "\xa0 \xa0 Direct Sales \xa0 \xa0",
	    value: 13
	  }];
	  
	  var data_quarter_book2 = [{
	    label: "\xa0 \xa0 Online Sales \xa0 \xa0",
	    value: 38,
	  }, {
	    label: "\xa0 \xa0 In-Store Sales \xa0 \xa0",
	    value: 98
	  }, {
	    label: "\xa0 \xa0 Direct Sales \xa0 \xa0",
	    value: 76
	  }];
	
	  
		$("#selectYear_quarter").on("change", function() {
		  var selectedYear = $(this).val();
		
		  if (selectedYear === "2023") {
		    chart_quarter.setData(data_quarter);
		  } else if (selectedYear === "2022") {
		    chart_quarter.setData(data_quarter2);
		  }
		});

		// 버튼 클릭 핸들러
		$("#btn_quarter").on("click", function() {
		  var selectedYear = $("#selectYear_quarter").val();
		
		  if (selectedYear === "2023") {
		    chart_quarter.setData(data_quarter);
		  } else if (selectedYear === "2022") {
		    chart_quarter.setData(data_quarter2);
		  }
		});
		
		
		$("#btn_quarter_subscribe").on("click", function() {
		  var selectedYear = $("#selectYear_quarter").val();
		
		  if (selectedYear === "2023") {
		    chart_quarter.setData(data_quarter_subscribe);
		  } else if (selectedYear === "2022") {
		    chart_quarter.setData(data_quarter_subscribe2);
		  }
		});
		
		$("#btn_quarter_book").on("click", function() {
		  var selectedYear = $("#selectYear_quarter").val();
		
		  if (selectedYear === "2023") {
		    chart_quarter.setData(data_quarter_book);
		  } else if (selectedYear === "2022") {
		    chart_quarter.setData(data_quarter_book2);
		  }
		});
		
		
				// Select 요소와 버튼 요소를 가져옵니다.
		var selectYearQuarter = $("#selectYear_quarter");
		var btnQuarter = $("#btn_quarter");
		var btnQuarterSubscribe = $("#btn_quarter_subscribe");
		var btnQuarterBook = $("#btn_quarter_book");
		var h6TagQuarter = $(".h6_quarter");
		
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
		
		    h6TagQuarter.text(selectedYear + "년 " + selectedButton + " 분기매출");
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
    /************ End of 분기매출 ************/


	/************ Start of 월매출 ************/

    Morris.Bar.prototype.fillForSeries = function(i) {
        var color;
        return "0-#f00-#f00:20-#f00";
    };

    Morris.Bar({
        element: 'morris_bar_2',
        data: [
          { y: '1월', a: 100, b: 90, c: 80 },
          { y: '2월', a: 75,  b: 65, c: 75 },
          { y: '3월', a: 75,  b: 65, c: 75 },
          { y: '4월', a: 75,  b: 65, c: 75 },
          { y: '5월', a: 50,  b: 40, c: 45 },
          { y: '6월', a: 75,  b: 65, c: 85 },
          { y: '7월', a: 79,  b: 35, c: 45 },
          { y: '8월', a: 60,  b: 20, c: 60 },
          { y: '9월', a: 66,  b: 30, c: 50 },
          { y: '10월', a: 46,  b: 60, c: 90 },
          { y: '11월', a: 35,  b: 80, c: 60 },
          { y: '12월', a: 35,  b: 80, c: 60 },
        ],
        xkey: 'y',
        ykeys: ['a', 'b', 'c'],
        labels: ['Series A', 'Series B', 'Series C'],
        barColors: ['rgb(0, 0, 128)', 'rgb(0, 171, 197)', '#75B432'], 
        stacked: true,
        gridTextSize: 11,
        hideHover: 'auto',
        resize: true
    });
    
	/************ END of 월매출 ************/


//area chart
    Morris.Area({
        element: 'morris_area_2',
        data: [{
                period: '1',
                SiteA: 0,
                SiteB: 0,

            }, {
                period: '2',
                SiteA: 130,
                SiteB: 100,

            }, {
                period: '3',
                SiteA: 80,
                SiteB: 60,

            }, {
                period: '4',
                SiteA: 70,
                SiteB: 200,

            }, {
                period: '5',
                SiteA: 180,
                SiteB: 150,

            }, {
                period: '6',
                SiteA: 105,
                SiteB: 90,

            },
            {
                period: '7',
                SiteA: 250,
                SiteB: 150,

            },
            {
                period: '8',
                SiteA: 250,
                SiteB: 150,

            },
            {
                period: '9',
                SiteA: 250,
                SiteB: 150,

            },
            {
                period: '10',
                SiteA: 250,
                SiteB: 150,

            },
            {
                period: '11',
                SiteA: 250,
                SiteB: 150,

            },
            {
                period: '12',
                SiteA: 250,
                SiteB: 150,

            },
            {
                period: '13',
                SiteA: 250,
                SiteB: 150,

            },
            {
                period: '14',
                SiteA: 250,
                SiteB: 150,

            },
            {
                period: '15',
                SiteA: 250,
                SiteB: 150,

            },
            {
                period: '16',
                SiteA: 250,
                SiteB: 150,

            },
            {
                period: '17',
                SiteA: 250,
                SiteB: 150,

            },
            {
                period: '18',
                SiteA: 250,
                SiteB: 150,

            },
            {
                period: '19',
                SiteA: 250,
                SiteB: 150,

            },
            {
                period: '20',
                SiteA: 250,
                SiteB: 150,

            },
            {
                period: '21',
                SiteA: 250,
                SiteB: 150,

            }
        ],
        xkey: 'period',
        ykeys: ['SiteA', 'SiteB'],
        labels: ['Site A', 'Site B'],
        pointSize: 0,
        fillOpacity: 0.6,
        pointStrokeColors: ['#b4becb', '#00A2FF'], //here
        behaveLikeLine: true,
        gridLineColor: 'transparent',
        lineWidth: 0,
        smooth: false,
        hideHover: 'auto',
        lineColors: ['rgb(0, 171, 197)', 'rgb(0, 0, 128)'],
        resize: true

    });
    
    



})(jQuery);