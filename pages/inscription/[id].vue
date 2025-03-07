<template>
    <div class="flex justify-center m">
      <div class="flex justify-center mt-5 text-2xl font-serif text-yellow-500 shadow-lg w-96">
      Inscription
    </div>
    </div>
    
  <section class="flex flex-wrap justify-center items-center w-full mt-6">
    
  <form @submit.prevent="SendInscription()" class="w-full max-w-7xl" >
    
    <div class="flex flex-wrap -mx-3 mb-6">
      <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap" >
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" placeholder=""  for="grid-first-name">
         nom 
        </label>
        <input v-model="nomI" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-red-500 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white" id="grid-first-name" type="text" >
        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
      </div>
      <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
          Prénoms
        </label>
         <input v-model="prenomI" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-password" type="text" p>
        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
      </div>
    </div>
    <div class="flex flex-wrap -mx-3 mb-6">
       
      
        
        

        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
     
      <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold " for="grid-first-name">
          Classe
        </label>
         
         
        <label for="countries" class="block  text-sm font-medium text-gray-900 dark:text-black"></label>
        <select v-model="classs"   placeholder="Choisir une classe"   id="countries" class="appearance-none block w-full h-12 bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4  leading-tight focus:outline-none focus:bg-white focus:border-gray-500">
          
            <option  v-for="cls in classe" :key="cls.Id_classe" :value="cls.Id_classe" >{{ cls.nomclass}}</option>
        
        
        </select>

        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
      </div>
      
      
      
      <!-- <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold " for="grid-first-name">
          Classe
        </label>
         
         
        <label for="countries" class="block  text-sm font-medium text-gray-900 dark:text-black"></label>
        <select id="countries" class="appearance-none block w-full h-12 bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4  leading-tight focus:outline-none focus:bg-white focus:border-gray-500">
        <option selected>Classe</option>
        <option value="US">A1</option>
        <option value="CA">A2</option>
        
        </select>

        
      </div> -->

      <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
          Date de naissance
        </label>
         <input v-model="dateI" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-password" type="date" >
        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
      </div>
      

  


        
        
        

        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
     
    </div>
    
    <div class="flex flex-wrap space-x-10">
      <NuxtLink to="/List" class="bg-yellow-500 hover:bg-blue-600 text-white font-bold py-2 px-4 border boedr-700 rounded">
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
  const classes= await $fetch("/api/classe")
  const classe = classes.data;
  import { useRoute } from 'vue-router';
  const router = useRoute()
  const {data:enfants} = await $fetch(`/api/inscript/${router.params.id}`)
  const enfant=enfants;
  let nomI = enfant.nomenfant;
  let prenomI = enfant.prenomenfant;
  let id= enfant.Id_Enfant
  const classename=classe.nomclass
  

  //const nomI = ref('');
  
  const classs = ref('');
  const dateI = ref(''); 
  
  //const idI =ref('');
  //const prenomI=ref('')
  
  async function SendInscription() {
    const response = await $fetch('/api/inscription', {
        method: 'POST',
        body: {
            
            nomenfant: nomI,
            prenomenfant: prenomI,
            
            Id_classe:classs.value,
            Id_Enfant:id,
            dateinscription:dateI.value,
            classe:classename,
            


        },

    })
    


}




</script>
  