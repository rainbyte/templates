const path = require('path');

const mode = process.env.NODE_ENV || 'development';

module.exports = {
    mode,
    entry: './app/src/web/main.js',
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
        path: path.join(__dirname, 'app/src/main/assets'),
        filename: '[name].js',
        chunkFilename: '[name].[id].js'
    },
    devServer: {
        static: {
            directory: path.join(__dirname, 'app/src/main/assets'),
        },
        port: 8080
    }
}