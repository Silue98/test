<template>
    <div class="flex justify-center m">
      <div class="flex justify-center mt-5 text-2xl font-serif text-yellow-500 shadow-lg w-96">
      Information de la mère
    </div>
    </div>
    
  <section class="flex flex-wrap justify-center items-center w-full mt-6">
    
  <form @submit.prevent="SendMere()" class="w-full max-w-7xl">
    
    <div class="flex flex-wrap -mx-3 mb-6">
      <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
         Nom de la mère
        </label>
        <input v-model="nommere" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-red-500 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white" id="grid-first-name" type="text" placeholder="Jane">
        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
      </div>
      <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
          Prénoms de la mère
        </label> 
         <input v-model="prenommere" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-password">
        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
      </div>
    </div>
    <div class="flex flex-wrap -mx-3 mb-6">
      <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
          Lieu d'habitaion
        </label>
         <input v-model="lieuhabitationmere" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-password">
        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
      </div>
      <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
          Numéro de téléphone
        </label>
         <input v-model="numeromere" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-password">
        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
      </div>
      <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
          Email
        </label>
         <input v-model="emailmere" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-password">
        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
      </div>
      <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
          Profession
        </label>
         <input v-model="professionmere" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-password">
        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
      </div>
      <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
          Réligion
        </label>
         <input v-model="religionmere" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-password" type="password">
        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
      </div>
      <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
          Eglise
        </label>
         <input v-model="eglisemere" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-password" type="password">
        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
      </div>
    </div>
    <div class="flex flex-wrap space-x-10">
      <NuxtLink to="/Form1" class="bg-yellow-500 hover:bg-blue-600 text-white font-bold py-2 px-4 border boedr-700 rounded">
      Retour
      </NuxtLink>
      <!-- <NuxtLink to="/children" class="bg-green-500 hover:bg-blue-600 text-white font-bold py-2 px-4 border boedr-700 rounded">
      Suivant
      </NuxtLink> -->
      <button type="submit" class="bg-green-500 hover:bg-blue-600 text-white font-bold py-2 px-4 border boedr-700 rounded">
        Suivant
      </button>
  </div>
  
  </form>
  </section>
  </template>
  <script lang="ts" setup>
  const Id_Mere = ref('');
  const nommere = ref('');
  const prenommere = ref('');
  const lieuhabitationmere = ref('');
  const numeromere = ref('');
  const emailmere = ref('');
  const professionmere = ref('');
  const religionmere = ref('');
  const eglisemere = ref('');
  const router = useRouter();
  
  async function SendMere() {
    const response = await useFetch('/api/Mere', {
      method: "POST",
      body: JSON.stringify({
        // Id_Pere,
        nommere:nommere.value,
        prenommere:prenommere.value,
        lieuhabitationmere:lieuhabitationmere.value,
        numeromere:numeromere.value,
        emailmere:emailmere.value,
        professionmere:professionmere.value,
        religionmere:religionmere.value,
        eglisemere:eglisemere.value,
      }),
    });
  
    if (response) {
      router.push({ path: "/children" });
     }
  }
  
  function goBack() {
    // Add logic for the "Retour" button if needed
    router.back();
  }
  </script>