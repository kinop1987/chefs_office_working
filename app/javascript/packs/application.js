require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import Vue from 'vue'
import App from './App.vue'

const app = new Vue({
   el: '#app',
   render: h => h(App)
})