/**
 * 
 */
 $(".arrow1").on("click", function () {
        $(".sub-menu-first").toggle("4000ms");
      });

      $(".arrow2").on("click", function () {
        $(".sub-menu-second").toggle("4000ms");
      });

      $(".arrow3").on("click", function () {
        $(".sub-menu-third").toggle("4000ms");
      });

      $(".arrow4").on("click", function () {
        $(".sub-menu-fourth").toggle("4000ms");
      });

      $(".memberDelete").on("click", function (e) {
        alert("member");
      });

      // highCharts circleCharts
      // circleCharts
      Highcharts.chart("container1", {
        chart: {
          plotBackgroundColor: null,
          plotBorderWidth: null,
          plotShadow: false,
          type: "pie",
          width: 800,
          height: 280,
        },
        credits: {
          enabled: false,
        },
        title: {
          text: "상품별 주문 수요",
        },
        tooltip: {
          pointFormat: "{series.name}: <b>{point.percentage:.1f}%</b>",
        },
        accessibility: {
          point: {
            valueSuffix: "%",
          },
        },
        plotOptions: {
          pie: {
            allowPointSelect: true,
            cursor: "pointer",
            dataLabels: {
              enabled: false,
            },
            showInLegend: true,
          },
        },
        series: [
          {
            name: "Brands",
            colorByPoint: true,
            data: [
              {
                name: "맨투맨",
                y: 61.41,
                sliced: true,
                selected: true,
              },
              {
                name: "셔츠",
                y: 11.84,
              },
              {
                name: "후드티",
                y: 10.85,
              },
              {
                name: "와이드팬츠",
                y: 4.67,
              },
              {
                name: "볼캡",
                y: 4.18,
              },
              {
                name: "양말",
                y: 7.05,
              },
            ],
          },
        ],
      });

      // stickCharts
      Highcharts.chart("container2", {
        chart: {
          type: "bar",
        },
        credits: {
          enabled: false,
        },

        title: {
          text: "연령별 선호도 그래프",
        },
        xAxis: {
          categories: ["맨투맨", "후드티", "와이드팬츠", "볼캡", "모자"],
        },
        yAxis: {
          min: 0,
          title: {
            text: "연령별 선호도",
          },
        },
        legend: {
          reversed: true,
        },
        plotOptions: {
          series: {
            stacking: "normal",
          },
        },
        series: [
          {
            name: "30대",
            data: [5, 3, 4, 7, 2],
          },
          {
            name: "20대",
            data: [2, 2, 3, 2, 1],
          },
          {
            name: "10대",
            data: [3, 4, 4, 2, 5],
          },
        ],
      });