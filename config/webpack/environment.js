const { environment } = require('@rails/webpacker');

const { BundleAnalyzerPlugin } = require('webpack-bundle-analyzer');

environment.plugins.append(
    'BundleAnalyzer',
    new BundleAnalyzerPlugin()
);

module.exports = environment;
