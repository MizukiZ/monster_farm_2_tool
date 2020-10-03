<template>
  <v-app>
    <v-container>
      <v-row>
        <v-col cols="12" md="6" sm="12">
          <ParameterChart :parameterData="[120, 110, 90, 100, 140, 70]" />
        </v-col>
        <v-col cols="12" md="6" sm="12">
          <ApptitudeChart :apptitudeData="[4, 3, 2, 3, 4, 1]" />
        </v-col>
      </v-row>
    </v-container>
    <IconCard :cardProps="{icon: 'mdi-heart-pulse', iconText: '寿命', value: '360週', color: ''}"/>
    <IconCard :cardProps="{icon: 'mdi-chart-line', iconText: '成長', value: '早熟', color: ''}"/>
    <IconCard :cardProps="{icon: 'mdi-run-fast', iconText: '移動', value: 'C', color: ''}"/>
    <IconCard :cardProps="{icon: 'mdi-battery-charging', iconText: 'G回復', value: '12', color: ''}"/>
    <IconCard :cardProps="{icon: 'mdi-account-switch-outline', iconText: '善悪', value: '55', color: ''}"/>
    <IconCard :cardProps="{icon: 'mdi-account-convert', iconText: '状態', value: '底力,根性', color: ''}"/>
  </v-app>
</template>

<script>
import ApptitudeChart from "./components/ApptitudeChart";
import ParameterChart from "./components/ParameterChart";
import IconCard from "./components/IconCard";
export default {
  components: {
    ApptitudeChart,
    ParameterChart,
    IconCard,
  },
  data: function () {
    return {};
  },
};
</script>

<style scoped></style>
