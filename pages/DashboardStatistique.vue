<template>
    <div class="p-6">
      <!-- Bouton Ajouter -->
      <div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
        <div class="bg-blue-500 text-white p-4 rounded-lg shadow-md flex justify-between items-center">
          <div>
            <h3 class="text-lg font-semibold">Total Enregistré</h3>
            <p class="text-2xl">{{ enfant.length }}</p>
          </div>
          <i class="fas fa-users text-3xl"></i>
        </div>
  
        <div class="bg-green-500 text-white p-4 rounded-lg shadow-md flex justify-between items-center">
          <div>
            <h3 class="text-lg font-semibold">Total Inscrits</h3>
            <p class="text-2xl">{{ totalGarcons }}</p>
          </div>
          <i class="fas fa-male text-3xl"></i>
        </div>
  
        <div class="bg-pink-500 text-white p-4 rounded-lg shadow-md flex justify-between items-center">
          <div>
            <h3 class="text-lg font-semibold">Total paiement</h3>
            <p class="text-2xl">{{ totalFilles }}</p>
          </div>
          <i class="fas fa-female text-3xl"></i>
        </div>
  
        <div class="bg-yellow-500 text-white p-4 rounded-lg shadow-md flex justify-between items-center">
          <div>
            <h3 class="text-lg font-semibold">Total Classe</h3>
            <p class="text-2xl">{{ totalOrphelins }}</p>
          </div>
          <i class="fas fa-heart-broken text-3xl"></i>
        </div>
      </div>
  

      <div class="flex">
        <button
          class="ml-auto mb-4 px-4 py-2 font-medium text-white bg-blue-600 rounded-md hover:bg-blue-500"
          @click="openModal"
        >
          Ajouter
        </button>
      </div>
  
      <!-- Tableau des enfants -->
      <table class="min-w-full divide-y divide-gray-200 bg-white shadow-md rounded-lg overflow-hidden">
        <thead class="bg-gray-100">
          <tr>
            <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">N°</th>
            <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nom</th>
            <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Prénom</th>
            <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">GENRE</th>
            <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Action</th>
          </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
          <tr v-for="enf in enfant" :key="enf.Id_Enfant">
            <td class="px-4 py-4 whitespace-nowrap">{{ enf.Id_Enfant }}</td>
            <td class="px-4 py-4 whitespace-nowrap">{{ enf.nomenfant }}</td>
            <td class="px-4 py-4 whitespace-nowrap">{{ enf.prenomenfant }}</td>
            <td class="px-4 py-4 whitespace-nowrap">{{ enf.genre }}</td>
            <td class="px-4 py-4 whitespace-nowrap flex justify-between">
              <button 
                @click="ouvrirModal(enf)"
                class="bg-green-500 text-white px-3 py-1 rounded shadow-md hover:bg-green-600 transition duration-200"
              >
                Inscrire
              </button>
              <button 
                class="ml-2 px-4 py-2 font-medium text-white bg-yellow-500 rounded-md hover:bg-yellow-600"
              >
                Modifier
              </button>
            </td>
          </tr>
        </tbody>
      </table>
  
      <!-- Modal avec Formulaire -->
      <div v-if="modalOuvert" class="fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center">
        <div class="bg-white p-6 rounded-lg shadow-lg w-96">
          <h2 class="text-xl font-semibold mb-4">Inscription de {{ enfantSelectionne.nomenfant }}</h2>
  
          <!-- Formulaire -->
          <form @submit.prevent="SendInscription">
            <input type="hidden" v-model="enfantSelectionne.Id_Enfant" />
            <div class="mb-4">
              <label class="block text-gray-700">Nom :</label>
              <input 
                type="text" 
                v-model="enfantSelectionne.nomenfant"
                class="w-full p-2 border rounded-lg"
                disabled
              />
            </div>
  
            <div class="mb-4">
              <label class="block text-gray-700">Prénom :</label>
              <input 
                type="text" 
                v-model="enfantSelectionne.prenomenfant"
                class="w-full p-2 border rounded-lg"
                disabled
              />
            </div>
  
            <div class="mb-4">
              <label class="block text-gray-700">Genre :</label>
              <input 
                type="text" 
                v-model="enfantSelectionne.genre"
                class="w-full p-2 border rounded-lg"
                disabled
              />
            </div>
  
            <div class="mb-4">
              <label class="block text-gray-700">Classe :</label>
              <input 
                type="text" 
                v-model="classe"
                class="w-full p-2 border rounded-lg"
                placeholder="Saisir la classe"
                required
              />
            </div>
  
            <div class="mb-4">
              <label class="block text-gray-700">Date d'inscription :</label>
              <input 
                type="date" 
                v-model="dateInscription"
                class="w-full p-2 border rounded-lg"
                required
              />
            </div>
  
            <div class="flex justify-end mt-6">
              <button 
                @click="fermerModal"
                type="button"
                class="bg-gray-400 text-white px-4 py-2 rounded-lg mr-2 hover:bg-gray-500"
              >
                Annuler
              </button>
              <button 
                type="submit"
                class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600"
              >
                Confirmer
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref, computed } from "vue";
  
  // Récupération des données
  const enfants = await $fetch("/api/listeenregist");
  const enfant = ref(enfants.data);
  
  // Variables pour les statistiques des cartes
  const totalGarcons = computed(() => enfant.value.filter(e => e.genre === 'M').length);
  const totalFilles = computed(() => enfant.value.filter(e => e.genre === 'F').length);
  const totalOrphelins = computed(() => enfant.value.filter(e => e.orphelinpas === 'oui').length);
  
  // Variables pour le modal
  const modalOuvert = ref(false);
  const enfantSelectionne = ref({});
  const classe = ref("");
  const dateInscription = ref(new Date().toISOString().split('T')[0]); // Date du jour
  
  // Fonction pour ouvrir le modal avec les infos de l'enfant sélectionné
  const ouvrirModal = (enf) => {
    enfantSelectionne.value = enf;
    modalOuvert.value = true;
  };
  
  // Fonction pour fermer le modal
  const fermerModal = () => {
    modalOuvert.value = false;
    classe.value = "";
    dateInscription.value = new Date().toISOString().split('T')[0]; // Réinitialiser la date
  };
  
  // Fonction pour soumettre l'inscription
  const SendInscription = async () => {
  try {
    console.log("Données envoyées :", {
      nomenfant: enfantSelectionne.value.nomenfant,
      prenomenfant: enfantSelectionne.value.prenomenfant,
      Id_classe: classs.value,
      Id_Enfant: enfantSelectionne.value.Id_Enfant,
      dateinscription: dateI.value,
      classe: classename.value
    });

    await $fetch("/api/inscription", {
      method: "POST",
      body: {
        nomenfant: enfantSelectionne.value.nomenfant,
        prenomenfant: enfantSelectionne.value.prenomenfant,
        Id_classe: classs.value, // ID de la classe
        Id_Enfant: enfantSelectionne.value.Id_Enfant, // ID de l'enfant
        dateinscription: dateI.value, // Date d'inscription
        classe: classename.value // Nom de la classe
      }
    });

    alert("Inscription réussie !");
    fermerModal();
  } catch (error) {
    console.error("Erreur d'inscription :", error);
    alert("Erreur lors de l'inscription !");
  }
  };
  </script>
  




























