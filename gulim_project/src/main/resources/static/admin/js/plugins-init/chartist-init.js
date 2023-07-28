(function($) {
    "use strict"
    
  //Simple pie chart
  
  var names = [];
	var data = {
		series: []
	};

	var responsiveOptions = [
	    ['screen and (min-width: 640px)', {
	      chartPadding: 30,
	      labelOffset: 40,
	      labelDirection: 'explode'
	    }],
	    ['screen and (min-width: 1024px)', {
	      labelOffset: 60,
	      chartPadding: 20
	    }]
	  ];
	  
	 fetch('https://localhost:8080/admin/game_stats/survey')
    .then(response => response.json())
    .then(data => {
        // 'data' is an array of documents
        const frequencyMap = {};

        // Assuming that the server response has a 'data' key that contains the actual data
        data.data.forEach(item => {
            // For each 'play_rull' in the document...
            item.play_rull.forEach(rull => {
                // If the 'rull' is not in the map, add it with a count of 1
                if (!(rull in frequencyMap)) {
                    frequencyMap[rull] = 1;
                }
                // Otherwise, increment the count
                else {
                    frequencyMap[rull]++;
                }
            });
        });

        // Now create the labels and series arrays
        let labels = Object.keys(frequencyMap);
        let series = labels.map(label => frequencyMap[label]);

        // Sort by frequency, in descending order
        let sortedIndices = series.map((value, index) => index).sort((a, b) => series[b] - series[a]);
        labels = sortedIndices.map(index => labels[index]);
        series = sortedIndices.map(index => series[index]);

        // Keep only top 5 and group the rest into 'others'
        if (labels.length > 5) {
            let otherCount = series.slice(5).reduce((a, b) => a + b, 0);
            labels = labels.slice(0, 5);
            series = series.slice(0, 5);
            labels.push('기타');
            series.push(otherCount);
        }

        // Make sure the chart is created only after the data processing is complete
        createChart(labels, series);
    });

	// 플레이해본 룰북 버튼
	$('.surveyButton').on('click', '.btn-prb', function(e) {
		fetch('https://localhost:8080/admin/game_stats/survey')
	    .then(response => response.json())
	    .then(data => {
	        // 'data' is an array of documents
	        const frequencyMap = {};
	
	        // Assuming that the server response has a 'data' key that contains the actual data
	        data.data.forEach(item => {
	            // For each 'play_rull' in the document...
	            item.play_rull.forEach(rull => {
	                // If the 'rull' is not in the map, add it with a count of 1
	                if (!(rull in frequencyMap)) {
	                    frequencyMap[rull] = 1;
	                }
	                // Otherwise, increment the count
	                else {
	                    frequencyMap[rull]++;
	                }
	            });
	        });
	
	        // Now create the labels and series arrays
	        let labels = Object.keys(frequencyMap);
	        let series = labels.map(label => frequencyMap[label]);
	
	        // Sort by frequency, in descending order
	        let sortedIndices = series.map((value, index) => index).sort((a, b) => series[b] - series[a]);
	        labels = sortedIndices.map(index => labels[index]);
	        series = sortedIndices.map(index => series[index]);
	
	        // Keep only top 5 and group the rest into 'others'
	        if (labels.length > 5) {
	            let otherCount = series.slice(5).reduce((a, b) => a + b, 0);
	            labels = labels.slice(0, 5);
	            series = series.slice(0, 5);
	            labels.push('기타');
	            series.push(otherCount);
	        }
	
	        // Make sure the chart is created only after the data processing is complete
	        createChart(labels, series);
	    });
	});
	
	// 플레이해본 시간
	$('.surveyButton').on('click', '.btn-pt', function(e) {
		fetch('https://localhost:8080/admin/game_stats/survey')
	    .then(response => response.json())
	    .then(data => {
	        // 'data' is an array of documents
	        const frequencyMap = {};
	
	        // Assuming that the server response has a 'data' key that contains the actual data
	        data.data.forEach(item => {
			    let play_hours_none = item.play_period;
			    let rull;
			    if(play_hours_none == '없음') {
			        rull = '없음';
			    } else {
			        let play_hours = parseFloat(item.play_period); // Parse the string to float
			
			        if(play_hours < 5) {
			            rull = '1~5시간';
			        } else if(play_hours < 10) {
			            rull = '5~10시간';
			        } else if(play_hours < 20) {
			            rull = '10~20시간';
			        } else {
			            rull = '20시간 이상';
			        }
			    }
			
			    // If the 'rull' is not in the map, add it with a count of 1
			    if (!(rull in frequencyMap)) {
			        frequencyMap[rull] = 1;
			    }
			    // Otherwise, increment the count
			    else {
			        frequencyMap[rull]++;
			    }
			});

	
	        // Now create the labels and series arrays
	        let labels = Object.keys(frequencyMap);
	        let series = labels.map(label => frequencyMap[label]);
	
	
	        // Make sure the chart is created only after the data processing is complete
	        createChart(labels, series);
	    });
	});

	// 마스터 플레이 횟수 버튼	
	$('.surveyButton').on('click', '.btn-pg', function(e) {
		fetch('https://localhost:8080/admin/game_stats/survey')
	    .then(response => response.json())
	    .then(data => {
	        // 'data' is an array of documents
	        const frequencyMap = {};
	
	        // Assuming that the server response has a 'data' key that contains the actual data
	        data.data.forEach(item => {
			    let master = item.master;
			    let rull;
			    if(master == 0) {
			            rull = '없음';
			        } else if(master <=2) {
			            rull = '1~2회';
			        } else if(master <= 5) {
			            rull = '3~5회';
			        } else if(master <=10) {
			            rull = '6~10회';
			        } else{
						rull = '11회 이상';
					}
			    
			
			    // If the 'rull' is not in the map, add it with a count of 1
			    if (!(rull in frequencyMap)) {
			        frequencyMap[rull] = 1;
			    }
			    // Otherwise, increment the count
			    else {
			        frequencyMap[rull]++;
			    }
			});

	
	        // Now create the labels and series arrays
	        let labels = Object.keys(frequencyMap);
	        let series = labels.map(label => frequencyMap[label]);
	
	
	        // Make sure the chart is created only after the data processing is complete
	        createChart(labels, series);
	    });
	});

	// 플레이해본 직업 버튼
	$('.surveyButton').on('click', '.btn-pc', function(e) {
		fetch('https://localhost:8080/admin/game_stats/survey')
	    .then(response => response.json())
	    .then(data => {
	        // 'data' is an array of documents
	        const frequencyMap = {};
	
	        // Assuming that the server response has a 'data' key that contains the actual data
	        data.data.forEach(item => {
	            // For each 'play_rull' in the document...
	            item.play_class.forEach(rull => {
	                // If the 'rull' is not in the map, add it with a count of 1
	                if (!(rull in frequencyMap)) {
	                    frequencyMap[rull] = 1;
	                }
	                // Otherwise, increment the count
	                else {
	                    frequencyMap[rull]++;
	                }
	            });
	        });
	
	        // Now create the labels and series arrays
	        let labels = Object.keys(frequencyMap);
	        let series = labels.map(label => frequencyMap[label]);
	
	        // Sort by frequency, in descending order
	        let sortedIndices = series.map((value, index) => index).sort((a, b) => series[b] - series[a]);
	        labels = sortedIndices.map(index => labels[index]);
	        series = sortedIndices.map(index => series[index]);
	
	        // Keep only top 5 and group the rest into 'others'
	        if (labels.length > 5) {
	            let otherCount = series.slice(5).reduce((a, b) => a + b, 0);
	            labels = labels.slice(0, 5);
	            series = series.slice(0, 5);
	            labels.push('기타');
	            series.push(otherCount);
	        }
	
	        // Make sure the chart is created only after the data processing is complete
	        createChart(labels, series);
	    });
	});

	// 플레이해본 장르 버튼
	$('.surveyButton').on('click', '.btn-pgen', function(e) {
		fetch('https://localhost:8080/admin/game_stats/survey')
	    .then(response => response.json())
	    .then(data => {
	        // 'data' is an array of documents
	        const frequencyMap = {};
	
	        // Assuming that the server response has a 'data' key that contains the actual data
	        data.data.forEach(item => {
	            // For each 'play_rull' in the document...
	            item.play_genre.forEach(rull => {
	                // If the 'rull' is not in the map, add it with a count of 1
	                if (!(rull in frequencyMap)) {
	                    frequencyMap[rull] = 1;
	                }
	                // Otherwise, increment the count
	                else {
	                    frequencyMap[rull]++;
	                }
	            });
	        });
	
	        // Now create the labels and series arrays
	        let labels = Object.keys(frequencyMap);
	        let series = labels.map(label => frequencyMap[label]);
	
	        // Sort by frequency, in descending order
	        let sortedIndices = series.map((value, index) => index).sort((a, b) => series[b] - series[a]);
	        labels = sortedIndices.map(index => labels[index]);
	        series = sortedIndices.map(index => series[index]);
	
	        // Keep only top 5 and group the rest into 'others'
	        if (labels.length > 5) {
	            let otherCount = series.slice(5).reduce((a, b) => a + b, 0);
	            labels = labels.slice(0, 5);
	            series = series.slice(0, 5);
	            labels.push('기타');
	            series.push(otherCount);
	        }
	
	        // Make sure the chart is created only after the data processing is complete
	        createChart(labels, series);
	    });
	});

	// 플레이해본 종족 버튼
	$('.surveyButton').on('click', '.btn-ps', function(e) {
		fetch('https://localhost:8080/admin/game_stats/survey')
	    .then(response => response.json())
	    .then(data => {
	        // 'data' is an array of documents
	        const frequencyMap = {};
	
	        // Assuming that the server response has a 'data' key that contains the actual data
	        data.data.forEach(item => {
	            // For each 'play_rull' in the document...
	            item.play_species.forEach(rull => {
	                // If the 'rull' is not in the map, add it with a count of 1
	                if (!(rull in frequencyMap)) {
	                    frequencyMap[rull] = 1;
	                }
	                // Otherwise, increment the count
	                else {
	                    frequencyMap[rull]++;
	                }
	            });
	        });
	
	        // Now create the labels and series arrays
	        let labels = Object.keys(frequencyMap);
	        let series = labels.map(label => frequencyMap[label]);
	
	        // Sort by frequency, in descending order
	        let sortedIndices = series.map((value, index) => index).sort((a, b) => series[b] - series[a]);
	        labels = sortedIndices.map(index => labels[index]);
	        series = sortedIndices.map(index => series[index]);
	
	        // Keep only top 5 and group the rest into 'others'
	        if (labels.length > 5) {
	            let otherCount = series.slice(5).reduce((a, b) => a + b, 0);
	            labels = labels.slice(0, 5);
	            series = series.slice(0, 5);
	            labels.push('기타');
	            series.push(otherCount);
	        }
	
	        // Make sure the chart is created only after the data processing is complete
	        createChart(labels, series);
	    });
	});

	// 플레이해보고 싶은 장르 버튼
	$('.surveyButton').on('click', '.btn-wgen', function(e) {
		fetch('https://localhost:8080/admin/game_stats/survey')
	    .then(response => response.json())
	    .then(data => {
	        // 'data' is an array of documents
	        const frequencyMap = {};
	
	        // Assuming that the server response has a 'data' key that contains the actual data
	        data.data.forEach(item => {
	            // For each 'play_rull' in the document...
	            item.want_genre.forEach(rull => {
	                // If the 'rull' is not in the map, add it with a count of 1
	                if (!(rull in frequencyMap)) {
	                    frequencyMap[rull] = 1;
	                }
	                // Otherwise, increment the count
	                else {
	                    frequencyMap[rull]++;
	                }
	            });
	        });
	
	        // Now create the labels and series arrays
	        let labels = Object.keys(frequencyMap);
	        let series = labels.map(label => frequencyMap[label]);
	
	        // Sort by frequency, in descending order
	        let sortedIndices = series.map((value, index) => index).sort((a, b) => series[b] - series[a]);
	        labels = sortedIndices.map(index => labels[index]);
	        series = sortedIndices.map(index => series[index]);
	
	        // Keep only top 5 and group the rest into 'others'
	        if (labels.length > 5) {
	            let otherCount = series.slice(5).reduce((a, b) => a + b, 0);
	            labels = labels.slice(0, 5);
	            series = series.slice(0, 5);
	            labels.push('기타');
	            series.push(otherCount);
	        }
	
	        // Make sure the chart is created only after the data processing is complete
	        createChart(labels, series);
	    });
	});
	
	// 다른사이트 이용 경험
	$('.surveyButton').on('click', '.btn-os', function(e) {
		fetch('https://localhost:8080/admin/game_stats/survey')
	    .then(response => response.json())
	    .then(data => {
	        // 'data' is an array of documents
	        const frequencyMap = {};
	
	        // Assuming that the server response has a 'data' key that contains the actual data
	        data.data.forEach(item => {
	            let rull = item.other_site; // No need for a loop if other_site is a string
			    // If the 'rull' is not in the map, add it with a count of 1
			    if (!(rull in frequencyMap)) {
			        frequencyMap[rull] = 1;
			    }
			    // Otherwise, increment the count
			    else {
			        frequencyMap[rull]++;
			    }
	        });
	
	        // Now create the labels and series arrays
	        let labels = Object.keys(frequencyMap);
	        let series = labels.map(label => frequencyMap[label]);
	
	        // Sort by frequency, in descending order
	        let sortedIndices = series.map((value, index) => index).sort((a, b) => series[b] - series[a]);
	        labels = sortedIndices.map(index => labels[index]);
	        series = sortedIndices.map(index => series[index]);
	
	        // Keep only top 5 and group the rest into 'others'
	        if (labels.length > 5) {
	            let otherCount = series.slice(5).reduce((a, b) => a + b, 0);
	            labels = labels.slice(0, 5);
	            series = series.slice(0, 5);
	            labels.push('기타');
	            series.push(otherCount);
	        }
	
	        // Make sure the chart is created only after the data processing is complete
	        createChart(labels, series);
	    });
	});


	function createChart(labels, series) {
	    var sum = function(a, b) {
	        return a + b;
	    };
	
	    var data = {
	        labels: labels,
	        series: series
	    };
	    
	    console.log(data);
	
	    new Chartist.Pie('#simple-pie', data, {
	        labelInterpolationFnc: function(value, idx) {
				console.log(value);
	            var percentage = ((data.series[idx] / data.series.reduce(sum)) * 100).toFixed(1) + '%';
	            return data.labels[idx] + '\n' + percentage;
	        }
	    },responsiveOptions);
	}

	var names2 = [];
	var data2 = {
		series: []
	};

	var tableRows_preferredPropensitye = document.querySelectorAll(".pfsTable tbody tr");
		for (var i = 0; i < tableRows_preferredPropensitye.length; i++) {
			var char_propensity = tableRows_preferredPropensitye[i].querySelector("td:nth-child(1)").textContent;
			var count_char_propensity = parseInt(tableRows_preferredPropensitye[i].querySelector("td:nth-child(2)").textContent);
			names2.push(char_propensity);
	     	data2.series.push(count_char_propensity);
		}
	createChart2();


	$('.flavorButton').on('click', '.btn-pfs', function(e) {
		names2 = [];
		data2 = {
			series: []
		};
		
		$('#class-select').addClass('hide-class-select');

		var tableRows_preferredPropensitye = document.querySelectorAll(".pfsTable tbody tr");
		for (var i = 0; i < tableRows_preferredPropensitye.length; i++) {
			var char_propensity = tableRows_preferredPropensitye[i].querySelector("td:nth-child(1)").textContent;
			var count_char_propensity = parseInt(tableRows_preferredPropensitye[i].querySelector("td:nth-child(2)").textContent);
			names2.push(char_propensity);
	     	data2.series.push(count_char_propensity);
		}
		createChart2();
	});

	$('.flavorButton').on('click', '.btn-pfc', function(e) {
		names2 = [];
		data2 = {
			series: []
		};
		
		$('#class-select').addClass('hide-class-select');

		var tableRows_preferredClass = document.querySelectorAll(".pfcTable tbody tr");
		for (var i = 0; i < tableRows_preferredClass.length; i++) {
			var char_class = tableRows_preferredClass[i].querySelector("td:nth-child(1)").textContent;
			var count_char_class = parseInt(tableRows_preferredClass[i].querySelector("td:nth-child(2)").textContent);
			names2.push(char_class);
	     	data2.series.push(count_char_class);
		}
		createChart2();
	});

	$('.flavorButton').on('click', '.btn-pfsp', function(e) {
		names2 = [];
		data2 = {
			series: []
		};
		
		$('#class-select').addClass('hide-class-select');

		var tableRows_preferredSpecies = document.querySelectorAll(".pfspTable tbody tr");
		for (var i = 0; i < tableRows_preferredSpecies.length; i++) {
			var species = tableRows_preferredSpecies[i].querySelector("td:nth-child(1)").textContent;
			var count_species = parseInt(tableRows_preferredSpecies[i].querySelector("td:nth-child(2)").textContent);
			names2.push(species);
	     	data2.series.push(count_species);
		}
		createChart2();
	});
	
	$('.flavorButton').on('click', '.btn-pfst', function(e){
		names2 = [];
		data2 = {
			series: []
		};
		
		$('#class-select').removeClass('hide-class-select');
		
		var char_class = $('#class-select option:first').val();
		
		$.ajax({
				// 경로
				url: "/admin/game_stats",
				// 전송방식: POST
				method: "POST",
				// JSON data를 string으로 변환
				data: JSON.stringify({char_class: char_class}),
				// data 전송할 때의 타입
				contentType:"application/json; charset=UTF-8",
				// 성공할 시
				success: function(response){
										console.log(response)
					names2 = [];
					data2 = {
						series: []
					};
					console.log(response);
					names2.push('힘');
					data2.series.push(response[0].avg_str);
					names2.push('민첩');
					data2.series.push(response[0].avg_dex);
					names2.push('체력');
					data2.series.push(response[0].avg_con);
					names2.push('지능');
					data2.series.push(response[0].avg_intelligence);
					names2.push('지혜');
					data2.series.push(response[0].avg_wis);
					names2.push('매력');
				    data2.series.push(response[0].avg_chr);
					createChart2();

				},
				error: function(xhr, status, error){
					alert('실패'+ error);
				}
			});
		
		
		$('.card-body').on('change', '#class-select', function(e) {
			char_class = $(this).val();
		
			$.ajax({
				// 경로
				url: "/admin/game_stats",
				// 전송방식: POST
				method: "POST",
				// JSON data를 string으로 변환
				data: JSON.stringify({char_class: char_class}),
				// data 전송할 때의 타입
				contentType:"application/json; charset=UTF-8",
				// 성공할 시
				success: function(response){
					names2 = [];
					data2 = {
						series: []
					};
					console.log(response);
					names2.push('힘');
					data2.series.push(response[0].avg_str);
					names2.push('민첩');
					data2.series.push(response[0].avg_dex);
					names2.push('체력');
					data2.series.push(response[0].avg_con);
					names2.push('지능');
					data2.series.push(response[0].avg_intelligence);
					names2.push('지혜');
					data2.series.push(response[0].avg_wis);
					names2.push('매력');
				    data2.series.push(response[0].avg_chr);
					createChart2();

				},
				error: function(xhr, status, error){
					alert('실패'+ error);
				}
			});
		});
		
        createChart2();

	});
	
	

	function createChart2() {
		var sum = function(a, b) {
			return a + b;
		};

		new Chartist.Pie('#simple-pie2', data2, {
			labelInterpolationFnc: function(value, idx) {
				var percentage = ((value / data2.series.reduce(sum)) * 100).toFixed(1) + '%';
				return names2[idx] + '\n' + percentage;
			}
		}, responsiveOptions);
	}


})(jQuery);