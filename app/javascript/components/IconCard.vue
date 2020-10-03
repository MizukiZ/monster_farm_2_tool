<template>
  <v-card width="300">
    <v-container fluid ma-0 pa-0>
    <v-row class="text-center">
      <v-col xs="5" :style="{ background: cardProps.color }">
        <v-card-text class="font-weight-bold white--text">
          <v-icon color="#fff">{{ cardProps.icon }}</v-icon>
          {{ cardProps.iconText }}
        </v-card-text>
      </v-col>
      <v-col xs="7">
        <v-card-text class="font-weight-bold">
          {{ cardProps.value }}
        </v-card-text>
      </v-col>
    </v-row>
    </v-container>
  </v-card>
</template>

<script>
export default {
  name: "IconCard",
  props: ["cardProps"],
};
</script>