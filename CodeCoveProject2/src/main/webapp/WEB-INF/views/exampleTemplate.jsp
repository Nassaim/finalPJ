<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="light">

  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assan-Admin</title>

    <!--Bootstrap icons-->
    <link href="/resources/assets/fonts/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">

    <!--Google web fonts-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Hanken+Grotesk:wght@100..900&family=IBM+Plex+Mono:ital@0;1&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,0,0" />
    <!--Simplebar css-->
    <link rel="stylesheet" href="/resources/assets/vendor/css/simplebar.min.css">
    <!--Choices css-->
    <link rel="stylesheet" href="/resources/assets/vendor/css/choices.min.css">

    <!--Date range picker-->
    <link rel="stylesheet" href="/resources/assets/vendor/css/daterangepicker.css">
    <!--Main style-->
    <link rel="stylesheet" href="/resources/assets/css/style.min.css">
  </head>

<body>

    <div class="d-flex flex-column flex-root">
      <!--Page-->
      <div class="page d-flex flex-row flex-column-fluid">

		<!-- sidebar -->
		<tiles:insertAttribute name="sidebar"/>
		
		<!--///////////Page content wrapper///////////////-->
       <main class="page-content d-flex flex-column flex-row-fluid">
		
		<!-- header -->
		<tiles:insertAttribute name="header"/>
		
		<!-- content -->
		<tiles:insertAttribute name="content"/>
		
		<!-- footer -->
		<tiles:insertAttribute name="footer"/>
	 </main>
        <!--///////////Page content wrapper End///////////////-->
      </div>
    </div>
	   <!--:Toast Example auto show/hide:-->
     <div class="toast fade show position-fixed end-0 me-3 me-lg-6 mb-3 mb-lg-6 bottom-0 shadow-lg text-white z-fixed bg-primary border-0" id="introToast" role="alert" data-bs-autohide="false" aria-live="assertive" aria-atomic="true">
      <div class="toast-header bg-primary text-white border-opacity-25 border-bottom border-white d-flex align-items-center justify-content-between">
        <div class="flex-grow-1 d-flex align-items-center">
         <h4 class="mb-0 me-2">👋</h4>
        <strong class="me-2">Welcome to Assan Admin</strong>
        </div>
        <button type="button" class="ms-2 mb-1 btn-close btn-close-white" data-bs-dismiss="toast" aria-label="Close">
        </button>
      </div>
      <div class="toast-body">
        Assan admin is now updated with bootstrap 5.3 Alpha 1 with default Dark/Light/Auto modes
      </div>
    </div>

    
    <!--////////////Theme Core scripts Start/////////////////-->
    <script src="/resources/assets/js/theme.bundle.min.js"></script>

    <!--////////////Theme Core scripts End/////////////////-->


    <!--Dashboard duration calendar-->
    <script src="/resources/assets/vendor/moment.min.js"></script>
    <script src="/resources/assets/vendor/daterangepicker.js"></script>
    <script>
      $(function () {

        var start = moment().subtract(30, 'days');
        var end = moment();

        function cb(start, end) {
          $('#reportrange span').html(start.format('D MMM') + ' - ' + end.format('D MMM'));
        }

        $('#reportrange').daterangepicker({
          startDate: start,
          endDate: end,
          ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf(
              'month')]
          }
        }, cb);

        cb(start, end);

      });

    </script>

    <!--Dashboard charts begin-->
    <script src="/resources/assets/vendor/apexcharts.min.js"></script>
    <script>
      //Chart Sales overview
      var optionsSalesOverview = {
        colors: ["var(--bs-primary)", "var(--bs-gray-400)"],
        series: [{
            name: 'Direct',
            data: [144, 155, 187, 156, 261, 247, 163,
              144, 155, 257, 156, 261, 224, 163,
              144, 155, 257, 156, 261, 198, 163,
              144, 155, 257, 156, 261, 274, 163, 257, 156
            ],
          },
          {
            name: 'Ads',
            data: [76, 85, 101, 98, 87, 124, 91,
              76, 85, 101, 98, 54, 105, 97,
              76, 85, 101, 124, 87, 94, 91,
              76, 85, 101, 78, 104, 135, 104, 98, 87
            ],
          },
        ],

        chart: {
          type: 'area',
          height: 350,
          fontFamily: 'Inherit',
          toolbar: {
            show: false
          }
        },
        dataLabels: {
          enabled: false
        },
        stroke: {
          width: 3,
          curve: 'smooth',
        },
        grid: {
          strokeDashArray: 2,
          padding: {
            top: 0,
            bottom: 0,
            right: 20
          },
          xaxis: {
            lines: {
              show: true,
            },
          },
          yaxis: {
            lines: {
              show: false,
            },
          },
        },
        labels: ["Jan 1", "Jan 2", "Jan 3", "Jan 4", "Jan 5", "Jan 6", "Jan 7",
          "Jan 8", "Jan 9", "Jan 10", "Jan 11", "Jan 12", "Jan 13", "Jan 14",
          "Jan 15", "Jan 16", "Jan 17", "Jan 18", "Jan 19", "Jan 20", "Jan 21",
          "Jan 22", "Jan 23", "Jan 24", "Jan 25", "Jan 26", "Jan 27", "Jan 28", "Jan 29", "Jan 30",
        ],

        yaxis: {
          labels: {
            show: true
          },
        },
        xaxis: {

          tickAmount: 6,
          labels: {
            show: true,
            rotate: 0
          },
          tooltip: {
            enabled: false
          },
          axisTicks: {
            show: false,
          },
          axisBorder: {
            show: false,
          },
        },
        fill: {
          type: 'gradient',
          gradient: {
            shadeIntensity: 1,
            opacityFrom: .05,
            opacityTo: 0,
            stops: [0, 100]
          }
        },
        tooltip: {
          shared: true,
          intersect: false,
          y: {
            formatter: function (val) {
              return val + ' <span class="fw-normal text-body-secondary">Products sold</span>';
            },
          },
        },
        markers: {
          strokeWidth: 5,
          strokeOpacity: 1,
          strokeColors: ["var(--bs-body-bg)","var(--bs-body-bg)","var(--bs-body-bg)"],
        },
      };
      var chartOverview = new ApexCharts(
        document.querySelector('#chart_overview'),
        optionsSalesOverview
      );
      chartOverview.render();

        //top countries
     var countryColors = ["var(--bs-primary)","var(--bs-warning)","var(--bs-info)","var(--bs-success)","var(--bs-danger)",];
      var optionsCountries = {
        
          series: [{ name:"Visitors",
          data: [
            87, 82, 68, 49, 41
          ]
        }],
          chart: {
          type: 'bar',
          height: 300,
          fontFamily:'inherit',
          toolbar:{
            show:false
          }
        },
        legend:{
          show:false
        },
        colors: countryColors,
        grid:{
          strokeDashArray:4,
          position:"back",
          padding:{
            right:30,
            left:10,
            bottom:-10
          },
          xaxis: {
            lines: {
              show: true,
            },
          },
          yaxis: {
            lines: {
              show: false,
            },
          },
        },
        plotOptions: {
          bar: {
            columnWidth:'30%',
            horizontal: false,
            distributed:true,
            borderRadius:6,
            dataLabels: {
              position: 'top',
            },
          }
        },
        labels:{
          show:false
        },
        dataLabels: {
          enabled: false,
        },
        stroke: {
          show: false
        },
        xaxis: {
          categories: ['USA', 'India', 'UK', 'France', 'Canada'],
          axisTicks: {
            show: true,
          },
          axisBorder: {
            show: false,
          },
        },
        yaxis:{
          labels:{
            show:true
          },
          axisTicks: {
            show: false,
          },
          axisBorder: {
            show: false,
          },
        },
        tooltip: {
          y: {
            formatter: function (val) {
              return val + 'k <span class="fw-normal text-body-secondary"></span>';
            },
          },
        },
        };

        var chartCountries = new ApexCharts(document.querySelector("#chart_top_countries"), optionsCountries);
        chartCountries.render();

    </script>
</body>
<script src="/resources/assets/js/theme.bundle.min.js"></script>
<script src="/resources/assets/vendor/moment.min.js"></script>
<script src="/resources/assets/vendor/daterangepicker.js"></script>
</html>

