<template>
    <div>
      <!-- Bouton pour ajouter un utilisateur -->
      <div class="flex">
        <button
          class="ml-auto mb-4 px-4 py-2 font-medium text-white bg-blue-600 rounded-md hover:bg-blue-500"
          @click="openModalUser"
        >
          Ajouter
        </button>
      </div>
  
      <!-- Sélection du nombre d'éléments par page -->
      <div class="flex items-center mb-4">
        <label class="mr-2 text-sm font-medium text-gray-700">Éléments par page :</label>
        <select v-model="itemsPerPage" class="px-2 py-1 border rounded-md">
          <option v-for="option in itemsPerPageOptions" :key="option" :value="option">
            {{ option }}
          </option>
        </select>
      </div>
  
      <!-- Tableau des utilisateurs -->
      <table class="min-w-full divide-y divide-gray-200">
        <thead>
          <tr>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">N°</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nom</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Prénom</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Email</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Action</th>
          </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
          <tr v-for="user in paginatedUsers" :key="user.id">
            <td class="px-6 py-4">{{ user.id }}</td>
            <td class="px-6 py-4">{{ user.nom }}</td>
            <td class="px-6 py-4">{{ user.prenom }}</td>
            <td class="px-6 py-4">{{ user.email }}</td>
            <td class="px-6 py-4 whitespace-nowrap">
              <button class="ml-2 px-4 py-2 font-medium text-white bg-red-600 rounded-md hover:bg-red-500">
                Supprimer
              </button>
            </td>
          </tr>
        </tbody>
      </table>
  
      <!-- Pagination -->
      <div class="flex justify-center items-center mt-4 space-x-4">
        <button
          @click="previousPage"
          :disabled="currentPage === 1"
          :class="[
            'px-4 py-2 font-medium text-white rounded-md',
            currentPage === 1 ? 'bg-gray-300 cursor-not-allowed' : 'bg-blue-600 hover:bg-blue-500',
          ]"
        >
          Précédent
        </button>
        <div class="text-sm text-gray-700">
          Page {{ currentPage }} sur {{ totalPages }}
        </div>
        <button
          @click="nextPage"
          :disabled="currentPage === totalPages"
          :class="[
            'px-4 py-2 font-medium text-white rounded-md',
            currentPage === totalPages ? 'bg-gray-300 cursor-not-allowed' : 'bg-blue-600 hover:bg-blue-500',
          ]"
        >
          Suivant
        </button>
      </div>
  
      <!-- Message de succès -->
      <div v-if="successMessage" class="fixed top-4 right-4 p-4 bg-green-500 text-white rounded-lg shadow-lg">
        {{ successMessage }}
      </div>
  
      <!-- Modal d'ajout d'utilisateur -->
      <div v-if="modalUserOuvert" class="fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-50">
        <div class="bg-white p-6 rounded-lg shadow-lg w-1/3">
          <h2 class="text-lg font-semibold mb-4">Ajouter un utilisateur</h2>
          <form @submit.prevent="addUser">
            <div class="mb-4">
              <label class="block text-sm font-medium text-gray-700">Nom</label>
              <input v-model="newUser.name" class="mt-1 block w-full px-3 py-2 border rounded-md" type="text" placeholder="Nom" required />
            </div>
            <div class="mb-4">
              <label class="block text-sm font-medium text-gray-700">Prénom</label>
              <input v-model="newUser.prenom" class="mt-1 block w-full px-3 py-2 border rounded-md" type="text" placeholder="Prénom" required />
            </div>
            <div class="mb-4">
              <label class="block text-sm font-medium text-gray-700">Email</label>
              <input v-model="newUser.email" class="mt-1 block w-full px-3 py-2 border rounded-md" type="email" placeholder="Email" required />
            </div>
              <input v-model="newUser.password" type="hidden"  />
  
            <div class="flex justify-end">
              <button type="submit" class="px-4 py-2 font-medium text-white bg-blue-600 rounded-md hover:bg-blue-500">
                Enregistrer
              </button>
              <button type="button" @click="fermerModalUser" class="ml-2 px-4 py-2 font-medium text-gray-700 bg-gray-200 rounded-md hover:bg-gray-300">
                Annuler
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </template>
  <script setup>
  import { ref, onMounted, computed, watch } from 'vue';
  
  // États réactifs
  const users = ref([]); // Liste des utilisateurs
  const modalUserOuvert = ref(false); // État du modal
  const newUser = ref({ name: '', email: '', password: '', prenom: '' }); // Données du nouvel utilisateur
  const successMessage = ref(''); // Message de succès
  const currentPage = ref(1); // Page actuelle
  const itemsPerPage = ref(5); // Nombre d'éléments par page
  const itemsPerPageOptions = ref([5, 10, 20, 50]); // Options pour le nombre d'éléments par page
  
  // Calcul des utilisateurs paginés
  const paginatedUsers = computed(() => {
    const start = (currentPage.value - 1) * itemsPerPage.value;
    const end = start + itemsPerPage.value;
    return users.value.slice(start, end);
  });
  
  // Calcul du nombre total de pages
  const totalPages = computed(() => Math.ceil(users.value.length / itemsPerPage.value));
  
  // Aller à la page précédente
  const previousPage = () => {
    if (currentPage.value > 1) {
      currentPage.value--;
    }
  };
  
  // Aller à la page suivante
  const nextPage = () => {
    if (currentPage.value < totalPages.value) {
      currentPage.value++;
    }
  };
  
  // Réinitialiser la page actuelle lorsque le nombre d'éléments par page change
  watch(itemsPerPage, () => {
    currentPage.value = 1;
  });
  
  // Fonction pour récupérer les utilisateurs
  const fetchUsers = async () => {
    try {
      const response = await $fetch("/api/users");
      users.value = response.data || [];
    } catch (error) {
      console.error("Erreur lors de la récupération des utilisateurs :", error);
    }
  };
  
  // Ouvrir le modal
  const openModalUser = () => {
    modalUserOuvert.value = true;
    console.log("Modal ouvert:", modalUserOuvert.value);
  };
  
  // Fermer le modal
  const fermerModalUser = () => {
    modalUserOuvert.value = false;
    console.log("Modal fermé:", modalUserOuvert.value);
  };
  
  // Ajouter un utilisateur
  const addUser = async () => {
    console.log("Utilisateur ajouté :", newUser.value);
  
    try {
      const response = await $fetch("/api/auth/register", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(newUser.value),
      });
  
      if (response.message) {
        successMessage.value = "Utilisateur créé avec succès !";
        fetchUsers(); // Recharger la liste des utilisateurs
        fermerModalUser(); // Fermer le modal
        newUser.value = { name: '', email: '', password: '', prenom: '' }; // Réinitialiser le formulaire
        setTimeout(() => { successMessage.value = ''; }, 3000); // Masquer le message après 3 secondes
      } else {
        console.error("Erreur lors de l'ajout :", response.error);
      }
    } catch (error) {
      console.error("Erreur lors de l'ajout de l'utilisateur :", error);
    }
  };
  
  // Charger les utilisateurs au montage
  onMounted(fetchUsers);
  </script>