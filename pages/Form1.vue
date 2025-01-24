<script lang="ts" setup>

// const Pere = await  $fetch('/api/Pere')
// const peres = Pere.data

const Id_Pere = ref('');
const email = ref('');
const profession = ref('');
const nompere= ref('');
const prenompere=ref('');
const lieuhabitation=ref();
const numerotelephone=ref();
const religionpere=ref('');
const eglisepere=ref('')
const router = useRouter()

async function SendPere() {
    const response = await fetch('/api/Pere', {
        method: "POST",
        body: JSON.stringify({
            Id_Pere: Id_Pere.value,
            email: email.value,
            profession:profession.value,
            nompere:nompere.value,
            prenompere:prenompere.value,
            lieuhabitation:lieuhabitation.value,
            numerotelephone:numerotelephone.value,
            religionpere: religionpere.value,
            eglisepere:eglisepere.value


        }),

    })
    router.push({ path: "/mere" })


}


</script>
<template>
  <div class="flex justify-center m">
    <div class="flex justify-center mt-5 text-2xl font-serif text-yellow-500 shadow-lg w-96">
    Information du père
  </div>
  </div>
  
<section class="flex flex-wrap justify-center items-center w-full mt-6">
  
<form @submit.prevent="SendPere" class="w-full max-w-7xl">
  
  <div class="flex flex-wrap -mx-3 mb-6">
    <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
      <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
       Nom du père
      </label>
      <input v-model="nompere" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-red-500 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white" id="grid-first-name" type="text" placeholder="Jane">
      <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
    </div>
    <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
      <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
        Prénoms du père
      </label>
       <input  v-model="prenompere" type="text" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500">
      <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
    </div>
  </div>
  <div class="flex flex-wrap -mx-3 mb-6">
    <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
      <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
        Lieu d'habitaion
      </label>
       <input v-model="lieuhabitation" type="text" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-password" >
      <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
    </div>
    <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
      <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
        Numéro de téléphone
      </label>
       <input v-model="numerotelephone" type="text" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-password"    >
      <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
    </div>
    <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
      <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
        Email
      </label>
       <input v-model="email" type="email" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-password"    >
      <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
    </div>
    <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
      <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
        Profession
      </label>
       <input v-model="profession" type="text" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-password"    >
      <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
    </div>
    <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
      <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
        Réligion
      </label>
       <input v-model="religionpere" type="text" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-password"    >
      <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
    </div>
    <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
      <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
        Eglise
      </label>
       <input v-model="eglisepere" type="text" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-password"    >
      <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
    </div>
  </div>
  <div class="flex flex-wrap space-x-10">
    <!-- <NuxtLink to="/" class="bg-yellow-500 hover:bg-blue-600 text-white font-bold py-2 px-4 border boedr-700 rounded">
    Retour
    </NuxtLink> -->
    <button type="reset" class="bg-yellow-500 hover:bg-blue-600 text-white font-bold py-2 px-4 border boedr-700 rounded">
      Retour
    </button>
    <button type="submit" class="bg-green-500 hover:bg-blue-600 text-white font-bold py-2 px-4 border boedr-700 rounded">
      Suivant
    </button>
    <!-- <NuxtLink to="/mere" class="bg-green-500 hover:bg-blue-600 text-white font-bold py-2 px-4 border boedr-700 rounded">
    Suivant
    </NuxtLink> -->
</div>

</form>
</section>
</template>
