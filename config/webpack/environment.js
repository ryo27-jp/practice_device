const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
environment.plugins.prepend('Provides',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jquery: 'jquery'
  })
)

module.exports = environment
