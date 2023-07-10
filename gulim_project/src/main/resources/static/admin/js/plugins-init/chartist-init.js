(function($) {
    "use strict"
    
  //Simple pie chart
  
  var names = ['액션', 'SF', '추리', '판타지', '호러'];
  
  var data = {
    series: [5, 3, 4, 9, 15]
  };
  
  var sum = function(a, b) { return a + b };
  
  new Chartist.Pie('#simple-pie', data, {
    labelInterpolationFnc: function(value, idx) {
      var percentage = Math.round(value / data.series.reduce(sum) * 100) + '%';
      return names[idx] + '\n' + percentage;
    }
  });


})(jQuery);