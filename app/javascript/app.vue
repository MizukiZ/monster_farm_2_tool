<template>
  <v-app>
    <v-app-bar app>
      <v-toolbar-title>モンスターファーム２　サーチライト</v-toolbar-title>
      <v-spacer></v-spacer>
      <SearchDialog @searchResultUpdate="handleSearchResult" ref="searchDialog" :page="page" />
    </v-app-bar>
    <v-main>
      <h2 v-show="searchResults.length == 0">検索結果はありません</h2>
      <v-container fluid>
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
        <div class="text-center">
          <v-pagination
            v-model="page"
            :length="totalPages"
            :total-visible="9"
            >
          </v-pagination>
        </div>
      </v-container>
    </v-main>
    <v-footer app>
      <!-- -->
    </v-footer>
  </v-app>
</template>

<script>
const axios = require("axios");

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
    MonsterCard,
  },
  data: function () {
    return {
      searchResults: [],
      totalPages: 0,
      page: 1,
    };
  },
  methods: {
    handleSearchResult(newSearchResult) {
      this.searchResults = newSearchResult.monsters;
      this.totalPages = newSearchResult.pagination_total_pages;
    },
  },
  mounted() {
    //this is only for debug purposes
    // axios
    //   .get("/monster_search.json", {
    //     params: { main_family_type_id: 8 },
    //   })
    //   .then((data) => {
    //     this.searchResults = data.data.monsters;
    //     this.totalPages = data.data.pagination_total_pages;
    //   });
  },
};
</script>

<style scoped></style>
