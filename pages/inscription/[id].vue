<template>
    <div class="flex justify-center m">
      <div class="flex justify-center mt-5 text-2xl font-serif text-yellow-500 shadow-lg w-96">
      Inscription
    </div>
    </div>
    
  <section class="flex flex-wrap justify-center items-center w-full mt-6">
    
  <form class="w-full max-w-7xl">
    
    <div class="flex flex-wrap -mx-3 mb-6">
      <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap" >
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" placeholder=""  for="grid-first-name">
         nom 
        </label>
        <input v-model="nom" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-red-500 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white" id="grid-first-name" type="text" >
        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
      </div>
      <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
          Prénoms
        </label>
         <input v-model="prenom" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-password" type="text" p>
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
        <select   id="countries" class="appearance-none block w-full h-12 bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4  leading-tight focus:outline-none focus:bg-white focus:border-gray-500">
            <option v-for="cls in classe" :key="cls.Id_classe" value="class" >{{ cls.nomclass}}</option>
        
        
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
         <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-password" type="date" placeholder="******************">
        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
      </div>
      

  


        
        
        

        <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
     
    </div>
    
    <div class="flex flex-wrap space-x-10">
      <NuxtLink to="/mere" class="bg-yellow-500 hover:bg-blue-600 text-white font-bold py-2 px-4 border boedr-700 rounded">
      Annuler
      </NuxtLink>
      <NuxtLink to="/mere" class="bg-green-500 hover:bg-blue-600 text-white font-bold py-2 px-4 border boedr-700 rounded">
      Confirmer
      </NuxtLink>
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
  let nom = enfant.nomenfant;
  let prenom = enfant.prenomenfant;
  
  async function SendProfesseur() {
    const response = await fetch('/api/professeur', {
        method: "POST",
        body: JSON.stringify({
            nomprof: nomprof.value,
            prenprof: prenprof.value,
            sexeprof: sexeprof.value,
            telephone: telephone.value,
            statutprof: statutprof.value,
            email: email.value
        }),

    })
    router.push({ path: "/professeur" })


}

</script>
  