<script>
import { Radar } from "vue-chartjs";
export default {
  name: "ApptitudeChart",
  extends: Radar,
  props: ["apptitudeData", "dialogStatus"],
  watch: {
    dialogStatus: function (status) {
      if (status) {
        this.renderApptitudeChart();
      }
    },
  },
  methods: {
    renderApptitudeChart() {
      const v = this;

      // inject apptitudes into parameter words
      const labelsData = v.$parameterWordsArray.map((paraWord, i) => {
        const apptitudeInInt = this.apptitudeData[i];
        const apptitudeInRank = v.$ranksArray[apptitudeInInt - 1];
        return `${paraWord} ${apptitudeInRank}`;
      });

      this.renderChart(
        {
          labels: labelsData,
          datasets: [
            {
              data: this.apptitudeData,
              backgroundColor: "rgba(95, 248, 218, 0.4)",
              borderColor: "rgba(35, 151, 128 , 0.7)",
            },
          ],
        },
        {
          title: { display: true, text: "パラメーター適性", fontSize: 16 },
          legend: { display: false },
          tooltips: { enabled: false },
          responsive: true,
          maintainAspectRatio: false,
          scale: {
            pointLabels: { fontStyle: "bold", fontSize: 12 },
            ticks: {
              fontStyle: "bold",
              beginAtZero: true,
              stepSize: 1,
              max: 5,
              userCallback: function (value, index, values) {
                // converting numbes to ranks
                return v.$ranksArray[value - 1];
              },
            },
          },
        }
      );
    },
  },
};
</script>