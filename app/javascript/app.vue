<template>
  <v-app>
    <v-container>
      <v-row>
        <v-col sm="6">
          <ParameterChart :parameterData="[120, 170, 190, 100, 80, 130]" />
        </v-col>
        <v-col sm="6">
          <ApptitudeChart :apptitudeData="[4, 5, 5, 4, 2, 3]" />
        </v-col>
      </v-row>
    </v-container>
  </v-app>
</template>

<script>
import ApptitudeChart from "./components/ApptitudeChart";
import ParameterChart from "./components/ParameterChart";
export default {
  components: {
    ApptitudeChart,
    ParameterChart,
  },
  data: function () {
    return {};
  },
};
</script>

<style scoped></style>
