<template>
  <div>
    <StatistiquesCartes />
    <!-- Bouton pour ajouter un enregistrement, placé à droite -->
    <div class="flex">
      <button
        class="ml-auto mb-4 px-4 py-2 font-medium text-white bg-blue-600 rounded-md hover:bg-blue-500"
        @click="openModal"
      >
        Ajouter
      </button>
    </div>

    <!-- Tableau des inscriptions -->
    <table class="min-w-full divide-y divide-gray-200">
      <thead>
        <tr>
          <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">N°</th>
          <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nom</th>
          <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Prénom</th>
          <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date de naissance</th>
          <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date d'inscription</th>
          <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Action</th>
        </tr>
      </thead>
      <tbody class="bg-white divide-y divide-gray-200">
        <tr v-for="insc in inscription" :key="insc.Id_Incription">
          <td>{{ insc.Id_Incription || 'Nom indisponible' }}</td>
          <td>{{ insc.nomenfant || 'Nom indisponible' }}</td>
          <td class="px-6 py-4 whitespace-nowrap">{{ insc.prenom || 'indisponible' }}</td>
          <td class="px-6 py-4 whitespace-nowrap">{{ insc.dateNaissance || 'indisponible' }}</td>
          <td class="px-6 py-4 whitespace-nowrap">{{ insc.dateinscription || 'indisponible' }}</td>
          <td class="px-6 py-4 whitespace-nowrap">
            <!-- Bouton pour ouvrir le popup de paiement -->
            <button
              @click="openPaymentModal(insc.Id_Incription)"
              class="px-4 py-2 font-medium text-white bg-blue-600 rounded-md hover:bg-blue-500"
            >
              Effectuer un paiement
            </button>
            <button class="ml-2 px-4 py-2 font-medium text-white bg-red-600 rounded-md hover:bg-red-500">
              Supprimer
            </button>
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
            <input
              v-model="newEleve.nom"
              class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
              type="text"
              placeholder="Nom de l'élève"
              required
            />
          </div>
          <div class="mb-4">
            <label class="block text-sm font-medium text-gray-700">Prénom</label>
            <input
              v-model="newEleve.prenom"
              class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
              type="text"
              placeholder="Prénom de l'élève"
              required
            />
          </div>
          <div class="mb-4">
            <label class="block text-sm font-medium text-gray-700">Email</label>
            <input
              v-model="newEleve.email"
              class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
              type="email"
              placeholder="Email de l'élève"
              required
            />
          </div>
          <div class="mb-4">
            <label class="block text-sm font-medium text-gray-700">Numéro de téléphone</label>
            <input
              v-model="newEleve.telephone"
              class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
              type="text"
              placeholder="Numéro de téléphone"
              required
            />
          </div>
          <div class="mb-4">
            <label class="block text-sm font-medium text-gray-700">Date de naissance</label>
            <input
              v-model="newEleve.dateNaissance"
              class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
              type="date"
              required
            />
          </div>
          <div class="flex justify-end">
            <button
              type="submit"
              class="px-4 py-2 font-medium text-white bg-blue-600 rounded-md hover:bg-blue-500"
            >
              Ajouter
            </button>
            <button
              type="button"
              @click="closeModal"
              class="ml-2 px-4 py-2 font-medium text-gray-700 bg-gray-200 rounded-md hover:bg-gray-300"
            >
              Annuler
            </button>
          </div>
        </form>
      </div>
    </div>

    <!-- Popup de paiement -->
    <div v-if="isPaymentModalOpen" class="fixed inset-0 z-10 bg-gray-500 bg-opacity-50 flex justify-center items-center">
      <div class="bg-white p-6 rounded-lg shadow-lg w-1/3">
        <h2 class="text-lg font-semibold mb-4">Effectuer un paiement</h2>
        <form @submit.prevent="sendPayment">
          <div class="mb-4">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2">
              Date de paiement
            </label>
            <input
              v-model="paymentData.datePayement"
              class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
              type="date"
              required
            />
          </div>
          <div class="mb-4">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2">
              Montant
            </label>
            <input
              v-model="paymentData.Montant"
              class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
              type="number"
              required
            />
          </div>
          <div class="mb-4">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2">
              Moyen de paiement
            </label>
            <input
              v-model="paymentData.MoyenPayement"
              class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
              type="text"
              required
            />
          </div>
          <div class="mb-4">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2">
              Responsable financement
            </label>
            <input
              v-model="paymentData.ResponsablePayement"
              class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
              type="text"
              required
            />
          </div>
          <div class="flex justify-end">
            <button
              type="button"
              @click="closePaymentModal"
              class="ml-2 px-4 py-2 font-medium text-gray-700 bg-gray-200 rounded-md hover:bg-gray-300"
            >
              Annuler
            </button>
            <button
              type="submit"
              class="ml-2 px-4 py-2 font-medium text-white bg-green-500 rounded-md hover:bg-green-600"
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
import { ref } from 'vue';

// Données des inscriptions
const inscriptions = await $fetch("/api/listinscrit");
const inscription = inscriptions.data;

// Gestion du modal d'ajout d'élève
const isModalOpen = ref(false);
const newEleve = ref({
  nom: '',
  prenom: '',
  email: '',
  telephone: '',
  dateNaissance: '',
});

function openModal() {
  isModalOpen.value = true;
}

function closeModal() {
  isModalOpen.value = false;
}

function addEleve() {
  // Logique pour ajouter un élève
  closeModal();
}

// Gestion du popup de paiement
const isPaymentModalOpen = ref(false);
const paymentData = ref({
  datePayement: '',
  Montant: '',
  MoyenPayement: '',
  ResponsablePayement: '',
  Id_Incription: null, // Ajout de l'ID de l'inscription
});

function openPaymentModal(inscriptionId) {
  paymentData.value = {
    datePayement: '',
    Montant: '',
    MoyenPayement: '',
    ResponsablePayement: '',
    Id_Incription: inscriptionId, // Stocker l'ID de l'inscription
  };
  isPaymentModalOpen.value = true;
}

function closePaymentModal() {
  isPaymentModalOpen.value = false;
}

async function sendPayment() {
  try {
    const response = await $fetch('/api/payement', {
      method: 'POST',
      body: {
        Id_Incription: paymentData.value.Id_Incription,
        montant: paymentData.value.Montant,
        moyenpayement: paymentData.value.MoyenPayement,
        reponsablefinancement: paymentData.value.ResponsablePayement,
        totatpayement: parseFloat(paymentData.value.Montant), // Calculer le total payé
      },
    });

    // Fermer le popup après la soumission
    closePaymentModal();

    // Rediriger ou afficher un message de succès
    alert('Paiement effectué avec succès !');
  } catch (error) {
    console.error('Erreur lors de l\'envoi du paiement :', error);
    alert('Une erreur est survenue lors de l\'envoi du paiement.');
  }
}
</script>