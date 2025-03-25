<template>
    <div>
      <StatistiquesCartes />

      <!-- Bouton pour ajouter un utilisateur et message de succès -->
      <div class="flex items-center mb-4">
        <button
          class="ml-auto px-4 py-2 font-medium text-white bg-blue-600 rounded-md hover:bg-blue-500"
          @click="openModalUser"
        >
          Ajouter
        </button>
        <!-- Message de succès -->
        <div v-if="successMessage" class="ml-4 p-2 bg-green-500 text-white rounded-lg shadow-lg">
          {{ successMessage }}
        </div>
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
            <td class="px-6 py-4">{{ user.name }}</td>
            <td class="px-6 py-4">{{ user.prenom }}</td>
            <td class="px-6 py-4">{{ user.email }}</td>
            <td class="px-6 py-4 whitespace-nowrap">
              <button
                @click="openEditModal(user)"
                class="px-4 py-2 font-medium text-white bg-yellow-500 rounded-md hover:bg-yellow-600"
              >
                Modifier
              </button>
              <button
                @click="deleteUser(user.id)"
                class="ml-2 px-4 py-2 font-medium text-white bg-red-500 rounded-md hover:bg-red-600"
              >
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
  
      <!-- Modal de modification d'utilisateur -->
      <div v-if="isEditModalOpen" class="fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-50">
        <div class="bg-white p-6 rounded-lg shadow-lg w-1/3">
          <h2 class="text-lg font-semibold mb-4">Modifier l'utilisateur</h2>
          <form @submit.prevent="updateUser">
            <div class="mb-4">
              <label class="block text-sm font-medium text-gray-700">Nom</label>
              <input v-model="editForm.name" class="mt-1 block w-full px-3 py-2 border rounded-md" type="text" required />
            </div>
            <div class="mb-4">
              <label class="block text-sm font-medium text-gray-700">Prénom</label>
              <input v-model="editForm.prenom" class="mt-1 block w-full px-3 py-2 border rounded-md" type="text" required />
            </div>
            <div class="mb-4">
              <label class="block text-sm font-medium text-gray-700">Email</label>
              <input v-model="editForm.email" class="mt-1 block w-full px-3 py-2 border rounded-md" type="email" required />
            </div>
            <!-- Champ caché pour le mot de passe -->
            <div class="flex justify-end">
              <button type="button" @click="closeEditModal" class="ml-2 px-4 py-2 font-medium text-gray-700 bg-gray-200 rounded-md hover:bg-gray-300">
                Annuler
              </button>
              <button type="submit" class="px-4 py-2 font-medium text-white bg-blue-600 rounded-md hover:bg-blue-500">
                Enregistrer
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
  const modalUserOuvert = ref(false); // État du modal d'ajout
  const isEditModalOpen = ref(false); // État du modal de modification
  const newUser = ref({ name: '', email: '', password: 'password', prenom: '' }); // Données du nouvel utilisateur
  const editForm = ref({ id: null, name: '', email: '', prenom: '' }); // Données de l'utilisateur à modifier
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
  
  // Ouvrir le modal d'ajout
  const openModalUser = () => {
    modalUserOuvert.value = true;
  };
  
  // Fermer le modal d'ajout
  const fermerModalUser = () => {
    modalUserOuvert.value = false;
    newUser.value = { name: '', email: '', password: 'password', prenom: '' }; // Réinitialiser le formulaire
  };
  
  // Ouvrir le modal de modification
  const openEditModal = (user) => {
    editForm.value = { ...user, password: 'password' }; // Toujours définir le mot de passe sur "password"
    isEditModalOpen.value = true;
  };
  
  // Fermer le modal de modification
  const closeEditModal = () => {
    isEditModalOpen.value = false;
    editForm.value = { id: null, name: '', email: '', password: 'password', prenom: '' }; // Réinitialiser le formulaire
  };
  
  // Ajouter un utilisateur
  const addUser = async () => {
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
        setTimeout(() => { successMessage.value = ''; }, 3000); // Masquer le message après 3 secondes
      } else {
        console.error("Erreur lors de l'ajout :", response.error);
      }
    } catch (error) {
      console.error("Erreur lors de l'ajout de l'utilisateur :", error);
    }
  };
  
  // Supprimer un utilisateur
  const deleteUser = async (userId) => {
    try {
      const response = await $fetch(`/api/users/${userId}`, {
        method: 'DELETE',
      });
  
      if (response.message) {
        successMessage.value = "Utilisateur supprimé avec succès !";
        fetchUsers(); // Recharger la liste des utilisateurs
        setTimeout(() => { successMessage.value = ''; }, 3000); // Masquer le message après 3 secondes
      }
    } catch (error) {
      console.error("Erreur lors de la suppression :", error);
    }
  };
  
  // Mettre à jour un utilisateur
  const updateUser = async () => {
    try {
      const response = await $fetch(`/api/users/${editForm.value.id}`, {
        method: 'PUT',
        body: editForm.value,
      });
  
      if (response.message) {
        successMessage.value = "Utilisateur mis à jour avec succès !";
        fetchUsers(); // Recharger la liste des utilisateurs
        closeEditModal(); // Fermer le modal
        setTimeout(() => { successMessage.value = ''; }, 3000); // Masquer le message après 3 secondes
      }
    } catch (error) {
      console.error("Erreur lors de la mise à jour :", error);
    }
  };
  
  // Charger les utilisateurs au montage
  onMounted(fetchUsers);
  </script>