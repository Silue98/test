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
          <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">N°</th>
          <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nom</th>
          <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Prénom</th>
          <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date de naissance</th>
          <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date d'inscription</th>
          <!-- <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Statut</th> -->
          <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Action</th>
        </tr>
      </thead>
      <tbody class="bg-white divide-y divide-gray-200">
        <tr v-for="insc in inscription " :key="insc.Id_Incription">
          <td>{{ insc.Id_Incription || 'Nom indisponible' }}</td>

          <td>{{ insc.nomenfant || 'Nom indisponible' }}</td>
          <td class="px-6 py-4 whitespace-nowrap">{{ insc.prenom || 'indisponible' }}</td>
          <td class="px-6 py-4 whitespace-nowrap">{{ insc.dateNaissance || 'indisponible' }}</td>

          <td class="px-6 py-4 whitespace-nowrap">{{ insc.dateinscription || 'indisponible' }}</td>

          
          <!-- <td class="px-6 py-4 whitespace-nowrap">k</td>
          <td class="px-6 py-4 whitespace-nowrap">{{ eleve.email }}</td>
          <td class="px-6 py-4 whitespace-nowrap">{{ eleve.telephone }}</td>
          <td class="px-6 py-4 whitespace-nowrap">{{ eleve.dateNaissance }}</td>
          <td class="px-6 py-4 whitespace-nowrap">
            <span v-if="eleve.status === 'active'" class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">Actif</span>
            <span v-else class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-red-100 text-red-800">Inactif</span>
          </td> -->
          <td class="px-6 py-4 whitespace-nowrap">
            <button class="px-4 py-2 font-medium text-white bg-blue-600 rounded-md hover:bg-blue-500">Effectuer un paiement</button>
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
            <label class="block text-sm font-medium text-gray-700">Prénom</label>
            <input v-model="newEleve.prenom" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500" type="text" placeholder="Prénom de l'élève" required />
          </div>
          <div class="mb-4">
            <label class="block text-sm font-medium text-gray-700">Email</label>
            <input v-model="newEleve.email" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500" type="email" placeholder="Email de l'élève" required />
          </div>
          <div class="mb-4">
            <label class="block text-sm font-medium text-gray-700">Numéro de téléphone</label>
            <input v-model="newEleve.telephone" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500" type="text" placeholder="Numéro de téléphone" required />
          </div>
          <div class="mb-4">
            <label class="block text-sm font-medium text-gray-700">Date de naissance</label>
            <input v-model="newEleve.dateNaissance" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500" type="date" required />
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

    
    <script setup>
    
    const inscriptions = await $fetch("/api/listinscrit")
    
    const inscription=inscriptions.data
    
    //console.log(enfant)
    </script>

<!-- <section class="py-1 bg-blueGray-50 -mt-8">
  <div class="w-full xl:w-8/12 mb-12 xl:mb-0 px-4 mx-auto mt-24">
    <div class="relative flex flex-col min-w-0 break-words bg-white w-full mb-6 shadow-lg rounded ">
      <div class="rounded-t mb-0 px-4 py-3 border-0">
        <div class="flex flex-wrap items-center">
          <div class="relative w-full px-4 max-w-full flex-grow flex-1">
            <h3 class="font-semibold text-base text-blueGray-700">Enfants inscrits</h3>
          </div>
          <div class="relative w-full px-4 max-w-full flex-grow flex-1 text-right">
              <NuxtLink to="Form1" class="bg-green-500 text-white active:bg-indigo-600 text-xs font-bold uppercase px-3 py-1 rounded outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150" type="button">Nouveau</NuxtLink>
            <button class="bg-green-500 text-white active:bg-indigo-600 text-xs font-bold uppercase px-3 py-1 rounded outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150" type="button">See all</button>
          </div>
        </div>
      </div>
  
      <div class="block w-full overflow-x-auto">
        <table class="items-center bg-transparent w-full border-collapse ">
          <thead>
            <tr>
              <th class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">
                            N°
                          </th>
            <th class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">
                            Nom
                          </th>
             <th class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">
                            PRENOM
                          </th>
            <th class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">
                            Date Inscription
          </th>
          
             <th class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">Action</th>             
            </tr>
  
          </thead>
  
          <tbody>
            <tr v-for="insc in inscription " :key="insc.Id_Incription">
              <th class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 text-left text-blueGray-700 ">
                {{insc.Id_Incription}} 
              </th>
              <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 ">
                {{ insc.nomenfant}}
              </td>
              <td class="border-t-0 px-6 align-center border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
                {{insc.prenomenfant}}
              </td>
              <td class="border-t-0 px-6 align-center border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
                {{insc.dateinscription}}
              </td>
              
              <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
                <NuxtLink :to="`/PayementCard/${insc.Id_Incription}`"  class="bg-green-500 text-white active:bg-indigo-600 text-xs font-bold uppercase px-3 py-1 rounded outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150" type="button">Effectuer payement</NuxtLink>
                <!-- <NuxtLink :to="`/PdfPaiement/${insc.Id_Incription}`"  class="bg-green-500 text-white active:bg-indigo-600 text-xs font-bold uppercase px-3 py-1 rounded outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150" type="button">Voir</NuxtLink> -->
              <!-- </td> -->
              
            <!-- </tr> -->
            
            -->
            
            
          <!-- </tbody> -->
  
        <!-- </table>
      </div> -->
    <!-- </div>
  </div>
  <footer class="relative pt-8 pb-6 mt-16">
    <div class="container mx-auto px-4">
      <div class="flex flex-wrap items-center md:justify-between justify-center">
        <div class="w-full md:w-6/12 px-4 mx-auto text-center">
          <div class="text-sm text-blueGray-500 font-semibold py-1">
            <!-- N'guessan <a href="https://www.creative-tim.com/product/notus-js" class="text-blueGray-500 hover:text-gray-800" target="_blank">Fabrice</a> by <a href="https://www.creative-tim.com" class="text-blueGray-500 hover:text-blueGray-800" target="_blank"> SMART DIGITAL</a>. -->
          <!-- </div> -->
        <!-- </div>
      </div> -->
    <!-- </div> -->
  <!-- </footer> -->
