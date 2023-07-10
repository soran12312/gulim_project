(function($) {
    "use strict"

//stalked bar chart
    //generate gradient
    const barChart_3gradientStroke = barChart_3.createLinearGradient(50, 100, 50, 50);
    barChart_3gradientStroke.addColorStop(0, "rgba(26, 51, 213, 1)");
    barChart_3gradientStroke.addColorStop(1, "rgba(26, 51, 213, 0.5)");

    const barChart_3gradientStroke2 = barChart_3.createLinearGradient(50, 100, 50, 50);
    barChart_3gradientStroke2.addColorStop(0, "rgba(56, 164, 248, 1)");
    barChart_3gradientStroke2.addColorStop(1, "rgba(56, 164, 248, 1)");

    const barChart_3gradientStroke3 = barChart_3.createLinearGradient(50, 100, 50, 50);
    barChart_3gradientStroke3.addColorStop(0, "rgba(40, 199, 111, 1)");
    barChart_3gradientStroke3.addColorStop(1, "rgba(40, 199, 111, 1)");
    
    barChart_3.height = 100;

    let barChartData = {
        defaultFontFamily: 'Poppins',
        labels: ['Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun'],
        datasets: [{
            label: 'Red',
            backgroundColor: barChart_3gradientStroke,
            hoverBackgroundColor: barChart_3gradientStroke, 
            data: [
                '15',
                '11',
                '19',
                '6',
                '8',
                '16',
                '12'
            ]
        }, {
            label: 'Green',
            backgroundColor: barChart_3gradientStroke2,
            hoverBackgroundColor: barChart_3gradientStroke2, 
            data: [
                '12',
                '12',
                '12',
                '12',
                '12',
                '12',
                '12'
            ]
        }, {
            label: 'Blue',
            backgroundColor: barChart_3gradientStroke3,
            hoverBackgroundColor: barChart_3gradientStroke3, 
            data: [
                '12',
                '12',
                '12',
                '12',
                '12',
                '12',
                '12'
            ]
        }]

    };

    new Chart(barChart_3, {
        type: 'bar',
        data: barChartData,
        options: {
            legend: {
                display: false
            }, 
            title: {
                display: false
            },
            tooltips: {
                mode: 'index',
                intersect: false
            },
            responsive: true,
            scales: {
                xAxes: [{
                    stacked: true,
                }],
                yAxes: [{
                    stacked: true
                }]
            }
        }
    });





})(jQuery);