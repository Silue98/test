<template>
    <div>
        <StatistiquesCartes />
      <!-- Titre de la page -->
      <div class="flex justify-center mt-5">
        <h1 class="text-2xl font-serif text-yellow-500 shadow-lg">Liste des Paiements</h1>
      </div>
  
      <!-- Tableau des paiements -->
      <div class="mt-6 mx-auto max-w-7xl">
        <table class="min-w-full divide-y divide-gray-200">
          <thead>
            <tr>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ID Paiement</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ID Inscription</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Montant</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Moyen de Paiement</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Responsable Financement</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date de Paiement</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Total Payé</th>
            </tr>
          </thead>
          <tbody class="bg-white divide-y divide-gray-200">
            <tr v-for="paiement in paiements" :key="paiement.Id_Paiement">
              <td class="px-6 py-4 whitespace-nowrap">{{ paiement.Id_Payement }}</td>
              <td class="px-6 py-4 whitespace-nowrap">{{ paiement.Id_Incription }}</td>
              <td class="px-6 py-4 whitespace-nowrap">{{ paiement.montant }}</td>
              <td class="px-6 py-4 whitespace-nowrap">{{ paiement.moyenpayement }}</td>
              <td class="px-6 py-4 whitespace-nowrap">{{ paiement.reponsablefinancement }}</td>
              <td class="px-6 py-4 whitespace-nowrap">{{ paiement.datePayement }}</td>
              <td class="px-6 py-4 whitespace-nowrap">{{ paiement.totatpayement }}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue';
  
  // Données des paiements
  const paiements = ref([]);
  
  // Fonction pour récupérer les paiements depuis l'API
  async function fetchPaiements() {
    try {
      const response = await $fetch('/api/payement');
      paiements.value = response.data; // Assurez-vous que l'API retourne bien un tableau de paiements
    } catch (error) {
      console.error('Erreur lors de la récupération des paiements :', error);
    }
  }
  
  // Charger les paiements au montage de la page
  onMounted(() => {
    fetchPaiements();
  });
  </script>
  
  <style scoped>
  /* Styles supplémentaires si nécessaire */
  </style>