var path = require("path");
module.exports = {
    entry: {
        'su-ui.vue.packed': "./vendor/assets/su-ui/src/javascripts/su-ui.vue.packed.es6"
    },
    output: {
        path: "./vendor/assets/javascripts/",
        filename: "[name].js",
        publicPath: "/"
    },
    module: {
        loaders: [{
            test: /\.(es6|jsx|js)$/,
            exclude: /node_modules/,
            loader: "babel-loader",
            query: {
                presets: ['es2015', 'react']
            }
        }],
        noParse: [
            path.join(__dirname, "node_modules", "simplemde", "dist", "simplemde.min.js")
        ]
        // , ]
    }
    //resolve: {
    //    alias: {
    //        moment: __dirname + '/web/static/vendor/ace/js/date-time/moment.min.js',
    //        jquery: __dirname + '/node_modules/jquery/dist/jquery.min.js'
    //    }
    //}
};
