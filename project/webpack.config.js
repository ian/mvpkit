const path = require('path');
const webpack = require("webpack");
const ExtractTextPlugin = require("extract-text-webpack-plugin");

module.exports = {
  entry: [
    './assets/javascripts/pack.js',
    './assets/stylesheets/style.scss',
  ],
  output: {
    path: path.join(__dirname, 'public', 'assets'),
    filename: 'pack.js',
    publicPath: '/assets',
  },
  plugins: [new webpack.ProvidePlugin({ $: "jquery", jQuery: "jquery" })],
  module: {
    loaders: [
    {
      test: /\.(js|jsx)$/,
      include: path.join(__dirname, '/app'),
      exclude: path.join(__dirname, '/node_modules'),
      loader: 'babel-loader',
      query: {
        presets: ['es2015', 'react'],
        plugins: ["transform-object-rest-spread"]
      }
    },
    {
        test: /\.(html|mustache)$/,
        loader: 'mustache'
        // loader: 'mustache?minify'
        // loader: 'mustache?{ minify: { removeComments: false } }'
        // loader: 'mustache?noShortcut'
    },
    {
      test: /\.(eot|svg|ttf|woff(2)?)(\?v=\d+\.\d+\.\d+)?/,
      loader: 'url',
    },
    {
      test: /\.coffee$/,
      loader: "coffee-loader"
    },
    {
      test: /\.(coffee\.md|litcoffee)$/,
      loader: "coffee-loader?literate"
    },
    {
      test: /\.(css|scss|sass)$/,
      loader: ExtractTextPlugin.extract('css!sass?indentedSyntax=true&sourceMap=true')
    }]
  },
  resolve: {
    root: path.resolve('./assets'),
    // tell webpack which extensions to auto search when it resolves modules. With this,
    // you'll be able to do `require('./utils')` instead of `require('./utils.js')`
    extensions: ['', '.js'],
    // by default, webpack will search in `web_modules` and `node_modules`. Because we're using
    // Bower, we want it to look in there too
    // modulesDirectories: [ 'node_modules' ],
  },
  sassLoader: {
    includePaths: [path.resolve(__dirname, "./node_modules")]
  },
  plugins: [
    new ExtractTextPlugin('style.css')
  ]
};
