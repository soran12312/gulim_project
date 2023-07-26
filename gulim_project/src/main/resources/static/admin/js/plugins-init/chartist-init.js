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
  
  var tableRows_playedRuleBook = document.querySelectorAll(".prbTable tbody tr");
	for (var i = 0; i < tableRows_playedRuleBook.length; i++) {
		var play_rull = tableRows_playedRuleBook[i].querySelector("td:nth-child(1)").textContent;
		var count_play_rull = parseInt(tableRows_playedRuleBook[i].querySelector("td:nth-child(2)").textContent);

		names.push(play_rull);
		data.series.push(count_play_rull);
	}

    createChart();

	// 플레이해본 룰북 버튼
	$('.surveyButton').on('click', '.btn-prb', function(e) {
		names = [];
		data = {
			series: []
		};

		var tableRows_playedRuleBook = document.querySelectorAll(".prbTable tbody tr");
		for (var i = 0; i < tableRows_playedRuleBook.length; i++) {
			var play_rull = tableRows_playedRuleBook[i].querySelector("td:nth-child(1)").textContent;
			var count_play_rull = parseInt(tableRows_playedRuleBook[i].querySelector("td:nth-child(2)").textContent);
			names.push(play_rull);
	     	data.series.push(count_play_rull);
		}
	    createChart();
	});

	// 플레이해본 시간 버튼
	$('.surveyButton').on('click', '.btn-pt', function(e) {
		names = [];
		data = {
			series: []
		};

		var tableRows_playedTime = document.querySelectorAll(".ptTable tbody tr");
		for (var i = 0; i < tableRows_playedTime.length; i++) {
			var play_period = tableRows_playedTime[i].querySelector("td:nth-child(1)").textContent;
			var count_play_period = parseInt(tableRows_playedTime[i].querySelector("td:nth-child(2)").textContent);
			names.push(play_period);
	     	data.series.push(count_play_period);
		}
	    createChart();
	});

	// 마스터 플레이 횟수 버튼	
	$('.surveyButton').on('click', '.btn-pg', function(e) {
		names = [];
		data = {
			series: []
		};

		var tableRows_playedGm = document.querySelectorAll(".pgTable tbody tr");
		for (var i = 0; i < tableRows_playedGm.length; i++) {
			var master = tableRows_playedGm[i].querySelector("td:nth-child(1)").textContent;
			var count_master = parseInt(tableRows_playedGm[i].querySelector("td:nth-child(2)").textContent);
			names.push(master);
	     	data.series.push(count_master);
		}
	    createChart();
	});

	// 플레이해본 직업 버튼
	$('.surveyButton').on('click', '.btn-pc', function(e) {
		names = [];
		data = {
			series: []
		};

		var tableRows_playedClass = document.querySelectorAll(".pcTable tbody tr");
		for (var i = 0; i < tableRows_playedClass.length; i++) {
			var play_class = tableRows_playedClass[i].querySelector("td:nth-child(1)").textContent;
			var count_play_class = parseInt(tableRows_playedClass[i].querySelector("td:nth-child(2)").textContent);
			names.push(play_class);
	     	data.series.push(count_play_class);
		}
	    createChart();
	});

	// 플레이해본 장르 버튼
	$('.surveyButton').on('click', '.btn-pgen', function(e) {
		names = [];
		data = {
			series: []
		};

		var tableRows_playedGenre = document.querySelectorAll(".pgenTable tbody tr");
		for (var i = 0; i < tableRows_playedGenre.length; i++) {
			var play_genre = tableRows_playedGenre[i].querySelector("td:nth-child(1)").textContent;
			var count_play_genre = parseInt(tableRows_playedGenre[i].querySelector("td:nth-child(2)").textContent);
			names.push(play_genre);
	     	data.series.push(count_play_genre);
		}
	    createChart();
	});

	// 플레이해본 종족 버튼
	$('.surveyButton').on('click', '.btn-ps', function(e) {
		names = [];
		data = {
			series: []
		};

		var tableRows_playedSpecies = document.querySelectorAll(".psTable tbody tr");
		for (var i = 0; i < tableRows_playedSpecies.length; i++) {
			var play_species = tableRows_playedSpecies[i].querySelector("td:nth-child(1)").textContent;
			var count_play_species = parseInt(tableRows_playedSpecies[i].querySelector("td:nth-child(2)").textContent);
			names.push(play_species);
	     	data.series.push(count_play_species);
		}
	    createChart();
	});

	// 플레이해보고 싶은 장르 버튼
	$('.surveyButton').on('click', '.btn-ps', function(e) {
		names = [];
		data = {
			series: []
		};

		var tableRows_playedSpecies = document.querySelectorAll(".psTable tbody tr");
		for (var i = 0; i < tableRows_playedSpecies.length; i++) {
			var play_species = tableRows_playedSpecies[i].querySelector("td:nth-child(1)").textContent;
			var count_play_species = parseInt(tableRows_playedSpecies[i].querySelector("td:nth-child(2)").textContent);
			names.push(play_species);
	     	data.series.push(count_play_species);
		}
	    createChart();
	});

	// 플레이해보고 싶은 장르 버튼
	$('.surveyButton').on('click', '.btn-wgen', function(e) {
		names = [];
		data = {
			series: []
		};

		var tableRows_wantedGenre = document.querySelectorAll(".wgenTable tbody tr");
		for (var i = 0; i < tableRows_wantedGenre.length; i++) {
			var want_genre = tableRows_wantedGenre[i].querySelector("td:nth-child(1)").textContent;
			var count_want_genre = parseInt(tableRows_wantedGenre[i].querySelector("td:nth-child(2)").textContent);
			names.push(want_genre);
	     	data.series.push(count_want_genre);
		}
	    createChart();
	});

	$('.surveyButton').on('click', '.btn-os', function(e) {
		names = [];
		data = {
			series: []
		};

		var tableRows_otherSite = document.querySelectorAll(".osTable tbody tr");
		for (var i = 0; i < tableRows_otherSite.length; i++) {
			var play_species = tableRows_otherSite[i].querySelector("td:nth-child(1)").textContent;
			var count_play_species = parseInt(tableRows_otherSite[i].querySelector("td:nth-child(2)").textContent);
			names.push(play_species);
	     	data.series.push(count_play_species);
		}
	    createChart();
	});


	function createChart() {
		var sum = function(a, b) {
			return a + b;
		};

		new Chartist.Pie('#simple-pie', data, {
			labelInterpolationFnc: function(value, idx) {
				var percentage = ((value / data.series.reduce(sum)) * 100).toFixed(1) + '%';
				return names[idx] + '\n' + percentage;
			}
		}, responsiveOptions);
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