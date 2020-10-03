<template>
  <v-card width="400" class="text-center">
    <v-list disabled rounded>
      <v-list-item-title
        class="font-weight-bold"
        :style="{ 'align-items': 'center' }"
      >
        適性順序
        <v-divider></v-divider>
      </v-list-item-title>
      <v-list-item-group v-for="(parameter, i) in sortedParamterOrder" :key="i">
        <v-list-item>
          <v-list-item-icon>
            <v-icon color="black">{{
              `mdi-numeric-${i + 1}-box-outline`
            }}</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>
              <v-icon color="black">{{ $parameterIcons[parameter] }}</v-icon>
              {{ parameter }}</v-list-item-title
            >
          </v-list-item-content>
        </v-list-item>
        <v-divider v-show="i != 5"></v-divider>
      </v-list-item-group>
    </v-list>
  </v-card>
</template>

<script>
export default {
  name: "ApptitudeOrder",
  props: ["apptitudeOrderData"],
  data: function () {
    return {
      sortedParamterOrder: [],
    };
  },
  mounted() {
    const v = this;
    //create object of parameter order
    const paramterObject = {};
    this.apptitudeOrderData.forEach((apptitude_order, i) => {
      paramterObject[v.$parameterWordsArray[i]] = apptitude_order;
    });

    this.sortedParamterOrder = Object.keys(paramterObject).sort(function (
      a,
      b
    ) {
      return paramterObject[a] - paramterObject[b];
    });
  },
};
</script>