<template>
  <v-app>
    <v-app-bar app>
      <v-toolbar-title>モンスターファーム２　サーチライト</v-toolbar-title>
      <v-spacer></v-spacer>
      <SearchDialog @searchSubmit="searchSubmit" @searchResultUpdate="handleSearchResult" ref="searchDialog" :page="page" />
    </v-app-bar>
    <v-main>

    <v-progress-circular
      v-if="loading"
      :width="3"
      color="red"
      indeterminate
    ></v-progress-circular>

      <h2 v-show="searchResults.length == 0">検索結果はありません</h2>
      <v-container fluid>
        <v-row>
          <v-col
            v-for="monster in searchResults"
            :key="monster.no"
            cols="12"
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
      loading: false,
      searchResults: [],
      totalPages: 0,
      page: 1,
    };
  },
  methods: {
    searchSubmit() {
      this.loading = true
    },
    handleSearchResult(newSearchResult) {
      this.searchResults = newSearchResult.monsters;
      this.totalPages = newSearchResult.pagination_total_pages;

      this.loading = false
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
