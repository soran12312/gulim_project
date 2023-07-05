(function($) {
    "use strict"

    
    Morris.Donut({
        element: 'morris_donught',
        data: [{
            label: "\xa0 \xa0 Download Sales \xa0 \xa0",
            value: 12,

        }, {
            label: "\xa0 \xa0 In-Store Sales \xa0 \xa0",
            value: 30
        }, {
            label: "\xa0 \xa0 Mail-Order Sales \xa0 \xa0",
            value: 20
        }],
        resize: true,
        colors: ['#75B432', 'rgb(192, 10, 39)', '#4400eb']
    });
    

    



//line chart
    Morris.Area({
        element: 'line_chart_2',
        data: [{
                period: '2020',
                smartphone: 0,
                windows: 0,
                mac: 0
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


        ],
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
    



//bar chart stalked

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
    



})(jQuery);