var webpack = require('webpack');

module.exports = {
  // entry: "./app/js/main.js",
  output: {
    path: "/dist/js",
    filename: "main.js"
  },
  devtool: "inline-source-map",
  module: {
    loaders: [
      {test: /\.js$/, exclude: /node_modules/, loader: "babel-loader"},
      {test: /\.jsx$/, loader: 'babel?cacheDirectory' }
    ]
  },
  resolve: {
    extensions: ['', '.js', '.jsx']
  },
  plugins: [
    new webpack.ProvidePlugin({//jqueryはグローバルに出す設定。これでrequireせず使えるのでjqueryプラグインもそのまま動く。
      jQuery: "jquery",
      $: "jquery",
      jquery: "jquery"
    })
  ]
}
