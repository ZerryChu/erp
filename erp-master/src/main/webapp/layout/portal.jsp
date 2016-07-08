<%@ page language="java" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>主页面</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<jsp:include page="../layout/script.jsp"></jsp:include>
<script type="text/javascript" src="extend/jquery.portal.js"></script>
<link rel="stylesheet" href="extend/portal.css" type="text/css"></link>
<script type="text/javascript">
	var dataString1 = "";
	function loadMessage1() {
		$
				.ajax({
					type : "post",
					url : "amount/amountAction!getAmountAllYear.action",
					data : {},
					async : false,
					dataType : "json",
					success : function(data) {
						$
								.each(
										data,
										function() {
											dataString1 = '<chart palette="5" exportEnabled="1" showExportDialog="1" exportAction="download" exportHandler="FCExporter" exportFileName="exportFile" caption=" " xAxisName="Month" yAxisName="Amount" rotateValues="1">\n\
											 <categories>\n\
										      <category label="Jan" />\n\
										      <category label="Feb" />\n\
										      <category label="Mar" />\n\
										      <category label="Apr" />\n\
										      <category label="May" />\n\
										      <category label="Jun" />\n\
										      <category label="Jul" />\n\
										      <category label="Aug" />\n\
										      <category label="Sep" />\n\
										      <category label="Oct" />\n\
										      <category label="Nov" />\n\
										      <category label="Dec" />\n\
										   </categories>\n\
										   <dataset seriesName="收入额">\n\
										      <set value="';
										   dataString1 += data[0].get;
										   dataString1 += '"/><set value="';
										   dataString1 += data[1].get;
										   dataString1 += '"/><set value="';
										   dataString1 += data[2].get;dataString1 += '"/><set value="';
										   dataString1 += data[3].get;dataString1 += '"/><set value="';
										   dataString1 += data[4].get;dataString1 += '"/><set value="';
										   dataString1 += data[5].get;dataString1 += '"/><set value="';
										   dataString1 += data[6].get;dataString1 += '"/><set value="';
										   dataString1 += data[7].get;dataString1 += '"/><set value="';
										   dataString1 += data[8].get;dataString1 += '"/><set value="';
										   dataString1 += data[9].get;dataString1 += '"/><set value="';
										   dataString1 += data[10].get;dataString1 += '"/><set value="';
										   dataString1 += data[11].get;dataString1 += '"/></dataset><dataset seriesName="支出额"><set value="';
										   dataString1 += data[0].pay;dataString1 += '"/><set value="';
										   dataString1 += data[1].pay;dataString1 += '"/><set value="';
										   dataString1 += data[2].pay;dataString1 += '"/><set value="';
										   dataString1 += data[3].pay;dataString1 += '"/><set value="';
										   dataString1 += data[4].pay;dataString1 += '"/><set value="';
										   dataString1 += data[5].pay;dataString1 += '"/><set value="';
										   dataString1 += data[6].pay;dataString1 += '"/><set value="';
										   dataString1 += data[7].pay;dataString1 += '"/><set value="';
										   dataString1 += data[8].pay;dataString1 += '"/><set value="';
										   dataString1 += data[9].pay;dataString1 += '"/><set value="';
										   dataString1 += data[10].pay;dataString1 += '"/><set value="';
										   dataString1 += data[11].pay;dataString1 += '"/></dataset></chart>';
										});
					}
				});
	}

	var dataString2 = "";
	function loadMessage2() {
		$.ajax({
			type : "post",
			url : "amount/amountAction!getiTemQuantity.action",
			data : {},
			async: false,
			dataType : "json",
			success : function(data) {
				$.each(data, function() {
					dataString2 = '<chart  palette="5" exportEnabled="1" showExportDialog="1" exportAction="download" exportHandler="FCExporter" exportFileName="exportFile" lineThickness="2" divLineDecimalPrecision="1" caption=" " xAxisName="" yAxisName="Amount" rotateValues="1">\n\
						<categories>\n\
							<category label="出货量" />\n\
							<category label="进货量" />\n\
							<category label="现有量" />\n\
						</categories>\n\
						<dataset seriesname="货品id: ' + data[0].id + '" color="F0807F" showValues="1">\n\
							<set value="' + data[0].export + '" />\n\
							<set value="' + data[0].imPort + '" />\n\
							<set value="' + data[0].number + '" />\n\
						</dataset>\n\
						<dataset seriesname="货品id: ' + data[1].id + '" color="F1C7D2"  showValues="1">\n\
							<set value="' + data[1].export + '" />\n\
							<set value="' + data[1].imPort + '" />\n\
							<set value="' + data[1].number + '" />\n\
						</dataset>\n\
						<dataset seriesname="货品id: ' + data[2].id + '" color="FFFFFF"  showValues="1">\n\
							<set value="' + data[2].export + '" />\n\
							<set value="' + data[2].imPort + '" />\n\
							<set value="' + data[2].number + '" />\n\
						</dataset>\n\
					</chart>';
				});
			}
		});
	}

	loadMessage1();
	loadMessage2();
	
	var $pp;
	$(function() {
		var height = $(document).height();
		var width = $(document).width();

		$pp = $("#pp");
		$pp.portal({
			width : parseInt($(this).width() * 0.9),
			height : $(this).height(),
			border : false,
			fit : true
		});

		$("#chartContainer").css("height", parseInt(height * 0.4));
		$("#chartContainer").css("width", parseInt(width));
		$("#chartContainer2").css("height", parseInt(height * 0.4));
		$("#chartContainer2").css("width", parseInt(width));

		$("#chartContainer").insertFusionCharts({
			swfUrl : "js/FusionCharts/ScrollLine2D.swf",
			//dataSource: "js/FusionCharts/Data.xml",
			//dataFormat: "xmlurl",
			width : parseInt($(this).width() * 0.5),
			height : parseInt($(this).height() * 0.4),
			id : "myChartJanID",
			dataFormat : "xml",
			dataSource : dataString1
		});

		var myExportComponent = new FusionChartsExportObject("fcExporter1",
				"js/FusionCharts/FCExporter.swf");
		myExportComponent.Render("fcexpDiv");
		$("#chartContainer2").insertFusionCharts({
			swfUrl : "js/FusionCharts/MSColumn3D.swf",
			//dataSource: "js/FusionCharts/Data.xml",
			//dataFormat: "xmlurl",
			width : parseInt($(this).width() * 0.5),
			height : parseInt($(this).height() * 0.4),
			id : "myChartJsID",
			dataFormat : "xml",
			dataSource : dataString2
		});

		function add() {
			for (var i = 0; i < 1; i++) {
				var p = $('<div/>').appendTo('body');
				p.panel({
					title : 'Title' + i,
					content : '<div style="padding:5px;">Content' + (i + 1)
							+ '</div>',
					height : 200,
					closable : true,
					collapsible : true
				});
				$('#pp').portal('add', {
					panel : p,
					columnIndex : i
				});
			}
			$('#pp').portal('resize');
		}

		function remove() {
			$('#pp').portal('remove', $('#pgrid'));
			$('#pp').portal('resize');
		}

	});
</script>
</head>
<body>
	<div id="pp" style="position: relative;">
		<div>
			<div title="近期交易额" id="chartContainer" closable="true"
				style="height: 400px"></div>
		</div>
		<div>
			<div title="库存数量情况" id="chartContainer2" closable="true"></div>
		</div>

	</div>
</body>