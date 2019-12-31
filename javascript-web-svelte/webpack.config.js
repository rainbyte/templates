const path = require('path');

const mode = process.env.NODE_ENV || 'development';

module.exports = {
    mode,
    entry: './src/main.js',
    resolve: {
        alias: {
            svelte: path.resolve('node_modules', 'svelte')
        },
        extensions: ['.mjs', '.js', '.svelte'],
        mainFields: ['svelte', 'browser', 'module', 'main']
    },
    module: {
        rules: [
            {
                test: /\.svelte$/,
                exclude: /node_modules/,
                use: {
                    loader: 'svelte-loader',
                    options: {
                        hotReload: true
                    }
                }
            }
        ]
    },
    output: {
        path: path.join(__dirname, 'dist'),
        filename: '[name].js',
        chunkFilename: '[name].[id].js'
    },
    devServer: {
        contentBase: path.join(__dirname, 'dist')
    }
}