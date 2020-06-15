const webpack = require('webpack');
const ExtractTextPlugin = require('extract-text-webpack-plugin');
const path = require('path');
var BundleAnalyzerPlugin = require('webpack-bundle-analyzer').BundleAnalyzerPlugin;

module.exports = {
  devtool: 'cheap-module-eval-source-map',

  entry: {
    application: path.join(__dirname, '/source/assets/javascripts/application.js')
  },

  output: {
    path: path.join(__dirname, '.tmp/dist'),
    filename: 'assets/javascripts/[name].bundle.js'
  },

  resolve: {
    modules: [
      __dirname + '/assets/javascript',
      __dirname + '/assets/stylesheets',
      __dirname + '/node_modules',
    ],
    extensions: ['.js', '.css', '.scss']
  },

  module: {
    rules: [
      {
        test: /\.scss$/,
        use: [
          { loader: 'style-loader', options: { sourceMap: true } },
          { loader: 'css-loader', options: { sourceMap: true } },
          { loader: 'postcss-loader', options: { sourceMap: true } },
          { loader: 'sass-loader', options: { sourceMap: true } }
        ]
      },
      {
        test: /\.js$/,
        exclude: /(node_modules)/,
        use: ['babel-loader']
      }
    ]
  },

  plugins: [
    // Always expose NODE_ENV to webpack, in order to use `process.env.NODE_ENV`
    // inside your code for any environment checks; UglifyJS will automatically
    // drop any unreachable code.
    new webpack.DefinePlugin({
      'process.env': {
        NODE_ENV: JSON.stringify(process.env.NODE_ENV),
      },
    }),

    new BundleAnalyzerPlugin({
      analyzerMode: 'static', // use 'server' to start webserver instead of open file 
      openAnalyzer: false, // open generated webpage automatically upon every bundle
      reportFilename: './../bundle-analyzer.html'
    }),

    new ExtractTextPlugin('assets/stylesheets/[name].bundle.css'),
  ],
};
