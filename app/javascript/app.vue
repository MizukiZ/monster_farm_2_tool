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
    <IconCard :cardProps="{icon: 'mdi-heart-pulse', iconText: '寿命', value: '360週', color: this.$colors.themeColor1}"/>
    <IconCard :cardProps="{icon: 'mdi-chart-line', iconText: '成長', value: '早熟', color: this.$colors.intelligence}"/>
    <IconCard :cardProps="{icon: 'mdi-run-fast', iconText: '移動', value: 'C', color: this.$colors.avoidance}"/>
    <IconCard :cardProps="{icon: 'mdi-battery-charging', iconText: 'G回復', value: '12', color: this.$colors.accuracy}"/>
    <IconCard :cardProps="{icon: 'mdi-account-switch-outline', iconText: '善悪', value: '55', color: this.$colors.defence}"/>
    <IconCard :cardProps="{icon: 'mdi-account-convert', iconText: '状態', value: '底力,根性', color: this.$colors.power}"/>

    <ApptitudeOrder :apptitudeOrderData="[2,3,5,4,1,6]"/>
  </v-app>
</template>

<script>
import ApptitudeChart from "./components/ApptitudeChart";
import ParameterChart from "./components/ParameterChart";
import IconCard from "./components/IconCard";
import ApptitudeOrder from "./components/ApptitudeOrder";
export default {
  components: {
    ApptitudeChart,
    ParameterChart,
    IconCard,
    ApptitudeOrder,
  },
  data: function () {
    return {};
  },
};
</script>

<style scoped></style>
