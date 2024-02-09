<template>
    <div class="flex justify-center m">
      <div class="flex justify-center mt-5 text-2xl font-serif text-yellow-500 shadow-lg w-96">
      Information de l'enfant
    </div>
    </div>
    
  <section class="flex flex-wrap justify-center items-center w-full mt-6">
    
  <form class="w-full max-w-7xl">
    
    <div class="flex flex-wrap -mx-3 mb-6">
      <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
         Nom
        </label>
        <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-red-500 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white" id="grid-first-name" type="text" placeholder="Jane">
        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
      </div>
      <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
          Prénoms
        </label>
         <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-password" type="password" placeholder="******************">
        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
      </div>
    </div>
    <div class="flex flex-wrap -mx-3 mb-6">
        <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold " for="grid-first-name">
          Genre
        </label>
         
         
        <label for="countries" class="block  text-sm font-medium text-gray-900 dark:text-black"></label>
        <div class="appearance-none flex space-x-5 w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500">
                                   
            <div class="flex">
                <div class="flex items-center me-4">
                    <input id="inline-radio" type="radio" value="" name="inline-radio-group" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                    <label for="inline-radio" class="ms-2 text-sm font-medium text-gray-900 ">Masculin</label>
                </div>
                <div class="flex items-center me-4">
                    <input id="inline-2-radio" type="radio" value="" name="inline-radio-group" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                    <label for="inline-2-radio" class="ms-2 text-sm font-medium text-gray-900 ">Féminin</label>
                </div>
                
            </div>

        </div>
        
        
        

        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
      </div>
      <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold " for="grid-first-name">
          Genre
        </label>
         
         
        <label for="countries" class="block  text-sm font-medium text-gray-900 dark:text-black"></label>
        <select id="countries" class="appearance-none block w-full h-12 bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4  leading-tight focus:outline-none focus:bg-white focus:border-gray-500">
        <option selected>Choisir le sexe</option>
        <option value="US">M</option>
        <option value="CA">F</option>
        
        </select>

        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
      </div>
      <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
          Lieu d'habitation
        </label>
         <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-password" type="password" placeholder="******************fabio">
        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
      </div>
      <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
          Numero de téléphone
        </label>
         <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-password" type="password" placeholder="******************">
        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
      </div>
      <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
          Email
        </label>
         <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-password" type="password" placeholder="******************">
        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
      </div>
      <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
          Date de naissance
        </label>
         <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-password" type="date" placeholder="******************">
        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
      </div>
      <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
          Lieu de naissance
        </label>
         <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-password" type="password" placeholder="******************fabio">
        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
      </div>
      <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold " for="grid-first-name">
          Club
        </label>
        <label for="countries" class="block  text-sm font-medium text-gray-900 dark:text-black"></label>
        <select id="countries" class="appearance-none block w-full h-12 bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4  leading-tight focus:outline-none focus:bg-white focus:border-gray-500">
        <option selected>Choisir un groupe</option>
        <option value="US">M</option>
        <option value="CA">F</option>
  
         </select>
      </div>
      <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
          Date d'entréé à l'école du dimanche
        </label>
         <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-password" type="date" placeholder="******************fabio">
        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
      </div>
      <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
  <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold" for="grid-first-name">
    L'enfant-il orphelin
  </label>

  <div class="appearance-none flex space-x-5 w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500">
    <div class="flex">
      <div class="flex items-center me-4">
        <input id="inline-radio-oui" type="radio" value="oui" name="inline-radio-group" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
        <label for="inline-radio-oui" class="ms-2 text-sm font-medium text-gray-900">Oui</label>
      </div>
      <div class="flex items-center me-4">
        <input id="inline-radio-non" type="radio" value="non" name="inline-radio-group" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
        <label for="inline-radio-non" class="ms-2 text-sm font-medium text-gray-900">Non</label>
      </div>
    </div>
  </div>

  <div id="onglet-enfant" class="hidden w-full mt-4">
    <!-- Contenu de l'onglet -->
    <p>Ce contenu s'affiche si 'Oui' est sélectionné fabrice.</p>
  </div>


        
        
        

        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
      </div>
    </div>
    
    <div class="flex flex-wrap space-x-10">
      <NuxtLink to="/mere" class="bg-yellow-500 hover:bg-blue-600 text-white font-bold py-2 px-4 border boedr-700 rounded">
      Retour
      </NuxtLink>
      <NuxtLink to="/mere" class="bg-green-500 hover:bg-blue-600 text-white font-bold py-2 px-4 border boedr-700 rounded">
      Suivant
      </NuxtLink>
  </div>
  
  </form>
  </section>
  </template>
  <script>
  // Ajoutez un gestionnaire d'événements pour détecter le changement de la case à cocher
  document.addEventListener('DOMContentLoaded', function () {
    const radioOui = document.getElementById('inline-radio-oui');
    const ongletEnfant = document.getElementById('onglet-enfant');

    radioOui.addEventListener('change', function () {
      ongletEnfant.style.display = radioOui.checked ? 'block' : 'none';
    });
  });
</script>
  