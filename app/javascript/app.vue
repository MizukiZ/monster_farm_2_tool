<template>
<v-app>

  <v-app-bar app>
    <v-toolbar-title>モンスターファーム２　サーチライト</v-toolbar-title>
    <v-spacer></v-spacer>
    <SearchDialog @searchResultUpdate="handleSearchResult" />
  </v-app-bar>
  <v-main>
    <v-row>
      <v-col
        v-for="monster in searchResults"
        :key="monster.no"
        sm="12"
        md="6"
        lg="4"
      >
        <MonsterCard :monsterData="monster"/>
      </v-col>
    </v-row>
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
import MonsterCard from "./components/MonsterCard";
export default {
  components: {
    ApptitudeChart,
    ParameterChart,
    IconCard,
    ApptitudeOrder,
    SearchDialog,
    MonsterCard
  },
  data: function () {
    return {
      searchResults: []
    };
  },
  methods: {
    handleSearchResult(newSearchResult) {
      this.searchResults = newSearchResult 
    }
  }
};
</script>

<style scoped></style>
