<template>
  <v-app>
    <!-- <ApptitudeChart :chartData="[4,5,5,4,2,3]" /> dynamically add the chart data :) -->
  </v-app>
</template>

<script>
import ApptitudeChart from './components/ApptitudeChart'
export default {
  components:{
    ApptitudeChart,
  },
  data: function () {
    return {}
  }
}
</script>

<style scoped></style>
