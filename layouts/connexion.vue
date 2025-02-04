<!-- layouts/login.vue -->
<template>
    <div class="login-layout">
      <NuxtPage /> <!-- Le contenu de la page de login sera ici -->
    </div>
  </template>
  
  <script setup>
  // Logique spécifique au layout, si nécessaire
  </script>
  
  <style scoped>
  .login-layout {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background: url('/images/login-background.jpg') no-repeat center center fixed;
    background-size: cover;
  }
  </style>
  