<template>
    <div>
      <!-- Bouton pour ajouter un enregistrement, placé à droite -->
       <div class="flex">
      <button
        class="ml-auto mb-4 px-4 py-2 font-medium text-white bg-blue-600 rounded-md hover:bg-blue-500"
        @click="openModal"
      >
        Ajouter
      </button>
    </div>
  
      <table class="min-w-full divide-y divide-gray-200">
        <thead>
          <tr>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nom</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Email</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Role</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Statut</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Action</th>
          </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
          <tr v-for="eleve in eleves" :key="eleve.id">
            <td class="px-6 py-4 whitespace-nowrap">{{ eleve.nom }}</td>
            <td class="px-6 py-4 whitespace-nowrap">{{ eleve.email }}</td>
            <td class="px-6 py-4 whitespace-nowrap">{{ eleve.role }}</td>
            <td class="px-6 py-4 whitespace-nowrap">
              <span v-if="eleve.status === 'active'" class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">Actif</span>
              <span v-else class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-red-100 text-red-800">Inactif</span>
            </td>
            <td class="px-6 py-4 whitespace-nowrap">
              <button class="px-4 py-2 font-medium text-white bg-blue-600 rounded-md hover:bg-blue-500">Modifier</button>
              <button class="ml-2 px-4 py-2 font-medium text-white bg-red-600 rounded-md hover:bg-red-500">Supprimer</button>
            </td>
          </tr>
        </tbody>
      </table>
  
      <!-- Modal pour ajouter un enregistrement -->
      <div v-if="isModalOpen" class="fixed inset-0 z-10 bg-gray-500 bg-opacity-50 flex justify-center items-center">
        <div class="bg-white p-6 rounded-lg shadow-lg w-1/3">
          <h2 class="text-lg font-semibold mb-4">Ajouter un élève</h2>
          <form @submit.prevent="addEleve">
            <div class="mb-4">
              <label class="block text-sm font-medium text-gray-700">Nom</label>
              <input v-model="newEleve.nom" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500" type="text" placeholder="Nom de l'élève" required />
            </div>
            <div class="mb-4">
              <label class="block text-sm font-medium text-gray-700">Email</label>
              <input v-model="newEleve.email" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500" type="email" placeholder="Email de l'élève" required />
            </div>
            <div class="mb-4">
              <label class="block text-sm font-medium text-gray-700">Rôle</label>
              <input v-model="newEleve.role" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500" type="text" placeholder="Rôle de l'élève" required />
            </div>
            <div class="mb-4">
              <label class="block text-sm font-medium text-gray-700">Statut</label>
              <select v-model="newEleve.status" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500" required>
                <option value="active">Actif</option>
                <option value="inactive">Inactif</option>
              </select>
            </div>
            <div class="flex justify-end">
              <button type="submit" class="px-4 py-2 font-medium text-white bg-blue-600 rounded-md hover:bg-blue-500">Ajouter</button>
              <button type="button" @click="closeModal" class="ml-2 px-4 py-2 font-medium text-gray-700 bg-gray-200 rounded-md hover:bg-gray-300">Annuler</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        eleves: [], // Données des élèves
        utilisateurId: 1, // ID de l'utilisateur pour l'API
        isModalOpen: false, // Variable pour contrôler l'ouverture du modal
        newEleve: {
          nom: '',
          email: '',
          role: 'Élève',
          status: 'active',
        },
      };
    },
    mounted() {
      this.fetchEleves(); // Appel à l'API lors du montage
    },
    methods: {
      async fetchEleves() {
        try {
          // Appel à l'API pour récupérer les élèves en fonction de l'ID utilisateur
          const response = await fetch(`/api/classes/${this.utilisateurId}`);
          
          if (!response.ok) {
            throw new Error(`Erreur HTTP: ${response.status}`);
          }
  
          const data = await response.json();
          console.log("Réponse brute de l'API :", data); // Log de la réponse brute
  
          // Vérification si la réponse est un tableau
          if (!Array.isArray(data)) {
            throw new Error("Les données retournées ne sont pas un tableau valide");
          }
  
          // Traitement des données reçues
          this.eleves = data.map(eleve => {
            if (!eleve || typeof eleve !== 'object') {
              console.warn("Donnée invalide ignorée:", eleve);
              return null;
            }
  
            // Retourne les données formatées
            return {
              id: eleve.id || null,
              nom: eleve.nomEnfant || "Inconnu", // Assure-toi que `nomEnfant` est correct
              email: eleve.email || "Non disponible",
              role: eleve.role || "Élève",
              status: eleve.status === 'active' ? 'active' : 'inactive', // Assure-toi que le champ `status` soit valide
            };
          }).filter(eleve => eleve !== null); // Filtre les éléments invalides
  
          console.log("Élèves formatés :", this.eleves);
        } catch (error) {
          console.error('Erreur lors de la récupération des élèves:', error);
        }
      },
      openModal() {
        this.isModalOpen = true;
      },
      closeModal() {
        this.isModalOpen = false;
      },
      async addEleve() {
        try {
          // Ajouter un nouvel élève via l'API
          const response = await fetch(`/api/classes/${this.utilisateurId}/add`, {
            method: 'POST',
            headers: {
              'Content-Type': 'application/json',
            },
            body: JSON.stringify(this.newEleve),
          });
  
          if (!response.ok) {
            throw new Error(`Erreur HTTP: ${response.status}`);
          }
  
          const data = await response.json();
          console.log("Élève ajouté :", data);
          this.fetchEleves(); // Récupérer la liste mise à jour des élèves
          this.closeModal(); // Fermer le modal
        } catch (error) {
          console.error('Erreur lors de l\'ajout de l\'élève:', error);
        }
      },
    },
  };
  </script>
  
  