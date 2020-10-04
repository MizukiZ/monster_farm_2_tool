<template>
<v-app>

  <v-app-bar app>
    <v-toolbar-title>モンスターファーム２　サーチライト</v-toolbar-title>
    <v-spacer></v-spacer>
    <SearchDialog/>
  </v-app-bar>

  <!-- Sizes your content based upon application components -->
  <v-main>

    <!-- Provides the application the proper gutter -->
    <v-container fluid>
      
    </v-container>
  </v-main>

  <v-footer app>
    <!-- -->
  </v-footer>
</v-app>
</template>

<script>
import ApptitudeChart from "./components/ApptitudeChart";
import ParameterChart from "./components/ParameterChart";
import IconCard from "./components/IconCard";
import ApptitudeOrder from "./components/ApptitudeOrder";
import SearchDialog from "./components/SearchDialog";
export default {
  components: {
    ApptitudeChart,
    ParameterChart,
    IconCard,
    ApptitudeOrder,
    SearchDialog,
  },
  data: function () {
    return {};
  },
};
</script>

<style scoped></style>
