const {resolve} = require("path");

module.exports = {
    entry: './src/index.tsx',
    module: {
        rules: [
            { test: /\.svg$/, use: 'svg-inline-loader' },
            {
                test: /\.tsx?$/,
                use: 'ts-loader',
                exclude: /node_modules/,
            },
        ]
    },
    resolve: {
        extensions: [".tsx", ".ts", ".js"],
    },
    output: {
        path: resolve(__dirname, 'dist'),
        filename: 'index_bundle.js'
    }
}