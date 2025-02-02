<template>
  <section class="py-1 bg-blueGray-50 -mt-8">
    <form @submit.prevent="SendAppelA1">
      <div class="w-full xl:w-8/12 mb-12 xl:mb-0 px-4 mx-auto mt-24">
        <div class="relative flex flex-col min-w-0 break-words bg-white w-full mb-6 shadow-lg rounded">
          <div class="rounded-t mb-0 px-4 py-3 border-0">
            <div class="flex flex-wrap items-center">
              <div class="relative w-full px-4 max-w-full flex-grow flex-1">
                <h3 class="font-semibold text-base text-blueGray-700">Enfants inscrits en A1</h3>
              </div>
              <div class="relative w-full px-4 max-w-full flex-grow flex-1 text-right">
                <button type="submit" class="bg-green-500 text-white active:bg-indigo-600 text-xs font-bold uppercase px-3 py-1 rounded outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150">Valider L'appel</button>
                <button class="bg-green-500 text-white active:bg-indigo-600 text-xs font-bold uppercase px-3 py-1 rounded outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150" type="button">See all</button>
              </div>
            </div>
          </div>

          <div class="block w-full overflow-x-auto">
            <table class="items-center bg-transparent w-full border-collapse">
              <thead>
                <tr>
                  <th class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">N°</th>
                  <th class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">Nom</th>
                  <th class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">PRENOM</th>
                  <th class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">Motif</th>
                  <th class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">Date Appel</th>
                  <th class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">Absent(e)</th>
                  <th class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">Présent(e)</th>
                </tr>
              </thead>

              <tbody>
                <tr v-for="(insc, index) in inscription" :key="insc.Id_Incription">
                  <th class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 text-left text-blueGray-700">{{ insc.Id_Incription }}</th>
                  <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">{{ insc.nomenfant }}</td>
                  <td class="border-t-0 px-6 align-center border-l-0 border-r-0 text-xs whitespace-nowrap p-4">{{ insc.prenomenfant }}</td>
                  <td class="border-t-0 px-6 align-center border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
                    <input v-model="insc.motif" placeholder="Motif absence" type="text" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-1 px-2 mb-1 leading-tight focus:outline-none focus:bg-white focus:border-gray-500">
                  </td>
                  <td class="border-t-0 px-6 align-center border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
                    <input v-model="insc.dateappel" type="date" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-1 px-2 mb-1 leading-tight focus:outline-none focus:bg-white focus:border-gray-500">
                  </td>
                  <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
                    <input type="checkbox" v-model="insc.absent" class="shrink-0 mt-0.5 border-gray-200 rounded text-blue-600 focus:ring-blue-500 disabled:opacity-50 disabled:pointer-events-none">
                  </td>
                  <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
                    <input type="checkbox" v-model="insc.present" class="shrink-0 mt-0.5 border-gray-200 rounded text-blue-600 focus:ring-blue-500 disabled:opacity-50 disabled:pointer-events-none">
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </form>
  </section>
</template>

<script setup lang="ts">
import { ref } from 'vue';

// Récupération des données des enfants inscrits
const inscriptions = await $fetch("/api/A1");
console.log('Données récupérées depuis /api/A1 :', inscriptions.data);

// Initialisation des données avec des valeurs par défaut
const inscription = ref(inscriptions.data.map(insc => ({
  Id_Presence: undefined, // Initialisé à undefined (sera généré côté serveur)
  nomenfant: insc.nomenfant || '', // Si nomenfant est manquant, initialiser à une chaîne vide
  prenomenfant: insc.prenomenfant || '', // Si prenomenfant est manquant, initialiser à une chaîne vide
  classe: insc.classe || 'A1', // Si classe est manquante, initialiser à 'A1'
  motif: '', // Motif initialisé à vide
  dateappel: new Date().toISOString().split('T')[0], // Date du jour par défaut
  present: false, // Présent initialisé à false
  absent: false, // Absent initialisé à false
  Id_Incription: insc.Id_Incription || undefined, // Si Id_Incription est manquant, initialiser à undefined
  Id_Enfant: insc.Id_Enfant || insc.Id_Incription // Utiliser Id_Incription comme Id_Enfant si Id_Enfant est manquant
})));
console.log('Données préparées pour l\'envoi :', inscription);
// Fonction pour envoyer les données de l'appel
async function SendAppelA1() {
  // Créer une nouvelle variable pour stocker les données à envoyer
  const dataToSend = inscription.value.map(insc => ({
    Id_Presence: insc.Id_Presence,
    nomenfant: insc.nomenfant,
    prenomenfant: insc.prenomenfant,
    classe: insc.classe,
    motif: insc.motif || '', // Si motif est undefined, utiliser une chaîne vide
    dateappel: insc.dateappel,
    present: insc.present,
    absent: insc.absent,
    Id_Incription: insc.Id_Incription,
    Id_Enfant: insc.Id_Enfant, // Assurez-vous que ce champ est bien défini
    
  }));
  

  console.log('Données préparées pour l\'envoi :', dataToSend);

  // Envoyer les données à l'API
  const response = await useFetch('/api/AppelA1', {
    method: 'POST',
    body: JSON.stringify(dataToSend),
  });

  // Gestion des erreurs
  if (response.error.value) {
    console.error('Erreur lors de l\'envoi des données', response.error.value);
  } else {
    console.log('Données envoyées avec succès', response.data.value);
    alert('Appel validé avec succès !');
  }
}
</script>