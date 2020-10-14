<template>
  <v-row justify="center">
    <v-dialog v-model="dialog" fullscreen>
      <template v-slot:activator="{ on }">
        <v-btn v-on="on">
          合体相性検索
          <v-icon>mdi-heart</v-icon>
        </v-btn>
      </template>
      <v-card>
        <v-toolbar>
          <v-btn @click="dialog = false">
            <v-icon>mdi-close</v-icon>
          </v-btn>
          <v-spacer></v-spacer>
          <v-toolbar-title>良相性モンスター一覧</v-toolbar-title>
          <v-spacer></v-spacer>
        </v-toolbar>
        <v-container fluid>
          <v-progress-circular
            v-if="loading"
            :width="3"
            color="red"
            indeterminate
          ></v-progress-circular>

          <v-row>
            <v-col
              v-for="monster in bestMatchMonsters"
              :key="monster.no"
              cols="12"
              md="6"
              lg="4"
            >
              <MonsterCard
                :monsterData="monster"
                :fromMonsterListDialog="true"
              />
            </v-col>
          </v-row>
        </v-container>
      </v-card>
    </v-dialog>
  </v-row>
</template>

<script>
const axios = require("axios");
export default {
  props: ["monsterNo"],
  components: { MonsterCard: () => import("./MonsterCard.vue") },
  name: "MonsterListDialog",
  data() {
    return {
      bestMatchMonsters: [],
      dialog: false,
      loading: false,
    };
  },
  watch: {
    dialog: function (status) {
      if (status) {
        this.loading = true;

        axios
          .get(
            Routes.monster_best_matches_path(this.monsterNo, { format: "json" })
          )
          .then((data) => {
            this.bestMatchMonsters = data.data.monsters;
            this.loading = false;
          });
      }
    },
  },
  methods: {},
};
</script>