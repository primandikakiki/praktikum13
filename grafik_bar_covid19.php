<?php
include('koneksi1.php');
$country = mysqli_query($koneksi,"SELECT * FROM tb_country");
while($row = mysqli_fetch_array($country)){
	$country_name[] = $row['country'];
	
	$query = mysqli_query($koneksi,"SELECT newcases, totaldeaths, newdeaths, totalrecovered, activecase FROM tb_covid19 WHERE id_country='".$row['id_country']."'");
	$row = $query->fetch_array();
	$new_cases[] = $row['newcases'];
	$total_deaths[] = $row['totaldeaths'];
	$new_deaths[] = $row['newdeaths'];
	$total_recovered[] = $row['totalrecovered'];
	$active_case[] = $row['activecase'];
}
?>
<!DOCTYPE html>
<html>
<head>
	<title>Bar Chart COVID-19</title>
	<script type="text/javascript" src="Chart.js"></script>
</head>
<body>
	<div style="width: 800px;height: 800px">
		<canvas id="myChart"></canvas>
	</div>


	<script>
		var ctx = document.getElementById("myChart").getContext('2d');
		var myChart = new Chart(ctx, {
			type: 'bar',
			data: {
				labels: <?php echo json_encode($country_name); ?>,
				datasets: [{
					label: 'New Case',
					data: <?php echo json_encode($new_cases); ?>,
					backgroundColor: 'rgba(255, 99, 132, 0.2)',
					borderColor: 'rgba(255, 99, 132, 1)',
					borderWidth: 1
					},{
					label: 'Total Deaths',	
					data: <?php echo json_encode($total_deaths); ?>,
					backgroundColor: 'rgba(54, 162, 235, 0.2)',
					borderColor: 'rgba(54, 162, 235, 1)',
					borderWidth: 1
					},{
					label: 'New Deaths',	
					data: <?php echo json_encode($new_deaths); ?>,
					backgroundColor: 'rgba(255, 206, 86, 0.2)',
					borderColor: 'rgba(255, 206, 86, 1)',
					borderWidth: 1
					},{
					label: 'Total Recovered',	
					data: <?php echo json_encode($total_recovered); ?>,
					backgroundColor: 'rgba(75, 192, 192, 0.2)',
					borderColor: 'rgba(75, 192, 192, 1)',
					borderWidth: 1
					},{
					label: 'Active Case',	
					data: <?php echo json_encode($active_case); ?>,
					backgroundColor: 'rgba(210, 105, 30, 0.2)',
					borderColor: 'rgba(210, 105, 30, 1)',
					borderWidth: 1
				}]
			},
			options: {
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero:true
						}
					}]
				}
			}
		});
	</script>
</body>
</html>