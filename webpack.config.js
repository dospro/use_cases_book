let path = require('path');

module.exports = {
    entry: {
        app: './src/client/app.coffee',
        newCase: './src/client/new_case.coffee'
    },
    output: {
        filename: '[name].bundle.js',
        path: path.resolve(__dirname, 'public/js')
    },
    module: {
        rules: [
            {
                test: /\.vue$/,
                loader: 'vue-loader',
                options: {
                    loaders: {
                        js: 'coffee-loader'
                    }
                }
            },
            {
                test: /\.coffee$/,
                loader: 'coffee-loader'
            }
        ]

    }
};
