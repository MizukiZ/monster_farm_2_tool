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
          <v-row>
            <v-col
              v-for="monster in bestMatchMonsters"
              :key="monster.no"
              sm="12"
              md="6"
              lg="4"
            >
              <MonsterCard :monsterData="monster" :fromMonsterListDialog="true"/>
            </v-col>
          </v-row>
        </v-container>
        <!-- <div class="text-center">
          <v-pagination
            v-model="page"
            :length="totalPages"
            :total-visible="9"
            >
          </v-pagination>
        </div> -->
      </v-card>
    </v-dialog>
  </v-row>
</template>

<script>
const axios = require("axios");
export default {
  props: ["monsterNo"],
  components: { MonsterCard: () => import('./MonsterCard.vue') },
  name: "MonsterListDialog",
  data() {
    return {
      bestMatchMonsters: [],
      dialog: false,
    };
  },
  watch: {
    dialog: function (status) {
      if (status) {
        axios
          .get(
            `http://localhost:3000/monsters/${this.monsterNo}/best_matches.json`
          )
          .then((data) => {
            this.bestMatchMonsters = data.data.monsters;
          });
      }
    },
  },
  methods: {},
};
</script>