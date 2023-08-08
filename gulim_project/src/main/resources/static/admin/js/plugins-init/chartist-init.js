(function($) {
    "use strict"
    
  //Simple pie chart
  
  
  // 사용자 이름을 저장할 배열
	var names = [];
	// 차트 데이터 객체
	var data = {
		series: []
	};
	
	// 반응형 차트 옵션
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
	
	// 선택한 설문조사 텍스트를 설정
	$('#textSurvey').text($('.btn-prb').text());
	
	// 서버로부터 설문조사 데이터를 가져옵니다.
	fetch('https://192.168.0.68:8080/admin/game_stats/survey')
		.then(response => response.json())
		.then(data => {
			// 'data'는 문서의 배열
			const frequencyMap = {};
	
			// 서버 응답에 실제 데이터를 포함하는 'data' 키가 있다고 가정
			data.data.forEach(item => {
				// 문서의 각 'play_rull'에 대해...
				item.play_rull.forEach(rull => {
					// 'rull'이 맵에 없으면 카운트 1로 추가
					if (!(rull in frequencyMap)) {
						frequencyMap[rull] = 1;
					}
					// 그렇지 않으면 카운트 증가
					else {
						frequencyMap[rull]++;
					}
				});
			});
	
			// 레이블과 시리즈 배열을 생성합니다.
			let labels = Object.keys(frequencyMap);
			let series = labels.map(label => frequencyMap[label]);
	
			// 빈도수로 내림차순 정렬
			let sortedIndices = series.map((value, index) => index).sort((a, b) => series[b] - series[a]);
			labels = sortedIndices.map(index => labels[index]);
			series = sortedIndices.map(index => series[index]);
	
			// 상위 5개만 유지하고 나머지는 '기타'로 그룹화
			if (labels.length > 5) {
				let otherCount = series.slice(5).reduce((a, b) => a + b, 0);
				labels = labels.slice(0, 5);
				series = series.slice(0, 5);
				labels.push('기타');
				series.push(otherCount);
			}
	
			// 데이터 처리가 완료된 후 차트를 생성
			createChart(labels, series);
		});


	// 플레이해본 룰북 버튼 클릭 이벤트
	$('.surveyButton').on('click', '.btn-prb', function(e) {
		// 설문조사 텍스트 설정
		$('#textSurvey').text($('.btn-prb').text());
	
		// 서버로부터 설문조사 데이터를 가져옵니다.
		fetch('https://192.168.0.68:8080/admin/game_stats/survey')
			.then(response => response.json())
			.then(data => {
				// 문서의 배열로 'data' 변수 정의
				const frequencyMap = {};
	
				// 서버 응답에 실제 데이터를 포함하는 'data' 키가 있다고 가정
				data.data.forEach(item => {
					// 문서의 각 'play_rull'에 대해...
					item.play_rull.forEach(rull => {
						// 'rull'이 맵에 없으면 카운트 1로 추가
						if (!(rull in frequencyMap)) {
							frequencyMap[rull] = 1;
						}
						// 그렇지 않으면 카운트 증가
						else {
							frequencyMap[rull]++;
						}
					});
				});
	
				// 레이블과 시리즈 배열 생성
				let labels = Object.keys(frequencyMap);
				let series = labels.map(label => frequencyMap[label]);
	
				// 빈도수로 내림차순 정렬
				let sortedIndices = series.map((value, index) => index).sort((a, b) => series[b] - series[a]);
				labels = sortedIndices.map(index => labels[index]);
				series = sortedIndices.map(index => series[index]);
	
				// 상위 5개만 유지하고 나머지는 '기타'로 그룹화
				if (labels.length > 5) {
					let otherCount = series.slice(5).reduce((a, b) => a + b, 0);
					labels = labels.slice(0, 5);
					series = series.slice(0, 5);
					labels.push('기타');
					series.push(otherCount);
				}
	
				// 데이터 처리가 완료된 후 차트를 생성
				createChart(labels, series);
			});
	});
	
	// 플레이해본 시간 버튼 클릭 이벤트
	$('.surveyButton').on('click', '.btn-pt', function(e) {
		// 설문조사 텍스트 설정
		$('#textSurvey').text($('.btn-pt').text());
	
		fetch('https://192.168.0.68:8080/admin/game_stats/survey')
			.then(response => response.json())
			.then(data => {
				// 문서의 배열로 'data' 변수 정의
				const frequencyMap = {};
	
				// 서버 응답에 실제 데이터를 포함하는 'data' 키가 있다고 가정
				data.data.forEach(item => {
					let play_hours_none = item.play_period;
					let rull;
					if(play_hours_none == '없음') {
						rull = '없음';
					} else {
						let play_hours = parseFloat(item.play_period); // 문자열을 실수로 변환
	
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
	
					// 'rull'이 맵에 없으면 카운트 1로 추가
					if (!(rull in frequencyMap)) {
						frequencyMap[rull] = 1;
					}
					// 그렇지 않으면 카운트 증가
					else {
						frequencyMap[rull]++;
					}
				});
	
				// 레이블과 시리즈 배열 생성
				let labels = Object.keys(frequencyMap);
				let series = labels.map(label => frequencyMap[label]);
	
				// 데이터 처리가 완료된 후 차트를 생성
				createChart(labels, series);
			});
	});
	
	// 마스터 플레이 횟수 버튼 클릭 이벤트
	$('.surveyButton').on('click', '.btn-pg', function(e) {
		// 설문조사 텍스트 설정
		$('#textSurvey').text($('.btn-pg').text());
	
		fetch('https://192.168.0.68:8080/admin/game_stats/survey')
			.then(response => response.json())
			.then(data => {
				// 문서의 배열로 'data' 변수 정의
				const frequencyMap = {};
	
				// 서버 응답에 실제 데이터를 포함하는 'data' 키가 있다고 가정
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
						} else {
							rull = '11회 이상';
						}
	
					// 'rull'이 맵에 없으면 카운트 1로 추가
					if (!(rull in frequencyMap)) {
						frequencyMap[rull] = 1;
					}
					// 그렇지 않으면 카운트 증가
					else {
						frequencyMap[rull]++;
					}
				});
	
				// 레이블과 시리즈 배열 생성
				let labels = Object.keys(frequencyMap);
				let series = labels.map(label => frequencyMap[label]);
	
				// 데이터 처리가 완료된 후 차트를 생성
				createChart(labels, series);
			});
	});

	// 플레이해본 직업 버튼 이벤트 처리
	$('.surveyButton').on('click', '.btn-pc', function(e) {
		// 선택한 버튼의 텍스트를 화면에 표시
		$('#textSurvey').text($('.btn-pc').text());
	
		// 서버에서 설문 데이터를 가져옴
		fetch('https://192.168.0.68:8080/admin/game_stats/survey')
			.then(response => response.json())
			.then(data => {
				// 'data'는 문서의 배열이라고 가정
				const frequencyMap = {};
	
				// 서버 응답이 실제 데이터를 포함하는 'data' 키가 있다고 가정
				data.data.forEach(item => {
					// 문서의 'play_class'에 대한 각 'rull'...
					item.play_class.forEach(rull => {
						// 맵에 'rull'이 없으면 카운트 1로 추가
						if (!(rull in frequencyMap)) {
							frequencyMap[rull] = 1;
						}
						// 그렇지 않으면 카운트 증가
						else {
							frequencyMap[rull]++;
						}
					});
				});
	
				// 레이블과 시리즈 배열 생성
				let labels = Object.keys(frequencyMap);
				let series = labels.map(label => frequencyMap[label]);
	
				// 빈도별로 내림차순 정렬
				let sortedIndices = series.map((value, index) => index).sort((a, b) => series[b] - series[a]);
				labels = sortedIndices.map(index => labels[index]);
				series = sortedIndices.map(index => series[index]);
	
				// 상위 5개만 유지하고 나머지는 '기타'로 그룹화
				if (labels.length > 5) {
					let otherCount = series.slice(5).reduce((a, b) => a + b, 0);
					labels = labels.slice(0, 5);
					series = series.slice(0, 5);
					labels.push('기타');
					series.push(otherCount);
				}
	
				// 데이터 처리가 완료된 후 차트 생성
				createChart(labels, series);
			});
	});

	// 플레이해본 장르 버튼을 클릭했을 때의 이벤트 핸들러
	$('.surveyButton').on('click', '.btn-pgen', function(e) {
			
	    // 클릭된 버튼의 텍스트를 '#textSurvey' 요소에 설정합니다.
		$('#textSurvey').text($('.btn-pgen').text());
			
	    // 서버에 설문조사 결과를 요청합니다.
		fetch('https://192.168.0.68:8080/admin/game_stats/survey')
	    .then(response => response.json())
	    .then(data => {
	        // 빈도수를 추적하기 위한 맵 객체를 생성합니다.
	        const frequencyMap = {};
	    
	        // 서버 응답에서 'data' 키의 데이터를 반복하며 처리합니다.
	        data.data.forEach(item => {
	            // 각 'play_genre'를 반복하며 빈도수를 계산합니다.
	            item.play_genre.forEach(rull => {
	                if (!(rull in frequencyMap)) {
	                    frequencyMap[rull] = 1;
	                }
	                else {
	                    frequencyMap[rull]++;
	                }
	            });
	        });
	
	        // 레이블과 시리즈 배열을 생성하고 정렬합니다.
	        // 결과는 차트를 만드는데 사용됩니다.
	        let labels = Object.keys(frequencyMap);
	        let series = labels.map(label => frequencyMap[label]);
	        let sortedIndices = series.map((value, index) => index).sort((a, b) => series[b] - series[a]);
	        labels = sortedIndices.map(index => labels[index]);
	        series = sortedIndices.map(index => series[index]);
	
	        // 상위 5개만 유지하고 나머지는 '기타'로 그룹화합니다.
	        if (labels.length > 5) {
	            let otherCount = series.slice(5).reduce((a, b) => a + b, 0);
	            labels = labels.slice(0, 5);
	            series = series.slice(0, 5);
	            labels.push('기타');
	            series.push(otherCount);
	        }
	
	        // 데이터 처리가 완료된 후 차트를 생성합니다.
	        createChart(labels, series);
	    });
	});

	// 플레이해본 종족 버튼 클릭에 대한 이벤트 핸들러
	$('.surveyButton').on('click', '.btn-ps', function(e) {
			
	    // 선택된 버튼의 텍스트를 '#textSurvey' 요소에 설정합니다.
	    $('#textSurvey').text($('.btn-ps').text());
	
	    // 서버에서 종족에 대한 설문조사 결과를 가져옵니다.
	    fetch('https://192.168.0.68:8080/admin/game_stats/survey')
	    .then(response => response.json())
	    .then(data => {
	        // 빈도수를 추적하기 위한 객체를 생성합니다.
	        const frequencyMap = {};
	
	        // 응답된 데이터를 반복하며 'play_species'의 빈도를 계산합니다.
	        data.data.forEach(item => {
	            item.play_species.forEach(rull => {
	                if (!(rull in frequencyMap)) {
	                    frequencyMap[rull] = 1;
	                }
	                else {
	                    frequencyMap[rull]++;
	                }
	            });
	        });
	
	        // 레이블과 시리즈 배열을 생성하고 정렬합니다.
	        let labels = Object.keys(frequencyMap);
	        let series = labels.map(label => frequencyMap[label]);
	        let sortedIndices = series.map((value, index) => index).sort((a, b) => series[b] - series[a]);
	        labels = sortedIndices.map(index => labels[index]);
	        series = sortedIndices.map(index => series[index]);
	
	        // 상위 5개만 유지하고 나머지는 '기타'로 그룹화합니다.
	        if (labels.length > 5) {
	            let otherCount = series.slice(5).reduce((a, b) => a + b, 0);
	            labels = labels.slice(0, 5);
	            series = series.slice(0, 5);
	            labels.push('기타');
	            series.push(otherCount);
	        }
	
	        // 데이터 처리가 완료된 후 차트를 생성합니다.
	        createChart(labels, series);
	    });
	});

	// 플레이해보고 싶은 장르 버튼 클릭 이벤트 핸들러
	$('.surveyButton').on('click', '.btn-wgen', function(e) {
	    
	    // 선택된 버튼의 텍스트를 '#textSurvey' 요소에 설정합니다.
	    $('#textSurvey').text($('.btn-wgen').text());
	    
	    // 서버에서 플레이해보고 싶은 장르에 대한 설문조사 결과를 가져옵니다.
	    fetch('https://192.168.0.68:8080/admin/game_stats/survey')
	    .then(response => response.json())
	    .then(data => {
	        // 빈도수를 저장하기 위한 객체를 초기화합니다.
	        const frequencyMap = {};
	
	        // 'data' 키가 실제 데이터를 포함하고 있다고 가정합니다.
	        data.data.forEach(item => {
	            // 문서의 각 'want_genre'에 대해...
	            item.want_genre.forEach(rull => {
	                // 'rull'이 맵에 없으면 1로 추가하고, 그렇지 않으면 개수를 증가시킵니다.
	                if (!(rull in frequencyMap)) {
	                    frequencyMap[rull] = 1;
	                }
	                else {
	                    frequencyMap[rull]++;
	                }
	            });
	        });
	
	        // 레이블과 시리즈 배열을 생성합니다.
	        let labels = Object.keys(frequencyMap);
	        let series = labels.map(label => frequencyMap[label]);
	
	        // 빈도수별로 내림차순 정렬합니다.
	        let sortedIndices = series.map((value, index) => index).sort((a, b) => series[b] - series[a]);
	        labels = sortedIndices.map(index => labels[index]);
	        series = sortedIndices.map(index => series[index]);
	
	        // 상위 5개만 유지하고 나머지는 '기타'로 그룹화합니다.
	        if (labels.length > 5) {
	            let otherCount = series.slice(5).reduce((a, b) => a + b, 0);
	            labels = labels.slice(0, 5);
	            series = series.slice(0, 5);
	            labels.push('기타');
	            series.push(otherCount);
	        }
	
	        // 데이터 처리가 완료된 후 차트를 생성합니다.
	        createChart(labels, series);
	    });
	});

	
	// 다른 사이트 이용 경험 버튼 클릭에 대한 이벤트 핸들러
	$('.surveyButton').on('click', '.btn-os', function(e) {
	
	    // 선택된 버튼의 텍스트를 '#textSurvey' 요소에 설정합니다.
	    $('#textSurvey').text($('.btn-os').text());
	
	    // 서버에서 다른 사이트 이용 경험에 대한 설문조사 결과를 가져옵니다.
	    fetch('https://192.168.0.68:8080/admin/game_stats/survey')
	    .then(response => response.json())
	    .then(data => {
	        const frequencyMap = {};
	        data.data.forEach(item => {
	            let rull = item.other_site;
	            // 'rull'의 빈도수를 계산합니다.
	            if (!(rull in frequencyMap)) {
	                frequencyMap[rull] = 1;
	            }
	            else {
	                frequencyMap[rull]++;
	            }
	        });
	
	        // 레이블과 시리즈 배열을 생성합니다.
	        let labels = Object.keys(frequencyMap);
	        let series = labels.map(label => frequencyMap[label]);
	
	        // 빈도수별로 내림차순 정렬합니다.
	        let sortedIndices = series.map((value, index) => index).sort((a, b) => series[b] - series[a]);
	        labels = sortedIndices.map(index => labels[index]);
	        series = sortedIndices.map(index => series[index]);
	
	        // 상위 5개만 유지하고 나머지는 '기타'로 그룹화합니다.
	        if (labels.length > 5) {
	            let otherCount = series.slice(5).reduce((a, b) => a + b, 0);
	            labels = labels.slice(0, 5);
	            series = series.slice(0, 5);
	            labels.push('기타');
	            series.push(otherCount);
	        }
	
	        // 데이터 처리가 완료된 후 차트를 생성합니다.
	        createChart(labels, series);
	    });
	});



	// 차트 생성 함수
	function createChart(labels, series) {
		// 시리즈의 총합을 계산하는 데 사용되는 함수
		var sum = function(a, b) {
			return a + b;
		};
	
		var data = {
			labels: labels,
			series: series
		};
	
		// 차트 데이터 로깅
		console.log(data);
	
		// 파이 차트 생성
		new Chartist.Pie('#simple-pie', data, {
			labelInterpolationFnc: function(value, idx) {
				// 각 조각의 백분율 계산
				var percentage = ((data.series[idx] / data.series.reduce(sum)) * 100).toFixed(1) + '%';
				// 레이블에 백분율 추가
				return data.labels[idx] + '\n' + percentage;
			}
		}, responsiveOptions);
	}
	
	
	
	// 선택된 캐릭터 성향의 텍스트를 '#textFlavor' 요소에 설정합니다.
	$('#textFlavor').text($('.btn-pfs').text());
	
	// 서버에서 캐릭터 성향에 대한 데이터를 가져옵니다.
	fetch('https://192.168.0.68:8080/admin/game_stats/character_sheet')
	    .then(response => response.json())
	    .then(data => {
	        // 빈도수를 저장하기 위한 객체를 초기화합니다.
	        const frequencyMap = {};
	
	        // 'data' 키가 실제 데이터를 포함하고 있다고 가정합니다.
	        data.data_cs.forEach(item => {
	            let rull = item.char_propensity; // 각 항목의 'char_propensity' 값을 'rull'에 할당합니다.
	            
	            // 'rull'이 맵에 없으면 1로 추가하고, 그렇지 않으면 개수를 증가시킵니다.
	            if (!(rull in frequencyMap)) {
	                frequencyMap[rull] = 1;
	            }
	            else {
	                frequencyMap[rull]++;
	            }
	        });
	
	        // 레이블과 시리즈 배열을 생성합니다.
	        let labels = Object.keys(frequencyMap);
	        let series = labels.map(label => frequencyMap[label]);
	
	        // 빈도수별로 내림차순 정렬합니다.
	        let sortedIndices = series.map((value, index) => index).sort((a, b) => series[b] - series[a]);
	        labels = sortedIndices.map(index => labels[index]);
	        series = sortedIndices.map(index => series[index]);
	
	        // 상위 5개만 유지하고 나머지는 '기타'로 그룹화합니다.
	        if (labels.length > 5) {
	            let otherCount = series.slice(5).reduce((a, b) => a + b, 0);
	            labels = labels.slice(0, 5);
	            series = series.slice(0, 5);
	            labels.push('기타');
	            series.push(otherCount);
	        }
	
	        // 데이터 처리가 완료된 후 차트를 생성합니다 (createChart2 함수를 호출합니다).
	        createChart2(labels, series);
	    });

	// '.flavorButton' 요소 내부의 '.btn-pfs' 버튼을 클릭했을 때의 이벤트 핸들러
	$('.flavorButton').on('click', '.btn-pfs', function(e) {
		
		// 클릭된 버튼의 텍스트를 '#textFlavor' 요소에 설정합니다.
		$('#textFlavor').text($('.btn-pfs').text());
	
		// 서버에서 캐릭터 성향에 대한 데이터를 가져옵니다.
		fetch('https://192.168.0.68:8080/admin/game_stats/character_sheet')
		.then(response => response.json())
		.then(data => {
			// 빈도수를 저장하기 위한 객체를 초기화합니다.
			const frequencyMap = {};
	
			// 서버 응답의 'data' 키가 실제 데이터를 포함하고 있다고 가정합니다.
			data.data_cs.forEach(item => {
				let rull = item.char_propensity; // 각 항목의 'char_propensity' 값을 'rull'에 할당합니다.
	
				// 'rull'이 맵에 없으면 1로 추가하고, 그렇지 않으면 개수를 증가시킵니다.
				if (!(rull in frequencyMap)) {
					frequencyMap[rull] = 1;
				}
				else {
					frequencyMap[rull]++;
				}
			});
	
			// 레이블과 시리즈 배열을 생성합니다.
			let labels = Object.keys(frequencyMap);
			let series = labels.map(label => frequencyMap[label]);
	
			// 빈도수별로 내림차순 정렬합니다.
			let sortedIndices = series.map((value, index) => index).sort((a, b) => series[b] - series[a]);
			labels = sortedIndices.map(index => labels[index]);
			series = sortedIndices.map(index => series[index]);
	
			// 상위 5개만 유지하고 나머지는 '기타'로 그룹화합니다.
			if (labels.length > 5) {
				let otherCount = series.slice(5).reduce((a, b) => a + b, 0);
				labels = labels.slice(0, 5);
				series = series.slice(0, 5);
				labels.push('기타');
				series.push(otherCount);
			}
	
			// 데이터 처리가 완료된 후 차트를 생성합니다 (createChart2 함수를 호출합니다).
			createChart2(labels, series);
		});
	});

	// '.flavorButton' 요소 내부의 '.btn-pfc' 버튼을 클릭했을 때의 이벤트 핸들러
	$('.flavorButton').on('click', '.btn-pfc', function(e) {
		
		// 클릭된 버튼의 텍스트를 '#textFlavor' 요소에 설정합니다.
		$('#textFlavor').text($('.btn-pfc').text());
	
		// 서버에서 캐릭터 클래스에 대한 데이터를 가져옵니다.
		fetch('https://192.168.0.68:8080/admin/game_stats/character_sheet')
		.then(response => response.json())
		.then(data => {
			// 빈도수를 저장하기 위한 객체를 초기화합니다.
			const frequencyMap = {};
	
			// 서버 응답의 'data' 키가 실제 데이터를 포함하고 있다고 가정합니다.
			data.data_cs.forEach(item => {
				let rull = item.char_class; // 각 항목의 'char_class' 값을 'rull'에 할당합니다.
	
				// 'rull'이 맵에 없으면 1로 추가하고, 그렇지 않으면 개수를 증가시킵니다.
				if (!(rull in frequencyMap)) {
					frequencyMap[rull] = 1;
				}
				else {
					frequencyMap[rull]++;
				}
			});
	
			// 레이블과 시리즈 배열을 생성합니다.
			let labels = Object.keys(frequencyMap);
			let series = labels.map(label => frequencyMap[label]);
	
			// 빈도수별로 내림차순 정렬합니다.
			let sortedIndices = series.map((value, index) => index).sort((a, b) => series[b] - series[a]);
			labels = sortedIndices.map(index => labels[index]);
			series = sortedIndices.map(index => series[index]);
	
			// 상위 5개만 유지하고 나머지는 '기타'로 그룹화합니다.
			if (labels.length > 5) {
				let otherCount = series.slice(5).reduce((a, b) => a + b, 0);
				labels = labels.slice(0, 5);
				series = series.slice(0, 5);
				labels.push('기타');
				series.push(otherCount);
			}
	
			// 데이터 처리가 완료된 후 차트를 생성합니다 (createChart2 함수를 호출합니다).
			createChart2(labels, series);
		});
	});

	// '.flavorButton' 요소 내부의 '.btn-pfsp' 버튼을 클릭했을 때의 이벤트 핸들러
	$('.flavorButton').on('click', '.btn-pfsp', function(e) {
		
		// 클릭된 버튼의 텍스트를 '#textFlavor' 요소에 설정합니다.
		$('#textFlavor').text($('.btn-pfsp').text());
	
		// 서버에서 캐릭터 종(species)에 대한 데이터를 가져옵니다.
		fetch('https://192.168.0.68:8080/admin/game_stats/character_sheet')
		.then(response => response.json())
		.then(data => {
			// 빈도수를 저장하기 위한 객체를 초기화합니다.
			const frequencyMap = {};
	
			// 서버 응답의 'data' 키가 실제 데이터를 포함하고 있다고 가정합니다.
			data.data_cs.forEach(item => {
				let rull = item.species; // 각 항목의 'species' 값을 'rull'에 할당합니다.
	
				// 'rull'이 맵에 없으면 1로 추가하고, 그렇지 않으면 개수를 증가시킵니다.
				if (!(rull in frequencyMap)) {
					frequencyMap[rull] = 1;
				}
				else {
					frequencyMap[rull]++;
				}
			});
	
			// 레이블과 시리즈 배열을 생성합니다.
			let labels = Object.keys(frequencyMap);
			let series = labels.map(label => frequencyMap[label]);
	
			// 빈도수별로 내림차순 정렬합니다.
			let sortedIndices = series.map((value, index) => index).sort((a, b) => series[b] - series[a]);
			labels = sortedIndices.map(index => labels[index]);
			series = sortedIndices.map(index => series[index]);
	
			// 상위 5개만 유지하고 나머지는 '기타'로 그룹화합니다.
			if (labels.length > 5) {
				let otherCount = series.slice(5).reduce((a, b) => a + b, 0);
				labels = labels.slice(0, 5);
				series = series.slice(0, 5);
				labels.push('기타');
				series.push(otherCount);
			}
	
			// 데이터 처리가 완료된 후 차트를 생성합니다 (createChart2 함수를 호출합니다).
			createChart2(labels, series);
		});
	});

	
	$('.flavorButton').on('click', '.btn-pfst', function(e){
      
      
      $('#textFlavor').text($('.btn-pfst').text());
      
      $('#class-select').removeClass('hide-class-select');
      
      var char_class = $('#class-select option:first').val();
      
      fetch('https://192.168.0.68:8080/admin/game_stats/character_sheet')
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
         
         fetch('https://192.168.0.68:8080/admin/game_stats/character_sheet')
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
		// 두 숫자를 더하는 함수
		var sum = function(a, b) {
			return a + b;
		};
	
		// 차트 데이터를 정의합니다. 레이블과 시리즈를 매개변수로 받습니다.
		var data = {
			labels: labels,
			series: series
		};
	
		// 데이터를 콘솔에 로깅합니다. 디버깅에 유용할 수 있습니다.
		console.log(data);
	
		// Chartist 라이브러리를 사용하여 원형 차트를 생성합니다.
		new Chartist.Pie('#simple-pie2', data, {
			labelInterpolationFnc: function(value, idx) {
				// 현재 값의 비율을 계산합니다.
				console.log(value); // 값도 콘솔에 로깅합니다.
				var percentage = ((data.series[idx] / data.series.reduce(sum)) * 100).toFixed(1) + '%';
				// 레이블과 백분율을 결합하여 반환합니다.
				return data.labels[idx] + '\n' + percentage;
			}
		}, responsiveOptions); // 반응형 옵션을 사용합니다. (변수가 외부에서 정의되어야 함)
	}

})(jQuery);