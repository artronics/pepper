var webpack = require('webpack');
var webpackTargetElectronRenderer = require('webpack-target-electron-renderer');

var config = {

  entry: [
    'webpack-hot-middleware/client?reload=true&path=http://localhost:9000/__webpack_hmr',
    './src/index.js'
  ],
  output: {
    path: __dirname + '/dist',
    publicPath: 'http://localhost:9000/dist/',
    filename: 'bundle.js'
  },

  resolve: {
    modulesDirectories: ['node_modules'],
    extensions: ['', '.js', '.elm']
  },

  module: {
    loaders: [
      {
        test: /\.html$/,
        exclude: /node_modules/,
        loader: 'file?name=[name].[ext]'
      },
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        loader: 'elm-webpack?pathToMake=node_modules/.bin/elm-make'
      },
      {
        test: /\.scss$/,
        loaders: ["style", "css", "sass"]
      }
    ],

    noParse: /\.elm$/
  },

  plugins: [
    new webpack.HotModuleReplacementPlugin(),
  ],
  devServer: {
    inline: true,
    stats: 'errors-only'
  }
};
config.target = webpackTargetElectronRenderer(config);

module.exports = config;