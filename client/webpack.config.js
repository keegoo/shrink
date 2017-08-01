var webpack = require('webpack');
 
module.exports = {
  entry: './src/App.jsx',
  output: {
    filename: './../public/bundle.js'
  },
  externals: {
    'Config': JSON.stringify({host: "http://127.0.0.1:3000"})
  },
  module: {
    loaders: [
      {
        test: /\.jsx?$/,
        loader: "babel-loader",
        query: {
          plugins: ['transform-class-properties'],
          presets: ['es2015', 'react'],
        }
      }
    ]
  }
};