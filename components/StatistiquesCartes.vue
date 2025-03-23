<template>
    <div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
      <!-- Carte Total Enregistré -->
      <div class="bg-blue-500 text-white p-4 rounded-lg shadow-md flex justify-between items-center">
        <div>
          <h3 class="text-lg font-semibold">Total Enregistré</h3>
          <p class="text-2xl">{{ totalEnregistre }}</p>
        </div>
        <i class="fas fa-users text-3xl"></i>
      </div>
  
      <!-- Carte Total Garçons -->
      <div class="bg-green-500 text-white p-4 rounded-lg shadow-md flex justify-between items-center">
        <div>
          <h3 class="text-lg font-semibold">Total Garçons</h3>
          <p class="text-2xl">{{ totalGarcons }}</p>
        </div>
        <i class="fas fa-male text-3xl"></i>
      </div>
  
      <!-- Carte Total Filles -->
      <div class="bg-pink-500 text-white p-4 rounded-lg shadow-md flex justify-between items-center">
        <div>
          <h3 class="text-lg font-semibold">Total Filles</h3>
          <p class="text-2xl">{{ totalFilles }}</p>
        </div>
        <i class="fas fa-female text-3xl"></i>
      </div>
  
      <!-- Carte Total Orphelins -->
      <div class="bg-yellow-500 text-white p-4 rounded-lg shadow-md flex justify-between items-center">
        <div>
          <h3 class="text-lg font-semibold">Total Orphelins</h3>
          <p class="text-2xl">{{ totalOrphelins }}</p>
        </div>
        <i class="fas fa-heart-broken text-3xl"></i>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref, computed, onMounted } from 'vue';
  
  // Récupérer les données des enfants
  const enfants = await $fetch("/api/listeenregist");
  const enfant = ref(enfants.data);
  
  // Calcul des statistiques
  const totalEnregistre = computed(() => enfant.value.length);
  const totalGarcons = computed(() => enfant.value.filter(e => e.genre === 'M').length);
  const totalFilles = computed(() => enfant.value.filter(e => e.genre === 'F').length);
  const totalOrphelins = computed(() => enfant.value.filter(e => e.orphelinpas === 'oui').length);
  </script>
  
  <style scoped>
  /* Styles supplémentaires si nécessaire */
  </style>