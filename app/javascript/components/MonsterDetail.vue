<template>
  <v-row justify="center">
    <v-dialog
      v-model="dialog"
      fullscreen
      transition="dialog-bottom-transition"
      eager
    >
      <v-card>
        <v-app-bar fixed>
          <v-btn @click="dialog = false">
            <v-icon>mdi-close</v-icon>
          </v-btn>
          <v-spacer></v-spacer>
          <v-toolbar-title :style="{ fontSize: $vuetify.breakpoint.smAndDown ? '1em' : '1.25em' }">
            詳細データ
          </v-toolbar-title>
          <v-spacer></v-spacer>
          <MonsterListDialog :monsterNo="monsterData.no" v-show="!fromMonsterListDialog" />
        </v-app-bar>

        <v-row class="text-center font-weight-bold" :style="{ fontSize: $vuetify.breakpoint.smAndDown ? '1em' : '1.25em' }">
          <v-col cols='12'>
            <div>
              {{`No.${monsterData.no}`}}
            </div>
          </v-col>
          <v-col cols='12'>
            <div>
              {{
                `${monsterData.name} (${monsterData.main_type} x ${monsterData.sub_type})`
              }}
            </div>
          </v-col>
        </v-row>

        <v-row>
          <v-col cols="12" md="6" sm="12">
            <IconCard
              :cardProps="{
                icon: 'mdi-heart-pulse',
                iconText: '寿命',
                value: `${monsterData.life_span}週`,
                color: this.$colors.themeColor1,
              }"
            />
            <IconCard
              :cardProps="{
                icon: 'mdi-chart-line',
                iconText: '成長',
                value: monsterData.grow_type,
                color: this.$colors.intelligence,
              }"
            />
            <IconCard
              :cardProps="{
                icon: 'mdi-run-fast',
                iconText: '移動',
                value: this.$ranksArray[monsterData.moving_speed - 1],
                color: this.$colors.avoidance,
              }"
            />
            <IconCard
              :cardProps="{
                icon: 'mdi-battery-charging',
                iconText: 'G回復',
                value: monsterData.guts_speed,
                color: this.$colors.accuracy,
              }"
            />
            <IconCard
              :cardProps="{
                icon: 'mdi-account-switch-outline',
                iconText: '善悪',
                value: monsterData.character,
                color: this.$colors.defence,
              }"
            />
            <IconCard
              :cardProps="{
                icon: 'mdi-account-convert',
                iconText: '状態',
                value: monsterData.conditions,
                color: this.$colors.power,
              }"
            />
          </v-col>
          <v-col cols="12" md="6" sm="12">
            <ApptitudeChart
              :apptitudeData="[
                monsterData.parameters.life_apptitude,
                monsterData.parameters.power_apptitude,
                monsterData.parameters.intelligence_apptitude,
                monsterData.parameters.accuracy_apptitude,
                monsterData.parameters.avoidance_apptitude,
                monsterData.parameters.defence_apptitude,
              ]"
              :dialogStatus="dialog"
            />
          </v-col>
        </v-row>

        <v-row>
          <v-col cols="12" md="6" sm="12">
            <ParameterChart
              :parameterData="[
                monsterData.parameters.life,
                monsterData.parameters.power,
                monsterData.parameters.intelligence,
                monsterData.parameters.accuracy,
                monsterData.parameters.avoidance,
                monsterData.parameters.defence,
              ]"
              :dialogStatus="dialog"
            />
          </v-col>
          <v-col cols="12" md="6" sm="12">
            <ApptitudeOrder
              :apptitudeOrderData="[
                monsterData.parameters.life_apptitude_index,
                monsterData.parameters.power_apptitude_index,
                monsterData.parameters.intelligence_apptitude_index,
                monsterData.parameters.accuracy_apptitude_index,
                monsterData.parameters.avoidance_apptitude_index,
                monsterData.parameters.defence_apptitude_index,
              ]"
            />
          </v-col>
        </v-row>
      </v-card>
    </v-dialog>
  </v-row>
</template>

<script>
import ApptitudeChart from "./ApptitudeChart";
import ParameterChart from "./ParameterChart";
import ApptitudeOrder from "./ApptitudeOrder";
import IconCard from "./IconCard";
import MonsterListDialog from "./MonsterListDialog";

export default {
  name: "MonsterDetail",
  components: {
    ApptitudeChart,
    ParameterChart,
    ApptitudeOrder,
    IconCard,
    MonsterListDialog,
  },
  data() {
    return {
      dialog: false,
    };
  },
  props: ["monsterData", "fromMonsterListDialog"],
  methods: {
    updateDialogStatus() {
      this.dialog = true;
    },
  },
};
</script>