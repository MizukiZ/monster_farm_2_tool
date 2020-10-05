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
                v-model="search_params.name"
              ></v-text-field>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-select
                v-model="search_params.main_family_type_id"
                clearable
                :items="$options.family_type_selections"
                label="メイン種族"
              ></v-select>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-select
                v-model="search_params.sub_family_type_id"
                clearable
                :items="$options.family_type_selections"
                label="サブ種族"
              ></v-select>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-select
                v-model="search_params.life_apptitude"
                clearable
                :items="$options.rank_selections"
                label="ライフ適性"
              ></v-select>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-select
                v-model="search_params.power_apptitude"
                clearable
                :items="$options.rank_selections"
                label="ちから適性"
              ></v-select>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-select
                v-model="search_params.intelligence_apptitude"
                clearable
                :items="$options.rank_selections"
                label="かしこさ適性"
              ></v-select>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-select
                v-model="search_params.accuracy_apptitude"
                clearable
                :items="$options.rank_selections"
                label="命中適性"
              ></v-select>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-select
                v-model="search_params.avoidance_apptitude"
                clearable
                :items="$options.rank_selections"
                label="回避適性"
              ></v-select>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-select
                v-model="search_params.defence_apptitude"
                clearable
                :items="$options.rank_selections"
                label="丈夫さ適性"
              ></v-select>
            </v-col>
            <v-col cols="12">
              <v-range-slider
                v-model="search_params.life_span"
                max="500"
                min="250"
                thumb-label="always"
                label="寿命"
              ></v-range-slider>
            </v-col>
            <v-col cols="12">
              <v-range-slider
                v-model="search_params.character"
                max="100"
                min="-100"
                thumb-label="always"
                label="善悪"
              ></v-range-slider>
            </v-col>
            <v-col cols="12">
              <v-range-slider
                v-model="search_params.guts_speed"
                max="19"
                min="6"
                thumb-label="always"
                label="G回復"
              ></v-range-slider>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-select
                v-model="search_params.grow_type"
                clearable
                :items="$options.grow_type_selections"
                label="成長タイプ"
              ></v-select>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-select
                v-model="search_params.moving_speed"
                clearable
                :items="$options.rank_selections"
                label="移動スピード"
              ></v-select>
            </v-col>
            <v-col cols="12">
              <v-select
                v-model="search_params.conditions"
                clearable
                :items="$options.condition_selections"
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
const axios = require("axios");
export default {
  name: "SearchDialog",
  props: [],
  data: () => ({
    dialog: false,
    search_params: {
      name: "",
      main_family_type_id: null,
      sub_family_type_id: null,
      life_apptitude: null,
      power_apptitude: null,
      intelligence_apptitude: null,
      accuracy_apptitude: null,
      avoidance_apptitude: null,
      defence_apptitude: null,
      life_span: [250, 500],
      character: [-100, 100],
      guts_speed: [6, 19],
      grow_type: null,
      moving_speed: null,
      conditions: [],
    },
  }),
  family_type_selections: [
    {text: "ピクシー", value: 1},
    {text: "ドラゴン", value: 2},
    {text: "ケンタウロス", value: 3},
    {text: "コロペンドラ", value: 4},
    {text: "ビークロン", value: 5},
    {text: "ヘンガー", value: 6},
    {text: "チャッキー", value: 7},
    {text: "ゴーレム", value: 8},
    {text: "ロードランナー", value: 9},
    {text: "デュラハン", value: 10},
    {text: "アローヘッド", value: 11},
    {text: "ライガー", value: 12},
    {text: "ホッパー", value: 13},
    {text: "ハム", value: 14},
    {text: "バクー", value: 15},
    {text: "ガリ", value: 16},
    {text: "アーケロ", value: 17},
    {text: "グジラ", value: 18},
    {text: "バジャール", value: 19},
    {text: "ニャー", value: 20},
    {text: "ヒノトリ", value: 21},
    {text: "ゴースト", value: 22},
    {text: "メタルナー", value: 23},
    {text: "スエゾー", value: 24},
    {text: "ジール", value: 25},
    {text: "モッチー", value: 26},
    {text: "ジョーカー", value: 27},
    {text: "ネンドロ", value: 28},
    {text: "ゲル", value: 29},
    {text: "ウンディーネ", value: 30},
    {text: "ナイトン", value: 31},
    {text: "モック", value: 32},
    {text: "ダックン", value: 33},
    {text: "プラント", value: 34},
    {text: "モノリス", value: 35},
    {text: "ラウー", value: 36},
    {text: "ワーム", value: 37},
    {text: "ナーガ", value: 38}
    ],
  rank_selections: [
    { text: "E", value: 1 },
    { text: "D", value: 2 },
    { text: "C", value: 3 },
    { text: "B", value: 4 },
    { text: "A", value: 5 },
  ],
  grow_type_selections: [
    { text: "早熟", value: 1 },
    { text: "普通", value: 2 },
    { text: "持続", value: 3 },
    { text: "晩成", value: 4 },
  ],
  condition_selections: [
    { text: "底力", value: 1 },
    { text: "逆上", value: 2 },
    { text: "根性", value: 3 },
    { text: "集中", value: 4 },
    { text: "闘魂", value: 5 },
    { text: "憤怒", value: 6 },
    { text: "我慢", value: 7 },
    { text: "余裕", value: 8 },
    { text: "必死", value: 9 },
    { text: "元気", value: 10 },
    { text: "本気", value: 11 },
    { text: "泥酔", value: 12 },
    { text: "団結", value: 13 },
  ],
  methods: {
    submit() {
      console.log(this.search_params);
      axios
        .get("http://localhost:3000/monster_search.json", {
          params: this.search_params,
        })
        .then((data) => {
          console.log(data);
        });
      // this.dialog = false
    },
    clear() {
      this.name = "";
    },
  },
};
</script>