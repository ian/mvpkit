const path = require('path');
const fs = require('fs');
const webpack = require("webpack");
const ExtractTextPlugin = require("extract-text-webpack-plugin");

const prod = process.argv.indexOf('-p') !== -1;
const css_output_template = "stylesheets/[name]-compiled.css";
const js_output_template = "javascripts/[name]-compiled.js";

module.exports = {
  context: __dirname + "/app/webpack",
  entry: {
    pack: ["./javascripts/pack.js", "./stylesheets/pack.scss"]
  },
  devtool: 'source-map',
  plugins: [new webpack.ProvidePlugin({ $: "jquery", jQuery: "jquery" })],
  output: {
    path: __dirname + "/app/assets",
    filename: js_output_template,
  },
  module: {
    loaders: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
        query: {
          presets: ['es2015']
        }
      },
      // {
      //   test: /\.(css|scss|sass)$/,
      //   include: /node_modules/,
      //   // loader: ExtractTextPlugin.extract("css!sass")
      //   // loader: ExtractTextPlugin.extract('style-loader!css-loader!sass-loader')
      //   loaders: ["style-loader", "css-loader", "sass-loader"]
      // },
      {
        test: /\.scss$/,
        loader: ExtractTextPlugin.extract({fallback: "style-loader", use: "css-loader!sass-loader"})
      }
    ]
  },
  plugins: [
    new ExtractTextPlugin(css_output_template),

    function() {
      // delete previous outputs
      this.plugin("compile", function() {
        let basepath = __dirname + "/public";
        // let paths = ["/javascripts", "/stylesheets"];
        let paths = ["/stylesheets"];

        for (let x = 0; x < paths.length; x++) {
          const asset_path = basepath + paths[x];

          fs.readdir(asset_path, function(err, files) {
            if (files === undefined) {
              return;
            }

            for (let i = 0; i < files.length; i++) {
              fs.unlinkSync(asset_path + "/" + files[i]);
            }
          });
        }
      });

      // output the fingerprint
      // this.plugin("done", function(stats) {
      //   let output = "ASSET_FINGERPRINT = \"" + stats.hash + "\""
      //   fs.writeFileSync("config/initializers/fingerprint.rb", output, "utf8");
      // });
    }
  ]
};
