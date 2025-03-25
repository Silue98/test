<template>
    <div class="p-5 space-y-6">
      <!-- Barre de sélection et recherche -->
       <StatistiquesCartes/>
      <div class="flex flex-wrap items-center gap-x-6 gap-y-4 p-6 bg-gray-100 rounded-lg">
        <select v-model="selectedClasse" class="border p-3 rounded w-52" @change="fetchInscriptions">
          <option value="">-- Toutes les classes --</option>
          <option v-for="classe in classes" :key="classe.Id_classe" :value="classe.Id_classe">{{ classe.nomclass }}</option>
        </select>
  
        <input 
          v-model="searchQuery" 
          type="text" 
          placeholder="🔍 Rechercher un élève..." 
          class="border p-3 rounded w-64"
        />
  
        <button class="bg-blue-500 text-white px-5 py-3 rounded hover:bg-blue-600" @click="fetchInscriptions">
          📋 Afficher les inscriptions
        </button>
      </div>
  
      <!-- Tableau des inscriptions -->
      <div class="overflow-x-auto bg-white p-6 rounded-lg shadow">
        <table class="w-full border-collapse border">
          <thead>
            <tr class="bg-gray-200 text-left">
              <th class="border p-3">👤 Nom</th>
              <th class="border p-3">👤 Prénom</th>
              <th class="border p-3">📚 Classe</th>
              <th class="border p-3">📅 Date d'inscription</th>
            </tr>
          </thead>
          <tbody>
            <tr 
              v-for="(inscription, index) in filteredInscriptions" 
              :key="index" 
              class="text-center border hover:bg-gray-100"
            >
              <td class="border p-3">{{ inscription.nomenfant }}</td>
              <td class="border p-3">{{ inscription.prenomenfant }}</td>
              <td class="border p-3">{{ inscription.classe.nomclass }}</td>
              <td class="border p-3">{{ inscription.dateinscription }}</td>
            </tr>
          </tbody>
        </table>
  
        <!-- Message si aucune inscription trouvée -->
        <p v-if="filteredInscriptions.length === 0" class="text-center p-4 text-gray-500">
          Aucun résultat trouvé.
        </p>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref, computed, onMounted } from "vue";
  
  // Variables réactives
  const inscriptions = ref([]);
  const classes = ref([]);
  const selectedClasse = ref("");
  const searchQuery = ref("");
  
  // Fonction pour récupérer les classes depuis l'API
  const fetchClasses = async () => {
    try {
      const { data } = await useFetch(`/api/classe`);
      classes.value = data.value?.data || [];
    } catch (error) {
      console.error("Erreur lors du chargement des classes:", error);
    }
  };
  
  // Fonction pour récupérer les inscriptions depuis l'API
  const fetchInscriptions = async () => {
    try {
      const { data } = await useFetch(`/api/listeinscription`);
      inscriptions.value = data.value?.data || [];
    } catch (error) {
      console.error("Erreur lors du chargement des inscriptions:", error);
    }
  };
  
  // Fonction pour obtenir le nom de la classe en fonction de son ID
  const getClasseName = (classeId) => {
    const classe = classes.value.find(c => c.Id_classe === classeId);
    return classe ? classe.nom : 'Inconnu';
  };
  
  // Filtrer les inscriptions en fonction de la recherche et de la classe sélectionnée
  const filteredInscriptions = computed(() => {
    return inscriptions.value.filter((inscription) => {
      const matchClasse = !selectedClasse.value || inscription.Id_classe === selectedClasse.value;
      const matchSearch = searchQuery.value === "" || 
                         inscription.nomenfant.toLowerCase().includes(searchQuery.value.toLowerCase()) ||
                         inscription.prenomenfant.toLowerCase().includes(searchQuery.value.toLowerCase());
  
      return matchClasse && matchSearch;
    });
  });
  
  // Chargement initial des données
  onMounted(() => {
    fetchClasses();
    fetchInscriptions();
  });
  </script>