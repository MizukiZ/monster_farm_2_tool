<template>
  <v-card link @click.stop="openDetailDialog">
    <MonsterDetail :monsterData="monsterData" :fromMonsterListDialog="fromMonsterListDialog" ref="detailDialog"/>
    <v-container fluid ma-0 pa-0>
      <v-row class="text-center" align="center">
        <v-col xs="6" class="font-weight-bold">
          {{monsterData.name}}
        </v-col>
        <v-col xs="6">
          <v-col>
            {{monsterData.main_type}}
          </v-col>
          <v-col>
            <v-icon > mdi-close </v-icon>
          </v-col>
          <v-col>
            {{monsterData.sub_type}}
          </v-col>
        </v-col>
      </v-row>
    </v-container>
  </v-card>
</template>

<script>
import MonsterDetail from "./MonsterDetail";
export default {
  components: { MonsterDetail },
  name: "MonsterCard",
  props: ["monsterData", "fromMonsterListDialog"],
  methods: {
    openDetailDialog(){
      this.$refs.detailDialog.updateDialogStatus()
    }
  }
};
</script>