<template>
  <v-card 
  max-width="300"
  >
    <v-row class="text-center">
      <v-col 
      cols="12" 
      sm="5"
      :style="{ background:  cardProps.color }"
      >
        <v-card-text class="font-weight-medium">
          <v-icon color="#000">{{cardProps.icon}}</v-icon>
          {{cardProps.iconText}}
        </v-card-text>
      </v-col>
      <v-col 
      cols="12" 
      sm="7"
      >
      <v-card-text class="font-weight-bold">
        {{cardProps.value}}
      </v-card-text>
      </v-col>
    </v-row>
  </v-card>
</template>

<script>
export default {
  name: "IconCard",
  props: ["cardProps"]
};
</script>