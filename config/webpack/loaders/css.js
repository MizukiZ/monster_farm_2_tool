module.exports = {
  test: /\.css$/i,
  use: [
      'vue-style-loader',
      'css-loader',
  ],
}