const {resolve} = require("path");
const HtmlWebpackPlugin = require('html-webpack-plugin')
module.exports = {
    entry: './src/index.tsx',
    output: {
        path: resolve(__dirname, 'dist'),
        filename: 'index_bundle.js',
        clean: true,
    },
    resolve: {
        extensions: [".tsx", ".ts", ".js", ".css", ".scss", ".jsx"],
    },
    plugins: [new HtmlWebpackPlugin()],
    module: {
        rules: [
            // { test: /\.svg$/, use: 'svg-inline-loader' },
            {
              test: /\.css$/i,
              use: ['style-loader', 'css-loader'],
            },
            {
                test: /\.tsx?$/,
                use: 'ts-loader',
                exclude: /node_modules/,
            },
            { test: /\.scss$/, use: [
                    { loader: "style-loader" },  // to inject the result into the DOM as a style block
                    { loader: "css-modules-typescript-loader"},  // to generate a .d.ts module next to the .scss file (also requires a Globals.d.ts with "declare modules '*.scss';" in it to tell TypeScript that "import styles from './styles.scss';" means to load the module "./styles.scss.d.td")
                    { loader: "css-loader", options: { modules: true } },  // to convert the resulting CSS to Javascript to be bundled (modules:true to rename CSS classes in output to cryptic identifiers, except if wrapped in a :global(...) pseudo class)
                    { loader: "sass-loader" },  // to convert SASS to CSS
                    // NOTE: The first build after adding/removing/renaming CSS classes fails, since the newly generated .d.ts typescript module is picked up only later
                ] },
            { test: /\.module.scss$/, use: [
                    { loader: "style-loader" },  // to inject the result into the DOM as a style block
                    { loader: "css-modules-typescript-loader"},  // to generate a .d.ts module next to the .scss file (also requires a Globals.d.ts with "declare modules '*.scss';" in it to tell TypeScript that "import styles from './styles.scss';" means to load the module "./styles.scss.d.td")
                    { loader: "css-loader", options: { modules: true } },  // to convert the resulting CSS to Javascript to be bundled (modules:true to rename CSS classes in output to cryptic identifiers, except if wrapped in a :global(...) pseudo class)
                    { loader: "sass-loader" },  // to convert SASS to CSS
                    // NOTE: The first build after adding/removing/renaming CSS classes fails, since the newly generated .d.ts typescript module is picked up only later
                ] },
        ]
    },
    devServer: {
        port: 4000
    }

}