<template>
  <v-app :style="{background: '#F4F5FA'}">
    <v-app-bar app dark>
      <v-toolbar-title :style="{ fontSize: $vuetify.breakpoint.smAndDown ? '1em' : '1.25em' }">モンスターファーム２　サーチライト</v-toolbar-title>
      <v-spacer></v-spacer>
      <SearchDialog @searchSubmit="searchSubmit" @searchResultUpdate="handleSearchResult" :page="page" />
    </v-app-bar>
    <v-main>

    <OverlayProgressIcon :loading="loading" />
      <v-container fluid>
      <v-row v-show="searchResults.length == 0">
        <v-col cols="12">
          <h3 class="text-center">検索結果はありません</h3>
        </v-col>
      </v-row>
      
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
            dark
            v-show="searchResults.length != 0"
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
import SearchDialog from "./components/SearchDialog"
import MonsterCard from "./components/MonsterCard";
import OverlayProgressIcon from "./components/OverlayProgressIcon";

export default {
  components: {
    ApptitudeChart,
    ParameterChart,
    IconCard,
    ApptitudeOrder,
    SearchDialog,
    MonsterCard,
    OverlayProgressIcon
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
    searchSubmit(pageNum) {
      this.page = pageNum
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
