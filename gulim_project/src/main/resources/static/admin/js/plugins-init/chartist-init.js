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
	  
	$('#textSurvey').text($('.btn-prb').text());
	  
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
		
		$('#textSurvey').text($('.btn-prb').text());
		
		
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
		
		$('#textSurvey').text($('.btn-pt').text());
		
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
		
		$('#textSurvey').text($('.btn-pg').text());
		
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
		
		$('#textSurvey').text($('.btn-pc').text());
		
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
		
		$('#textSurvey').text($('.btn-pgen').text());
		
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
		
		$('#textSurvey').text($('.btn-ps').text());
		
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
		
		$('#textSurvey').text($('.btn-wgen').text());
		
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
		
		$('#textSurvey').text($('.btn-os').text());
		
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
	
	
	
	$('#textFlavor').text($('.btn-pfs').text());

	fetch('https://localhost:8080/admin/game_stats/character_sheet')
	    .then(response => response.json())
	    .then(data => {
	        // 'data' is an array of documents
	        const frequencyMap = {};
	
	        // Assuming that the server response has a 'data' key that contains the actual data
	        data.data_cs.forEach(item => {
	            let rull = item.char_propensity; // No need for a loop if other_site is a string
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
	        createChart2(labels, series);
	    });


	$('.flavorButton').on('click', '.btn-pfs', function(e) {
		
		$('#textFlavor').text($('.btn-pfs').text());
		
		fetch('https://localhost:8080/admin/game_stats/character_sheet')
	    .then(response => response.json())
	    .then(data => {
	        // 'data' is an array of documents
	        const frequencyMap = {};
	
	        // Assuming that the server response has a 'data' key that contains the actual data
	        data.data_cs.forEach(item => {
	            let rull = item.char_propensity; // No need for a loop if other_site is a string
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
	        createChart2(labels, series);
	    });
	});
	
	$('.flavorButton').on('click', '.btn-pfc', function(e) {
		
		$('#textFlavor').text($('.btn-pfc').text());
		
		fetch('https://localhost:8080/admin/game_stats/character_sheet')
	    .then(response => response.json())
	    .then(data => {
	        // 'data' is an array of documents
	        const frequencyMap = {};
	
	        // Assuming that the server response has a 'data' key that contains the actual data
	        data.data_cs.forEach(item => {
	            let rull = item.char_class; // No need for a loop if other_site is a string
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
	        createChart2(labels, series);
	    });
	});

	$('.flavorButton').on('click', '.btn-pfsp', function(e) {
		
		$('#textFlavor').text($('.btn-pfsp').text());
		
		fetch('https://localhost:8080/admin/game_stats/character_sheet')
	    .then(response => response.json())
	    .then(data => {
	        // 'data' is an array of documents
	        const frequencyMap = {};
	
	        // Assuming that the server response has a 'data' key that contains the actual data
	        data.data_cs.forEach(item => {
	            let rull = item.species; // No need for a loop if other_site is a string
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
	        createChart2(labels, series);
	    });
	});
	
	$('.flavorButton').on('click', '.btn-pfst', function(e){
		
		
		$('#textFlavor').text($('.btn-pfst').text());
		
		$('#class-select').removeClass('hide-class-select');
		
		var char_class = $('#class-select option:first').val();
		
		fetch('https://localhost:8080/admin/game_stats/character_sheet')
	    .then(response => response.json())
	    .then(data => {
	        // 'data' is an array of documents
	        const frequencyMap = {};
	        let str = '힘';
	        let dex = '민첩';
			let con = '체력';
			let intelligence = '지능';
			let wis = '지혜';
			let chr = '매력';
	
	        // Assuming that the server response has a 'data' key that contains the actual data
	        data.data_cs.forEach(item => {
			    let charClass = item.char_class;
			    if(charClass == char_class) {
			    
				    // If the 'rull' is not in the map, add it with a count of 1
				    if (!(str in frequencyMap)) {
				        frequencyMap[str] = item.str;
				    }
				    // Otherwise, increment the count
				    else {
				        frequencyMap[str]++;
				    }
				    
				    // If the 'rull' is not in the map, add it with a count of 1
				    if (!(dex in frequencyMap)) {
				        frequencyMap[dex] = item.dex;
				    }
				    // Otherwise, increment the count
				    else {
				        frequencyMap[dex]++;
				    }
				    
				    // If the 'rull' is not in the map, add it with a count of 1
				    if (!(con in frequencyMap)) {
				        frequencyMap[con] = item.con;
				    }
				    // Otherwise, increment the count
				    else {
				        frequencyMap[con]++;
				    }
				    
				    // If the 'rull' is not in the map, add it with a count of 1
				    if (!(intelligence in frequencyMap)) {
				        frequencyMap[intelligence] = item.intelligence;
				    }
				    // Otherwise, increment the count
				    else {
				        frequencyMap[intelligence]++;
				    }
				    
				    // If the 'rull' is not in the map, add it with a count of 1
				    if (!(wis in frequencyMap)) {
				        frequencyMap[wis] = item.wis;
				    }
				    // Otherwise, increment the count
				    else {
				        frequencyMap[wis]++;
				    }
				    
				    // If the 'rull' is not in the map, add it with a count of 1
				    if (!(chr in frequencyMap)) {
				        frequencyMap[chr] = item.chr;
				    }
				    // Otherwise, increment the count
				    else {
				        frequencyMap[chr]++;
				    }
				}
			    
			});
			
	        // Now create the labels and series arrays
	        let labels = Object.keys(frequencyMap);
	        let series = labels.map(label => frequencyMap[label]);
	
	
	        // Make sure the chart is created only after the data processing is complete
	        createChart2(labels, series);
	    });
		
		
		$('.card-body').on('change', '#class-select', function(e) {
			char_class = $(this).val();
			
			fetch('https://localhost:8080/admin/game_stats/character_sheet')
		    .then(response => response.json())
		    .then(data => {
		        // 'data' is an array of documents
		        const frequencyMap = {};
		        let str = '힘';
		        let dex = '민첩';
				let con = '체력';
				let intelligence = '지능';
				let wis = '지혜';
				let chr = '매력';
		
		        // Assuming that the server response has a 'data' key that contains the actual data
		        data.data_cs.forEach(item => {
				    let charClass = item.char_class;
				    if(charClass == char_class) {
				    
					    // If the 'rull' is not in the map, add it with a count of 1
					    if (!(str in frequencyMap)) {
					        frequencyMap[str] = item.str;
					    }
					    // Otherwise, increment the count
					    else {
					        frequencyMap[str]++;
					    }
					    
					    // If the 'rull' is not in the map, add it with a count of 1
					    if (!(dex in frequencyMap)) {
					        frequencyMap[dex] = item.dex;
					    }
					    // Otherwise, increment the count
					    else {
					        frequencyMap[dex]++;
					    }
					    
					    // If the 'rull' is not in the map, add it with a count of 1
					    if (!(con in frequencyMap)) {
					        frequencyMap[con] = item.con;
					    }
					    // Otherwise, increment the count
					    else {
					        frequencyMap[con]++;
					    }
					    
					    // If the 'rull' is not in the map, add it with a count of 1
					    if (!(intelligence in frequencyMap)) {
					        frequencyMap[intelligence] = item.intelligence;
					    }
					    // Otherwise, increment the count
					    else {
					        frequencyMap[intelligence]++;
					    }
					    
					    // If the 'rull' is not in the map, add it with a count of 1
					    if (!(wis in frequencyMap)) {
					        frequencyMap[wis] = item.wis;
					    }
					    // Otherwise, increment the count
					    else {
					        frequencyMap[wis]++;
					    }
					    
					    // If the 'rull' is not in the map, add it with a count of 1
					    if (!(chr in frequencyMap)) {
					        frequencyMap[chr] = item.chr;
					    }
					    // Otherwise, increment the count
					    else {
					        frequencyMap[chr]++;
					    }
					}
				});
				
		        // Now create the labels and series arrays
		        let labels = Object.keys(frequencyMap);
		        let series = labels.map(label => frequencyMap[label]);
		
		        // Make sure the chart is created only after the data processing is complete
		        createChart2(labels, series);
		    });
		});
        createChart2();
	});
	
	

	function createChart2(labels, series) {
	    var sum = function(a, b) {
	        return a + b;
	    };
	
	    var data = {
	        labels: labels,
	        series: series
	    };
	    
	    console.log(data);
	
	    new Chartist.Pie('#simple-pie2', data, {
	        labelInterpolationFnc: function(value, idx) {
				console.log(value);
	            var percentage = ((data.series[idx] / data.series.reduce(sum)) * 100).toFixed(1) + '%';
	            return data.labels[idx] + '\n' + percentage;
	        }
	    },responsiveOptions);
	}


})(jQuery);