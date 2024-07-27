<template>
  <div class="flex justify-center m">
    <div class="flex justify-center mt-5 text-2xl font-serif text-yellow-500 shadow-lg w-96">
    Info: {{ inscription.nomenfant }} {{ inscription.prenomenfant }}
  </div>
  </div>
  
  <section>
<section class="flex justify-center items-center w-full mt-6">
  <div ref="pdfSection">
    <div class="border-solid">
      <p>FICHE D'INSCRIPTION</p>
      <p>ANNEE DE FREQUENTATION</p>
    </div>
  </div> 
    

</section>
<div class="flex justify-center items-center">
  <button class="" @click="exportToPDF('my-pdf-file.pdf', pdfSection)">
      IMPRIMER
    </button>
</div>


</section>
</template>

<script setup>


import { useRoute } from 'vue-router';
const router = useRoute()
const {data:inscriptions} = await $fetch(`/api/pay/${router.params.id}`)
const inscription=inscriptions;
const pdfSection = ref<HTMLElement | null>(null)
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
