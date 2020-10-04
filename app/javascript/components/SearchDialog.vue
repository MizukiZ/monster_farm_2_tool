<template>
  <v-dialog v-model="dialog" persistent max-width="800px">
    <template v-slot:activator="{ on, attrs }">
      <v-btn color="primary" outlined icon v-bind="attrs" v-on="on">
        <v-icon>mdi-magnify-scan</v-icon>
      </v-btn>
    </template>
    <v-card>
      <v-card-title>
        <span class="headline">モンスター検索</span>
      </v-card-title>
      <v-card-text>
        <v-container>
          <v-row>
            <v-col cols="12" sm="6" md="4">
              <v-text-field
                label="モンスター名"
                v-model="searchParams.name"
              ></v-text-field>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-select
                v-model="searchParams.mainType"
                clearable
                :items="[
                  { text: 'A', value: 1 },
                  { text: 'B', value: 2 },
                  { text: 'C', value: 3 },
                ]"
                label="メイン種族"
              ></v-select>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-select
                v-model="searchParams.subType"
                clearable
                :items="[
                  { text: 'A', value: 1 },
                  { text: 'B', value: 2 },
                  { text: 'C', value: 3 },
                ]"
                label="サブ種族"
              ></v-select>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-select
                v-model="searchParams.lifeApptitude"
                clearable
                :items="$options.rankSelections"
                label="ライフ適性"
              ></v-select>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-select
                v-model="searchParams.powerApptitude"
                clearable
                :items="$options.rankSelections"
                label="ちから適性"
              ></v-select>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-select
                v-model="searchParams.intelligenceApptitude"
                clearable
                :items="$options.rankSelections"
                label="かしこさ適性"
              ></v-select>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-select
                v-model="searchParams.accuracyApptitude"
                clearable
                :items="$options.rankSelections"
                label="命中適性"
              ></v-select>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-select
                v-model="searchParams.avoidanceApptitude"
                clearable
                :items="$options.rankSelections"
                label="回避適性"
              ></v-select>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-select
                v-model="searchParams.defenceApptitude"
                clearable
                :items="$options.rankSelections"
                label="丈夫さ適性"
              ></v-select>
            </v-col>
            <v-col cols="12">
              <v-range-slider
                v-model="searchParams.lifeSpan"
                max="500"
                min="250"
                thumb-label="always"
                label="寿命"
              ></v-range-slider>
            </v-col>
            <v-col cols="12">
              <v-range-slider
                v-model="searchParams.character"
                max="100"
                min="-100"
                thumb-label="always"
                label="善悪"
              ></v-range-slider>
            </v-col>
            <v-col cols="12">
              <v-range-slider
                v-model="searchParams.gutsSpeed"
                max="19"
                min="6"
                thumb-label="always"
                label="G回復"
              ></v-range-slider>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-select
                v-model="searchParams.growType"
                clearable
                :items="[
                  { text: '早熟', value: 1 },
                  { text: '普通', value: 2 },
                  { text: '持続', value: 3 },
                  { text: '晩成', value: 4 },
                ]"
                label="成長タイプ"
              ></v-select>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-select
                v-model="searchParams.movingSpeed"
                clearable
                :items="$options.rankSelections"
                label="移動スピード"
              ></v-select>
            </v-col>
            <v-col cols="12">
              <v-select
                v-model="searchParams.conditions"
                clearable
                :items="[
                  { text: '底力', value: 1 },
                  { text: '逆上', value: 2 },
                  { text: '根性', value: 3 },
                  { text: '集中', value: 4 },
                  { text: '闘魂', value: 5 },
                  { text: '憤怒', value: 6 },
                  { text: '我慢', value: 7 },
                  { text: '余裕', value: 8 },
                  { text: '必死', value: 9 },
                  { text: '元気', value: 10 },
                  { text: '本気', value: 11 },
                  { text: '泥酔', value: 12 },
                  { text: '団結', value: 13 },
                ]"
                attach
                chips
                label="状態変化"
                multiple
              ></v-select>
            </v-col>
          </v-row>
        </v-container>
      </v-card-text>
      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn color="blue darken-1" text @click="dialog = false">
          Close
        </v-btn>
        <v-btn color="blue darken-1" text @click="submit">Search</v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>
      
<script>
export default {
  name: "SearchDialog",
  props: [],
  data: () => ({
    dialog: false,
    searchParams: {
      name: "",
      mainType: null,
      subType: null,
      lifeApptitude: null,
      powerApptitude: null,
      intelligenceApptitude: null,
      accuracyApptitude: null,
      avoidanceApptitude: null,
      defenceApptitude: null,
      lifeSpan: [250, 500],
      character: [-100, 100],
      gutsSpeed: [6, 19],
      growType: null,
      movingSpeed: null,
      conditions: [],
    },
  }),
  rankSelections: [
    { text: "E", value: 1 },
    { text: "D", value: 2 },
    { text: "C", value: 3 },
    { text: "B", value: 4 },
    { text: "A", value: 5 },
  ],
  methods: {
    submit() {
      console.log(this.searchParams);

      // this.dialog = false
    },
    clear() {
      this.name = "";
    },
  },
};
</script>