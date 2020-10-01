<template>
  <v-app>
    <ApptitudeChart :apptitudeData="[4,5,5,4,2,3]" />
    <ParameterChart :parameterData="[120,170,190,100,80,130]"/>
  </v-app>
</template>

<script>
import ApptitudeChart from './components/ApptitudeChart'
import ParameterChart from './components/ParameterChart'
export default {
  components:{
    ApptitudeChart,
    ParameterChart,
  },
  data: function () {
    return {}
  }
}
</script>

<style scoped></style>
