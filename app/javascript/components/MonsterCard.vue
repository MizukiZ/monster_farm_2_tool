<template>
  <v-card
    link
    :href="`/monsters/${monsterData.no}.json`"
  >
    <v-container fluid ma-0 pa-0>
      <v-row class="text-center" align="center">
        <v-col xs="6" class="font-weight-bold">
          {{ monsterData.name }}
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
export default {
  name: "MonsterCard",
  props: ["monsterData"],
};
</script>