<template>
    <div class="flex justify-center m">
      <div class="flex justify-center mt-5 text-2xl font-serif text-yellow-500 shadow-lg w-96">
      Payement
    </div>
    </div>
    
  <section class="flex flex-wrap justify-center items-center w-full mt-6">
    
  <form @submit.prevent="SendPayement()" class="w-full max-w-7xl" >
    
    <div class="flex flex-wrap -mx-3 mb-6">
      <!-- <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap" >
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" placeholder=""  for="grid-first-name">
         nom 
        </label>
        <input v-model="nomI" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-red-500 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white" id="grid-first-name" type="text" >
         <p class="text-red-500 text-xs italic">Please fill out this field.</p> 
      </div>
      <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
          Prénoms
        </label>
         <input v-model="prenomI" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-password" type="text" p>
         <p class="text-red-500 text-xs italic">Please fill out this field.</p> 
      </div> -->
    </div>
    <div class="flex flex-wrap -mx-3 mb-6">

      <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
          Date de payement
        </label>
         <input v-model="datePayement" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-password" type="date" >
        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
      </div>

      <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
          Montant
        </label>
         <input v-model="Montant" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-password" type="number" >
        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
      </div>
      <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
          Moyen de Payement 
        </label>
         <input v-model="MoyenPayement" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-password" type="text" >
        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
      </div>
      <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
          Responsable Financement
        </label>
         <input v-model="ResponsablePayement" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-password" type="text" >
        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
      </div>
      
    </div>
    
    
    <div class="flex flex-wrap space-x-10">
      <NuxtLink to="/mere" class="bg-yellow-500 hover:bg-blue-600 text-white font-bold py-2 px-4 border boedr-700 rounded">
      Annuler
      </NuxtLink>
      <button type="submit"   class="bg-green-500 hover:bg-blue-600 text-white font-bold py-2 px-4 border boedr-700 rounded">
      Confirmer
      </button>
      <!-- <button class="bg-green-500 hover:bg-blue-600 text-white font-bold py-2 px-4 border boedr-700 rounded">Submit</button> -->
  </div>
  
  </form>
  </section>
  </template>

<script setup>
  import { useRoute } from 'vue-router';
  const router = useRoute()
  const {data:inscriptions} = await $fetch(`/api/pay/${router.params.id}`)
  const inscription=inscriptions;
//   let nomI = inscription.nomenfant;
//   let prenomI = inscription.prenomenfant;
  let id= inscription.Id_Incription
  
  const datePayement = ref('');
  const Montant= ref('');
  const MoyenPayement = ref('');
  const ResponsablePayement = ref('');
  let TotalPaye = 0

  async function SendPayement() {
    const response = await $fetch('/api/payement', {
        method: 'POST',
        body: {
            Id_Incription:id,
            montant:Montant.value,
            moyenpayement:MoyenPayement.value,
            reponsablefinancement:ResponsablePayement.value,
            totatpayement:TotalPaye+Montant.value,
            

        },

    })
    
    // router.push({ path: "/professeur" })


}

</script>
  