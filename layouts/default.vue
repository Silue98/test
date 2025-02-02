<template>
    <div>
      <!-- Vérifier si la route actuelle est la page de login -->
      <toolbar v-if="!isLoginPage" />
      <slot/>
    </div>
  </template>
  
  <script setup>
  import { useRoute } from 'vue-router';
  
  // Récupérer la route active
  const route = useRoute();
  
  // Vérifier si la route est la page de login ou d'inscription
//   const isLoginPage = route.path === '/';  // "/" est l'URL de la page de login
//   const isRegisterPage = route.path === '/register';  // "/register" est l'URL de la page d'inscription
  </script>
  