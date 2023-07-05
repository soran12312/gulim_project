(function($) {
    "use strict"
    
    /************ Start of 연간매출 ************/
    
    var data_year = [{
                period: '2020',
                smartphone: 20,
                windows: 30,
                mac: 50
            }, {
                period: '2021',
                smartphone: 90,
                windows: 60,
                mac: 25
            }, {
                period: '2022',
                smartphone: 40,
                windows: 80,
                mac: 35
            }, {
                period: '2023',
                smartphone: 30,
                windows: 47,
                mac: 17
            }


        ]
        
        var data_year_product = [{
                period: '2020',
                smartphone: 50,
                windows: 20,
                mac: 70
            }, {
                period: '2021',
                smartphone: 60,
                windows: 20,
                mac: 15
            }, {
                period: '2022',
                smartphone: 30,
                windows: 90,
                mac: 37
            }, {
                period: '2023',
                smartphone: 77,
                windows: 67,
                mac: 57
            }
        ]
        
    	var data_year_subscribe = [{
                period: '2020',
                smartphone: 10,
                windows: 10,
                mac: 40
            }, {
                period: '2021',
                smartphone: 97,
                windows: 30,
                mac: 26
            }, {
                period: '2022',
                smartphone: 40,
                windows: 80,
                mac: 35
            }, {
                period: '2023',
                smartphone: 88,
                windows: 82,
                mac: 28
            }
        ]
    	
    	var data_year_book = [{
                period: '2020',
                smartphone: 23,
                windows: 40,
                mac: 80
            }, {
                period: '2021',
                smartphone: 60,
                windows: 42,
                mac: 3
            }, {
                period: '2022',
                smartphone: 21,
                windows: 25,
                mac: 26
            }, {
                period: '2023',
                smartphone: 20,
                windows: 67,
                mac: 102
            }
        ]
    	
    	
    var chart_year = Morris.Area({
        element: 'line_chart_2',
        data: data_year,
        xkey: 'period',
        ykeys: ['smartphone', 'windows', 'mac'],
        labels: ['Phone', 'Windows', 'Mac'],
        pointSize: 3,
        fillOpacity: 0,
        pointStrokeColors: ['#DCDCDC', '#34C73B', '#0000FF'],
        behaveLikeLine: true,
        gridLineColor: 'transparent',
        lineWidth: 3,
        hideHover: 'auto',
        lineColors: ['rgb(192, 10, 39)', 'rgb(0, 171, 197)', '#75B432'],
        resize: true

    });
    
    

		// 버튼 클릭 핸들러
		$("#btn_year").on("click", function() {
		    chart_year.setData(data_year);
		});
		
		$("#btn_year_product").on("click", function() {
		 chart_year.setData(data_year_product);
		});
		
		$("#btn_year_subscribe").on("click", function() {
		    chart_year.setData(data_year_subscribe);
		});
		
		$("#btn_year_book").on("click", function() {
		    chart_year.setData(data_year_book);
		});
		
		
				// Select 요소와 버튼 요소를 가져옵니다.
		var btnYear = $("#btn_year");
		var btnYearProduct = $("#btn_year_product");
		var btnYearSubscribe = $("#btn_year_subscribe");
		var btnYearBook = $("#btn_year_book");
		var h6TagYear = $(".h6_year");
		
		// Select 요소와 버튼 요소의 변경 이벤트를 감지합니다.
		btnYear.addClass("active");
		updateH6TagYear();
		
		btnYear.on("click", function() {
		  btnYear.addClass("active");
		  btnYearProduct.removeClass("active");
		  btnYearSubscribe.removeClass("active");
		  btnYearBook.removeClass("active");
		  updateH6TagYear();
		});
		btnYearProduct.on("click", function() {
		  btnYear.removeClass("active");
		  btnYearProduct.addClass("active");
		  btnYearSubscribe.removeClass("active");
		  btnYearBook.removeClass("active");
		  updateH6TagYear();
		});
		btnYearSubscribe.on("click", function() {
		  btnYear.removeClass("active");
		  btnYearProduct.removeClass("active");
		  btnYearSubscribe.addClass("active");
		  btnYearBook.removeClass("active");
		  updateH6TagYear();
		});
		btnYearBook.on("click", function() {
		  btnYear.removeClass("active");
		  btnYearProduct.removeClass("active");
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
		    } else if (btnYearProduct.hasClass("active")) {
		        return "상품";
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
      var data_quarter = [{
	    label: "\xa0 \xa0 Download Sales \xa0 \xa0",
	    value: 12,
	  }, {
	    label: "\xa0 \xa0 In-Store Sales \xa0 \xa0",
	    value: 30
	  }, {
	    label: "\xa0 \xa0 Mail-Order Sales \xa0 \xa0",
	    value: 20
	  }];
	
	  var data_quarter_product = [{
	    label: "\xa0 \xa0 Online Sales \xa0 \xa0",
	    value: 25,
	  }, {
	    label: "\xa0 \xa0 In-Store Sales \xa0 \xa0",
	    value: 18
	  }, {
	    label: "\xa0 \xa0 Direct Sales \xa0 \xa0",
	    value: 35
	  }];
	  
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
	
	  var data_quarter_product2 = [{
	    label: "\xa0 \xa0 Online Sales \xa0 \xa0",
	    value: 4,
	  }, {
	    label: "\xa0 \xa0 In-Store Sales \xa0 \xa0",
	    value: 18
	  }, {
	    label: "\xa0 \xa0 Direct Sales \xa0 \xa0",
	    value:5
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
	
	  // 초기 차트
	  var chart_quarter = Morris.Donut({
	    element: 'morris_donught',
	    data: data_quarter,
	    resize: true,
	    colors: ['#75B432', 'rgb(192, 10, 39)', '#4400eb']
	  });
	
	  
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
		
		$("#btn_quarter_product").on("click", function() {
		  var selectedYear = $("#selectYear_quarter").val();
		
		  if (selectedYear === "2023") {
		    chart_quarter.setData(data_quarter_product);
		  } else if (selectedYear === "2022") {
		    chart_quarter.setData(data_quarter_product2);
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
		var btnQuarterProduct = $("#btn_quarter_product");
		var btnQuarterSubscribe = $("#btn_quarter_subscribe");
		var btnQuarterBook = $("#btn_quarter_book");
		var h6TagQuarter = $(".h6_quarter");
		
		// Select 요소와 버튼 요소의 변경 이벤트를 감지합니다.
		btnQuarter.addClass("active");
		updateH6TagQuarter();
		
		selectYearQuarter.on("change", updateH6TagQuarter);
		btnQuarter.on("click", function() {
		  btnQuarter.addClass("active");
		  btnQuarterProduct.removeClass("active");
		  btnQuarterSubscribe.removeClass("active");
		  btnQuarterBook.removeClass("active");
		  updateH6TagQuarter();
		});
		btnQuarterProduct.on("click", function() {
		  btnQuarter.removeClass("active");
		  btnQuarterProduct.addClass("active");
		  btnQuarterSubscribe.removeClass("active");
		  btnQuarterBook.removeClass("active");
		  updateH6TagQuarter();
		});
		btnQuarterSubscribe.on("click", function() {
		  btnQuarter.removeClass("active");
		  btnQuarterProduct.removeClass("active");
		  btnQuarterSubscribe.addClass("active");
		  btnQuarterBook.removeClass("active");
		  updateH6TagQuarter();
		});
		btnQuarterBook.on("click", function() {
		  btnQuarter.removeClass("active");
		  btnQuarterProduct.removeClass("active");
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
		    } else if (btnQuarterProduct.hasClass("active")) {
		        return "상품";
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