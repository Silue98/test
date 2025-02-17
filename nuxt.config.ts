// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled:false },
  css: ['~/assets/css/main.css'],

  postcss: {
    plugins: {
      tailwindcss: {},
      autoprefixer: {},
    },
  },

  modules: [
    '@i2d/nuxt-pdf-frame',
    '@sidebase/nuxt-pdf'
  ],

  compatibilityDate: '2025-02-01'
})