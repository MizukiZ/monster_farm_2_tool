<script>
import { HorizontalBar } from "vue-chartjs";
export default {
  name: "ParameterChart",
  extends: HorizontalBar,
  props: ["parameterData", "dialogStatus"],
  watch: {
    dialogStatus: function (status) {
      if (status) {
        this.renderParamsChart();
      }
    },
  },
  methods: {
    renderParamsChart() {
      // inject parameter into parameter words
      const labels_data = this.$parameterWordsArray.map((paramWord, i) => {
        return `${paramWord} ${this.parameterData[i]}`;
      });
      this.renderChart(
        {
          labels: labels_data,
          datasets: [
            {
              backgroundColor: [
                this.$colors.life,
                this.$colors.power,
                this.$colors.intelligence,
                this.$colors.accuracy,
                this.$colors.avoidance,
                this.$colors.defence,
              ],
              data: this.parameterData,
            },
          ],
        },
        {
          title: { display: true, text: "種族値パラメータ", fontSize: 16 },
          legend: { display: false },
          tooltips: { enabled: false },
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
  },
};
</script>