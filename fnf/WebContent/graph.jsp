<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Step 1) Load D3.js -->
<script src="https://d3js.org/d3.v5.min.js"></script>

<!-- Step 2) Load billboard.js with style -->
<script src="js/billboard.js"></script>

<!-- Load with base style -->
<link rel="stylesheet" href="css/billboard.css">

<!-- Or load different theme style -->
<link rel="stylesheet" href="css/insight.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<body>
<div id="XAxisTimezone"></div>
</body>
<script>
var chart = bb.generate({
	  data: {
	    x: "x",
	    xFormat: "%Y",
	    columns: [
	    	["x", "1980", "1981", "1982", "1983", "1984", "1985",  "1986", "1987", "1988", "1989", "1990", "1991",  "1992", "1993", "1994", "1995", "1996", "1997", "1998", "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017"],
			["평균기온", 11.2, 11.4, 12.4, 12.4, 11.9, 12.2, 11.6, 12.2, 11.9, 12.6, 12.9, 12, 12.2, 11.5, 12.7, 11.6, 11.6, 12.4, 13.5, 12.5, 12, 12.4, 12.5, 12.3, 12.7, 12, 12.8, 13, 12.9, 12.8, 12.6, 12.3, 12.3, 12.7, 12.9, 13.2, 13.5, 12.7],
			["총생산량", 29185, 20913,	29981, 33816, 47891, 47879, 41332, 51935, 41190, 31064, 23458, 20672, 26218, 21131, 18342, 23555, 18406, 16845, 15016, 17982, 16953, 15430, 15842, 9873, 9100, 8122, 6176, 6822, 7358, 4910, 4559, 5930, 5978, 5235, 8785, 8010, 4979, 4124]
		    ],
	    axes: {
	        평균기온: "y2",
	        총생산량: "y"
	      }

	  },
	  axis: {
	    x: {
	      
	      type: "timeseries",
	      localtime: false,
	      tick: {
	        format: "%Y"
	      }
	    }

	  },
	 
	  axis: {
		  y: {
			  label: "총 생산량(t)"
			
		  },
		    y2: {
		    	label:"평균 기온(℃)",
		      show: true
		    }
		  },
	  bindto: "#XAxisTimezone"
	});
</script>
</html>