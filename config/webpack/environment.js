const { environment } = require('@rails/webpacker')
const erb = require('./loaders/erb')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')
const sass = require('./loaders/sass')
const css = require('./loaders/css')

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)
environment.loaders.prepend('sass', sass)
environment.loaders.prepend('css', css)
environment.loaders.prepend('erb', erb)
module.exports = environment
