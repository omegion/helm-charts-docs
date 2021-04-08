const VERSION = require("./package.json").version;

const config = {
    target: "static",
    ssr: false,
    
    head: {
        title: "Helm Charts",
        htmlAttrs: {
            lang: "en",
            amp: true
        },
        meta: [
            {charset: "utf-8"},
            {name: "viewport", content: "width=device-width, initial-scale=1"},
            {
                hid: "description",
                name: "description",
                content: "Helm charts."
            }
        ],
        link: [{rel: "icon", type: "image/x-icon", href: "/favicon.ico"}]
    },

    // Global CSS: https://go.nuxtjs.dev/config-css
    css: ["~assets/scss/app.scss", "@mdi/font/css/materialdesignicons.min.css"],

    loading: {
        height: "0px"
    },

    router: {
        base: process.env.NODE_ENV !== "production" ? "/" : "./"
    },

    generate: {
        fallback: "index.html"
    },

    // Plugins to run before rendering page: https://go.nuxtjs.dev/config-plugins
    plugins: [
        {ssr: true, src: "@/plugins/buefy.ts"},
        {ssr: true, src: "@/plugins/filters.ts"}
    ],

    // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
    buildModules: ["@nuxt/typescript-build", "@nuxtjs/composition-api"],

    // Build Configuration: https://go.nuxtjs.dev/config-build
    build: {
        publicPath: process.env.NODE_ENV === "production" ? "/public/" : "/_nuxt/",
        html: {
            minify: {
                minifyCSS: true,
                minifyJS: true
            }
        },
        extend(config: any, ctx: any) {
            config.module.rules.push({
                test: /\.ya?ml$/,
                use: "js-yaml-loader"
            });
        }
    },

    publicRuntimeConfig: {
        isProduction: process.env.NODE_ENV === "production",
        appVersion: VERSION,
        githubRepository: process.env.GITHUB_REPO
    }
};

export default config;
