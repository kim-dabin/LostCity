<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>랭킹</title>
	<c:import url="/WEB-INF/template/link.jsp" />
	<link rel="stylesheet" href="/css/ranking.css" />


</head>
<body>
   <c:import url="/WEB-INF/template/header.jsp">
		<c:param name="type" value="r"></c:param>
	</c:import>
<div id="content">
    <div class="aux">
        <div id="leaderBoardGraphBox">
            <h2>평점 분포도</h2>
              <div id="chart" style="height: 210px; min-width: 300px; margin: 0 auto; "></div>
        </div><!--//leaderBoardGraphBox -->
        <div id="leaderBoardListBox">
           <table class="list_rating">
               <thead>
                   <tr>
                    <th class="rank">#</th>
                    <th class="player">플레이어</th>
                    <th class="rating">레이팅</th>
                    <th class="winratio">승률</th>
                    <th class="highest">최고점수</th>
                    <th class="times">게임수</th>
                    <th class="mostcity">모스트 문명</th>
                </tr>
            </thead>
            <tbody>
               <tr>
                   <td class="rank">1</td>
                   <td class="player">
                       <a title="시바겨" href="">
                           <img src="profile/profile.png">
                           <span>시바견이당</span>
                       </a>
                   </td>
                   <td class="rating">
                       <span class="tier tier_9"></span>
                       <span>2500</span>
                   </td>
                   <td class="winratio">
                     <p class="winratio_txt">70%</p>
                     <div class="winratio_graph">
                        <div class="winratio_graph_fill" title="70승" style="width: 70%" ></div>
                    </div><!--//winratio_graph -->
                </td>
                <td class="highest">280</td>
                <td class="times">
                    <strong>2,600</strong>
                    (<span>18</span>시간)
                </td>
                <td class="mostcity">
                    <div class="city blue">
                       200
                    </div>

                </td>
            </tr>


             <tr>
                   <td class="rank">2</td>
                   <td class="player">
                       <a title="시바견이당" href="">
                           <img src="profile/profile.png">
                           <span>시바견이당</span>
                       </a>
                   </td>
                   <td class="rating">
                       <span class="tier tier_9"></span>
                       <span>2500</span>
                   </td>
                   <td class="winratio">
                     <p class="winratio_txt">80%</p>
                     <div class="winratio_graph">
                        <div class="winratio_graph_fill" title="80승" style="width: 80%" ></div>
                    </div><!--//winratio_graph -->
                </td>
                <td class="highest">280</td>
                <td class="times">
                    <strong>2,600</strong>
                    (<span>18</span>시간)
                </td>
                <td class="mostcity">
                    <div class="city yellow">
                       200
                    </div>

                </td>
            </tr>
             <tr>
                   <td class="rank">3</td>
                   <td class="player">
                       <a title="시바견이당" href="">
                           <img src="profile/profile.png">
                           <span>시바견이당</span>
                       </a>
                   </td>
                   <td class="rating">
                       <span class="tier tier_9"></span>
                       <span>2500</span>
                   </td>
                   <td class="winratio">
                     <p class="winratio_txt">12%</p>
                     <div class="winratio_graph">
                        <div class="winratio_graph_fill" title="12승" style="width: 12%" ></div>
                    </div><!--//winratio_graph -->
                </td>
                <td class="highest">280</td>
                <td class="times">
                    <strong>2,600</strong>
                    (<span>18</span>시간)
                </td>
                <td class="mostcity">
                    <div class="city white">
                       200
                    </div>

                </td>
            </tr>

            <tr>
                   <td class="rank">4</td>
                   <td class="player">
                       <a title="시바견이당" href="">
                           <img src="profile/profile2.png">
                           <span>이당</span>
                       </a>
                   </td>
                   <td class="rating">
                       <span class="tier tier_1"></span>
                       <span>1500</span>
                   </td>
                   <td class="winratio">
                     <p class="winratio_txt">23%</p>
                     <div class="winratio_graph">
                        <div class="winratio_graph_fill" title="22222승" style="width: 23%" ></div>
                    </div><!--//winratio_graph -->
                </td>
                <td class="highest">0</td>
                <td class="times">
                    <strong>2,600</strong>
                    (<span>18</span>시간)
                </td>
                <td class="mostcity">
                    <div class="city red">
                       200
                    </div>

                </td>
            </tr>

              <tr>
                   <td class="rank">5</td>
                   <td class="player">
                       <a title="시바견이당" href="">
                           <img src="profile/profile.png">
                           <span>이당</span>
                       </a>
                   </td>
                   <td class="rating">
                       <span class="tier tier_2"></span>
                       <span>900</span>
                   </td>
                   <td class="winratio">
                     <p class="winratio_txt">23%</p>
                     <div class="winratio_graph">
                        <div class="winratio_graph_fill" title="22222승" style="width: 23%" ></div>
                    </div><!--//winratio_graph -->
                </td>
                <td class="highest">38</td>
                <td class="times">
                    <strong>2,600</strong>
                    (<span>18</span>시간)
                </td>
                <td class="mostcity">
                    <div class="city green">
                       10
                    </div>

                </td>
            </tr>


        </tbody>
    </table> <!--//.list_rating -->          
</div><!--//leaderBoardListBox -->

</div><!--//aux -->
</div><!--//content-->

<c:import url="/WEB-INF/template/footer.jsp"></c:import>
<script src="../js/fix-footer.js"></script>


<script>

getChartData();// 차트 데이터 띄우기 

function getChartData() {
	$.ajax({
		url:"/ajax/rank/chart",
		type:"get",
		dataType:"json",
		error : function() {
			alert("상태점검중");
		},
		success: function(data) {
			
			console.log(data);
			let arr = new Array();
			for(var i =0; i< 61; i++){
				let jsonData= new Object();
				jsonData.y=data.y[i];
				jsonData.percentage= data.percentage[i];
				arr.push(jsonData);
			}
			
	
			let json = JSON.stringify(arr);
			//console.log(json);
			getChart(JSON.parse(json));
		}});

}



 function getChart(data) {

	 Highcharts.chart('chart', {
		  chart: {
		    type: 'column'
		  },
		  legend:{   enabled: false},
		  title: {
		    text: ''
		  },
		  subtitle: {
		    text: ''
		  },
		  xAxis: {
		    categories: [0,50,100,150,200,250,300,350,400,450,500,550,600,650,700,750,800,850,
		    	900,950,1000,1050,1100,1150,1200,1250,1300,1350,1400,1450,1500,1550,1600,1650,1700,1750,
		    	1800,1850,1900,1950,2000,2050,2100,2150,2200,2250,2300,2350,2400,2450,2500,2550,2600,2650,
		    	2700,2750,2800,2850,2900,2950,3000],
          labels: {},
          tickmarkPlacement: 'on',
          tickInterval: 5,
          tickWidth: 1,
          tickLength: 10
		  },
		  yAxis: {
			  min: 0,
              title: '',
              labels: {
                  enabled: false
              },
              tickPixelInterval: 10
		  },
		  tooltip: {
			  useHTML: true,
              backgroundColor: 'rgba(255,255,255,0.3)',
              borderColor: '#795548',
              borderRadius: 0,
              borderWidth: 0,
			
		    formatter: function() {
		    	return this.points.reduce(function (s, point) {
		    		
	                return s + '</br><span>플레이어 수 :<b style=""> '+point.y+'명</b></span>' +
	                    '</br><span style="padding:0"><b>상위 '+Highcharts.numberFormat(point.percentage,2)+'%</b></span>';
	            }, '<span style="font-size:15px; background-color:#795548; display:inline-block; width:100%; text-align:center">' + this.x+'-'+(this.x+49) + '</span>'
	            
		    	);
		    	
		   
		        },
		        
		        
		    shared: true,
		    useHTML: true
		  },
		 
		  plotOptions: {
		 
		       column: {
                   pointPadding: 0,
     		      borderWidth: 0,
     		      groupPadding: 0,
     		      shadow: false,
                   color: '#3E2723',
                   states: {
                       hover: {
                           color: '#795548',
                           cursor:'pointer'
                       }
                   },
		  pointPlacement: 'between'
               },
               series: {
                   borderWidth: 50
               
                  
              }
		  },
		  series: [{
		    name: '',
		    data: data

		  }]
		});
}
 
 

</script>


</body>
</html>