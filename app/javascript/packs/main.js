import Vue from 'vue'
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'
import App from '../app.vue'

Vue.use(Vuetify)

// Global variables
Vue.prototype.$parameterWordsArray = ["ライフ", "ちから", "かしこさ", "命中", "回避", "丈夫さ"]
Vue.prototype.$ranksArray = ['E','D','C','B','A']
Vue.prototype.$colors = {
  life: '#E2DB67',
  power: '#DF5556',
  intelligence: '#5DDC5F',
  accuracy: '#CE50CF',
  avoidance: '#45CDC9',
  defence: '#4E52CF',
}

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    vuetify: new Vuetify(),
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)
})
