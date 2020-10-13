import Vue from 'vue'
import vuetify from '../plugins/vueitfy'
import App from '../app.vue'

// Global variables
Vue.prototype.$parameterWordsArray = ["ライフ", "ちから", "かしこさ", "命中", "回避", "丈夫さ"]
Vue.prototype.$parameterIcons = {
  "ライフ": 'mdi-heart',
  "ちから": 'mdi-arm-flex-outline',
  "かしこさ": 'mdi-head-flash-outline',
  "命中": 'mdi-bullseye-arrow',
  "回避": 'mdi-shoe-sneaker',
  "丈夫さ": 'mdi-shield-alert-outline'
}
Vue.prototype.$ranksArray = ['E','D','C','B','A']
Vue.prototype.$colors = {
  themeColor1: '#E48B03',
  life: '#E2DB67',
  power: '#DF5556',
  intelligence: '#5DDC5F',
  accuracy: '#CE50CF',
  avoidance: '#45CDC9',
  defence: '#4E52CF',
}

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    vuetify,
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)
})
