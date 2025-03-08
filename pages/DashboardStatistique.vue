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

    <div class="flex justify-between items-center mb-4">
      <div>
        <label class="block text-gray-700">Éléments par page :</label>
        <select 
          v-model="itemsPerPage"
          class="p-2 border rounded-lg"
        >
          <option value="5">5</option>
          <option value="10">10</option>
          <option value="20">20</option>
          <option value="50">50</option>
        </select>
      </div>
      <button
        class="ml-auto mb-4 px-4 py-2 font-medium text-white bg-blue-600 rounded-md hover:bg-blue-500"
        @click="openModalPere"
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
          <th class="px-4 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Action</th>
        </tr>
      </thead>
      <tbody class="bg-white divide-y divide-gray-200">
        <tr v-for="enf in paginatedEnfants" :key="enf.Id_Enfant">
          <td class="px-4 py-4 whitespace-nowrap">{{ enf.Id_Enfant }}</td>
          <td class="px-4 py-4 whitespace-nowrap">{{ enf.nomenfant }}</td>
          <td class="px-4 py-4 whitespace-nowrap">{{ enf.prenomenfant }}</td>
          <td class="px-4 py-4 whitespace-nowrap">{{ enf.genre }}</td>
          <td class="px-4 py-4 whitespace-nowrap">
            <div class="flex justify-center space-x-2">
              <button 
                @click="ouvrirModal(enf)"
                class="bg-green-500 text-white px-3 py-1 rounded shadow-md hover:bg-green-600 transition duration-200"
              >
                Inscrire
              </button>
              <button 
                @click="ouvrirModalModification(enf)"
                class="px-4 py-2 font-medium text-white bg-yellow-500 rounded-md hover:bg-yellow-600"
              >
                Modifier
              </button>
              <button 
                @click="supprimerEnfant(enf)"
                class="px-4 py-2 font-medium text-white bg-red-500 rounded-md hover:bg-red-600"
              >
                Supprimer
              </button>
            </div>
          </td>
        </tr>
      </tbody>
    </table>

    <!-- Pagination -->
    <div class="flex justify-center mt-6">
      <button
        @click="previousPage"
        :disabled="currentPage === 1"
        class="px-4 py-2 mx-1 bg-gray-200 rounded-md hover:bg-gray-300"
      >
        Précédent
      </button>
      <span class="px-4 py-2 mx-1">{{ currentPage }} / {{ totalPages }}</span>
      <button
        @click="nextPage"
        :disabled="currentPage === totalPages"
        class="px-4 py-2 mx-1 bg-gray-200 rounded-md hover:bg-gray-300"
      >
        Suivant
      </button>
    </div>

    <!-- Modal pour le formulaire du père -->
    <div v-if="modalPereOuvert" class="fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center">
      <div class="bg-white p-6 rounded-lg shadow-lg w-96 max-h-[90vh] overflow-y-auto">
        <h2 class="text-xl font-semibold mb-4">Information du père</h2>
        <form @submit.prevent="SendPere">
          <div class="mb-4">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="nompere">
              Nom du père
            </label>
            <input v-model="nompere" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-red-500 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white" id="nompere" type="text" placeholder="Jane">
          </div>
          <div class="mb-4">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="prenompere">
              Prénoms du père
            </label>
            <input v-model="prenompere" type="text" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="prenompere">
          </div>
          <div class="mb-4">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="lieuhabitation">
              Lieu d'habitation
            </label>
            <input v-model="lieuhabitation" type="text" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="lieuhabitation">
          </div>
          <div class="mb-4">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="numerotelephone">
              Numéro de téléphone
            </label>
            <input v-model="numerotelephone" type="text" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="numerotelephone">
          </div>
          <div class="mb-4">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="email">
              Email
            </label>
            <input v-model="email" type="email" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500">
          </div>
          <div class="mb-4">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="profession">
              Profession
            </label>
            <input v-model="profession" type="text" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="profession">
          </div>
          <div class="mb-4">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="religionpere">
              Religion
            </label>
            <input v-model="religionpere" type="text" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="religionpere">
          </div>
          <div class="mb-4">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="eglisepere">
              Eglise
            </label>
            <input v-model="eglisepere" type="text" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="eglisepere">
          </div>
          <div class="flex justify-end mt-6">
            <button 
              @click="fermerModalPere"
              type="button"
              class="bg-gray-400 text-white px-4 py-2 rounded-lg mr-2 hover:bg-gray-500"
            >
              Annuler
            </button>
            <button 
              @click="openModalMere"
              type="button"
              class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600"
            >
              Suivant
            </button>
          </div>
        </form>
      </div>
    </div>

    <!-- Modal pour le formulaire de la mère -->
    <div v-if="modalMereOuvert" class="fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center">
      <div class="bg-white p-6 rounded-lg shadow-lg w-96 max-h-[90vh] overflow-y-auto">
        <h2 class="text-xl font-semibold mb-4">Information de la mère</h2>
        <form @submit.prevent="SendMere">
          <div class="mb-4">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="nommere">
              Nom de la mère
            </label>
            <input v-model="nommere" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-red-500 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white" id="nommere" type="text" placeholder="Jane">
          </div>
          <div class="mb-4">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="prenommere">
              Prénoms de la mère
            </label>
            <input v-model="prenommere" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="prenommere">
          </div>
          <div class="mb-4">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="lieuhabitationmere">
              Lieu d'habitation
            </label>
            <input v-model="lieuhabitationmere" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="lieuhabitationmere">
          </div>
          <div class="mb-4">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="numeromere">
              Numéro de téléphone
            </label>
            <input v-model="numeromere" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="numeromere">
          </div>
          <div class="mb-4">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="emailmere">
              Email
            </label>
            <input v-model="emailmere" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="emailmere">
          </div>
          <div class="mb-4">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="professionmere">
              Profession
            </label>
            <input v-model="professionmere" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="professionmere">
          </div>
          <div class="mb-4">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="religionmere">
              Religion
            </label>
            <input v-model="religionmere" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="religionmere">
          </div>
          <div class="mb-4">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="eglisemere">
              Eglise
            </label>
            <input v-model="eglisemere" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="eglisemere">
          </div>
          <div class="flex justify-end mt-6">
            <button 
              @click="fermerModalMere"
              type="button"
              class="bg-gray-400 text-white px-4 py-2 rounded-lg mr-2 hover:bg-gray-500"
            >
              Retour
            </button>
            <button 
              @click="openModalEnfant"
              type="button"
              class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600"
            >
              Suivant
            </button>
          </div>
        </form>
      </div>
    </div>

    <!-- Modal pour le formulaire de l'enfant -->
    <div v-if="modalEnfantOuvert" class="fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center">
      <div class="bg-white p-6 rounded-lg shadow-lg w-96 max-h-[90vh] overflow-y-auto">
        <h2 class="text-xl font-semibold mb-4">Information de l'enfant</h2>
        <form @submit.prevent="SendEnfant">
          <div class="mb-4">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="nomenfant">
              Nom de l'enfant
            </label>
            <input v-model="nomenfant" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-red-500 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white" id="nomenfant" type="text" placeholder="Jane">
          </div>
          <div class="mb-4">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="prenomenfant">
              Prénoms de l'enfant
            </label>
            <input v-model="prenomenfant" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="prenomenfant">
          </div>
          <div class="mb-4">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="genre">
              Genre
            </label>
            <select v-model="genre" id="genre" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500">
              <option value="M">Masculin</option>
              <option value="F">Féminin</option>
            </select>
          </div>
          <div class="mb-4">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="lieuhabitation">
              Lieu d'habitation
            </label>
            <input v-model="lieuhabitation" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="lieuhabitation">
          </div>
          <div class="mb-4">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="numerotelephone">
              Numéro de téléphone
            </label>
            <input v-model="numerotelephone" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="numerotelephone">
          </div>
          <div class="mb-4">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="emailenfant">
              Email
            </label>
            <input v-model="emailenfant" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="emailenfant">
          </div>
          <div class="mb-4">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="datenaissance">
              Date de naissance
            </label>
            <input v-model="datenaissance" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="datenaissance" type="date">
          </div>
          <div class="mb-4">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="lieunaissanceenfant">
              Lieu de naissance
            </label>
            <input v-model="lieunaissanceenfant" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="lieunaissanceenfant">
          </div>
          <div class="mb-4">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="club">
              Club
            </label>
            <select v-model="club" id="club" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500">
              <option value="Club A">Club A</option>
              <option value="Club B">Club B</option>
            </select>
          </div>
          <div class="mb-4">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="dateentreed">
              Date d'entrée à l'école du dimanche
            </label>
            <input v-model="dateentreed" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="dateentreed" type="date">
          </div>
          <div class="mb-4">
            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="orphelinpas">
              L'enfant est-il orphelin ?
            </label>
            <div class="flex space-x-4">
              <label class="flex items-center">
                <input v-model="orphelinpas" type="radio" value="oui" class="form-radio h-4 w-4 text-blue-600">
                <span class="ml-2">Oui</span>
              </label>
              <label class="flex items-center">
                <input v-model="orphelinpas" type="radio" value="non" class="form-radio h-4 w-4 text-blue-600">
                <span class="ml-2">Non</span>
              </label>
            </div>
          </div>
          <div class="flex justify-end mt-6">
            <button 
              @click="fermerModalEnfant"
              type="button"
              class="bg-gray-400 text-white px-4 py-2 rounded-lg mr-2 hover:bg-gray-500"
            >
              Retour
            </button>
            <button 
              type="submit"
              class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600"
            >
              Terminer
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted, watch } from "vue";

// Récupération des données des enfants
const enfants = await $fetch("/api/listeenregist");
const enfant = ref(enfants.data);

// Récupération des données des classes
const classes = ref([]);

onMounted(async () => {
  const response = await $fetch("/api/classe");
  classes.value = response.data;
});

// Variables pour les statistiques des cartes
const totalGarcons = computed(() => enfant.value.filter(e => e.genre === 'M').length);
const totalFilles = computed(() => enfant.value.filter(e => e.genre === 'F').length);
const totalOrphelins = computed(() => enfant.value.filter(e => e.orphelinpas === 'oui').length);

// Variables pour les modales
const modalPereOuvert = ref(false);
const modalMereOuvert = ref(false);
const modalEnfantOuvert = ref(false);

// Variables pour les formulaires
const nompere = ref('');
const prenompere = ref('');
const lieuhabitation = ref('');
const numerotelephone = ref('');
const email = ref('');
const profession = ref('');
const religionpere = ref('');
const eglisepere = ref('');

const nommere = ref('');
const prenommere = ref('');
const lieuhabitationmere = ref('');
const numeromere = ref('');
const emailmere = ref('');
const professionmere = ref('');
const religionmere = ref('');
const eglisemere = ref('');

const nomenfant = ref('');
const prenomenfant = ref('');
const genre = ref('');
const lieunaissanceenfant = ref('');
const club = ref('');
const dateentreed = ref('');
const orphelinpas = ref('');
const datenaissance = ref('');
const emailenfant = ref('');

// Fonctions pour ouvrir/fermer les modales
const openModalPere = () => {
  modalPereOuvert.value = true;
};

const fermerModalPere = () => {
  modalPereOuvert.value = false;
};

const openModalMere = () => {
  modalMereOuvert.value = true;
  modalPereOuvert.value = false;
};

const fermerModalMere = () => {
  modalMereOuvert.value = false;
};

const openModalEnfant = () => {
  modalEnfantOuvert.value = true;
  modalMereOuvert.value = false;
};

const fermerModalEnfant = () => {
  modalEnfantOuvert.value = false;
};

// Fonctions pour soumettre les formulaires
const SendPere = async () => {
  // Logique pour soumettre le formulaire du père
  console.log("Formulaire du père soumis :", {
    nompere: nompere.value,
    prenompere: prenompere.value,
    lieuhabitation: lieuhabitation.value,
    numerotelephone: numerotelephone.value,
    email: email.value,
    profession: profession.value,
    religionpere: religionpere.value,
    eglisepere: eglisepere.value,
  });
};

const SendMere = async () => {
  // Logique pour soumettre le formulaire de la mère
  console.log("Formulaire de la mère soumis :", {
    nommere: nommere.value,
    prenommere: prenommere.value,
    lieuhabitationmere: lieuhabitationmere.value,
    numeromere: numeromere.value,
    emailmere: emailmere.value,
    professionmere: professionmere.value,
    religionmere: religionmere.value,
    eglisemere: eglisemere.value,
  });
};

const SendEnfant = async () => {
  // Logique pour soumettre le formulaire de l'enfant
  console.log("Formulaire de l'enfant soumis :", {
    nomenfant: nomenfant.value,
    prenomenfant: prenomenfant.value,
    genre: genre.value,
    lieunaissanceenfant: lieunaissanceenfant.value,
    club: club.value,
    dateentreed: dateentreed.value,
    orphelinpas: orphelinpas.value,
    datenaissance: datenaissance.value,
    emailenfant: emailenfant.value,
  });
};

// Pagination
const itemsPerPage = ref(10); // Nombre d'éléments par page (valeur par défaut)
const currentPage = ref(1); // Page actuelle

// Calcul des enfants paginés
const paginatedEnfants = computed(() => {
  const start = (currentPage.value - 1) * itemsPerPage.value;
  const end = start + itemsPerPage.value;
  return enfant.value.slice(start, end);
});

// Calcul du nombre total de pages
const totalPages = computed(() => Math.ceil(enfant.value.length / itemsPerPage.value));

// Fonction pour aller à la page suivante
const nextPage = () => {
  if (currentPage.value < totalPages.value) {
    currentPage.value++;
  }
};

// Fonction pour aller à la page précédente
const previousPage = () => {
  if (currentPage.value > 1) {
    currentPage.value--;
  }
};

// Réinitialiser la pagination lorsque itemsPerPage change
watch(itemsPerPage, () => {
  currentPage.value = 1; // Revenir à la première page
});
</script>