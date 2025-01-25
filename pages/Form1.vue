<template>
  <div class="flex justify-center m">
    <div class="flex justify-center mt-5 text-2xl font-serif text-yellow-500 shadow-lg w-96">
      Information du père
    </div>
  </div>

  <section class="flex flex-wrap justify-center items-center w-full mt-6">
    <form @submit.prevent="SendPere()" class="w-full max-w-7xl">
      <div class="flex flex-wrap -mx-3 mb-6">
        <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
          <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="nompere">
            Nom du père
          </label>
          <input v-model="nompere" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-red-500 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white" id="nompere" type="text" placeholder="Jane">
        </div>
        <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
          <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="prenompere">
            Prénoms du père
          </label>
          <input v-model="prenompere" type="text" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="prenompere">
        </div>
      </div>
      <div class="flex flex-wrap -mx-3 mb-6">
        <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
          <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="lieuhabitation">
            Lieu d'habitation
          </label>
          <input v-model="lieuhabitation" type="text" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="lieuhabitation">
        </div>
        <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
          <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="numerotelephone">
            Numéro de téléphone
          </label>
          <input v-model="numerotelephone" type="text" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="numerotelephone">
        </div>
        <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
          <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="email">
            Email
          </label>
          <input v-model="email"  type="email" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500">
        </div>
        <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
          <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="profession">
            Profession
          </label>
          <input v-model="profession" type="text" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="profession">
        </div>
        <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
          <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="religionpere">
            Religion
          </label>
          <input v-model="religionpere" type="text" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="religionpere">
        </div>
        <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 flex flex-wrap">
          <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="eglisepere">
            Eglise
          </label>
          <input v-model="eglisepere" type="text" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="eglisepere">
        </div>
      </div>
      <div class="flex flex-wrap space-x-10">
        <button type="button" @click="goBack" class="bg-yellow-500 hover:bg-blue-600 text-white font-bold py-2 px-4 border border-700 rounded">
          Retour
        </button>
        <button type="submit" class="bg-green-500 hover:bg-blue-600 text-white font-bold py-2 px-4 border border-700 rounded">
          Suivant
        </button>
      </div>
    </form>
  </section>
</template>

<script lang="ts" setup>
const Id_Pere = ref('');
const email = ref('');
const profession = ref('');
const nompere = ref('');
const prenompere = ref('');
const lieuhabitation = ref('');
const numerotelephone = ref('');
const religionpere = ref('');
const eglisepere = ref('');
const router = useRouter();

async function SendPere() {
  const response = await useFetch('/api/Pere', {
    method: "POST",
    body: JSON.stringify({
      // Id_Pere,
      email:email.value,
      profession: profession.value,
      nompere: nompere.value,
      prenompere: prenompere.value,
      lieuhabitation: lieuhabitation.value,
      numerotelephone: numerotelephone.value,
      religionpere: religionpere.value,
      eglisepere: eglisepere.value
    }),
  });

  if (response) {
    router.push({ path: "/mere" });
   }
}

function goBack() {
  // Add logic for the "Retour" button if needed
  router.back();
}
</script>
