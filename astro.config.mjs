// @ts-check
import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';
import tailwindcss from '@tailwindcss/vite';

// https://astro.build/config
export default defineConfig({
  site: 'https://blog.neuronai.pro',
  integrations: [sitemap()],
  trailingSlash: 'always',
  prefetch: false,
  vite: {
    plugins: [tailwindcss()]
  }
});

