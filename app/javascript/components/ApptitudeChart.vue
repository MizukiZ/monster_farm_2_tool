<script>
import { Radar } from 'vue-chartjs'
export default {
  name: 'ApptitudeChart',
  extends: Radar,
  props: ['chartData'],
  mounted () {
    this.renderChart({
      labels: ['ライフ', 'ちから', 'かしこさ', '命中', '回避', '丈夫さ'],
      datasets: [ {
        data: this.chartData,
        backgroundColor: 'rgba(95, 248, 218, 0.4)',
        borderColor: 'rgba(35, 151, 128 , 0.7)'
        } ] },
      
    {
      title: {display: true, text: 'パラメーター適性', fontSize: 16},
      legend: { display: false },
      tooltips: { enabled: false },
      responsive: true,
      maintainAspectRatio: false,
      scale: {
        pointLabels :{ fontStyle: "bold", fontSize: 12 },
        ticks: {
          fontStyle: 'bold',
          beginAtZero: true,
          stepSize: 1,
          max: 5,
          userCallback: function (value, index, values) {
            // converting numbes to ranks
            return ['E','D','C','B','A'][value - 1]
          }
        }
      }
    })
  }
}
</script>