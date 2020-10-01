<script>
import { HorizontalBar } from "vue-chartjs";
export default {
  name: "ParameterChart",
  extends: HorizontalBar,
  props: ["parameterData"],
  mounted() {
    this.renderChart(
      {
        labels: ["ライフ", "ちから", "かしこさ", "命中", "回避", "丈夫さ"],
        datasets: [
          {
            backgroundColor: [
              "#E2DB67",
              "#DF5556",
              "#5DDC5F",
              "#CE50CF",
              "#45CDC9",
              "#4E52CF",
            ],
            data: this.parameterData,
          },
        ],
      },
      {
        title: { display: true, text: "種族値パラメータ", fontSize: 16 },
        legend: { display: false },
        responsive: true,
        maintainAspectRatio: false,
        scales: {
          xAxes: [
            {
              ticks: {
                fontStyle: "bold",
                beginAtZero: true,
                max: 250,
                stepSize: 100,
              },
            },
          ],
          yAxes: [
            {
              ticks: { fontStyle: "bold" },
            },
          ],
        },
      }
    );
  },
};
</script>