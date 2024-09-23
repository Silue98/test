<template>
  <div class="flex justify-center m">
    <div class="flex justify-center mt-5 text-2xl font-serif text-yellow-500 shadow-lg w-96">
    Info: {{ inscription.nomenfant }} {{ inscription.prenomenfant }}
  </div>
  </div>
  
  <section>
<section class="flex justify-center items-center  mt-6">
  <div ref="pdfSection">
    <div class="ml-4 w-full  mt-6 " >
      <p class="flex justify-center text-center text-sm border-solid border-2 border-black h-10">FICHE &nbsp;DE &nbsp; PAIEMENT</p>
      <p class="border-solid text-sm ">BENEFICICAIRE</p>
      <div class="flex space-x-16">
        <div>
          <P class="text-sm">Nom: {{ inscription.nomenfant }}</P>
      <p class="text-sm">Prénoms: {{ inscription.prenomenfant }}</p>
      <p class="text-sm">Classe :</p>
      <p class="text-sm">Année Scomaire:</p></div>
        <div>
          <p class="text-sm">CMA DOKUI 1</p>
          <p class="text-sm"><img class="w-16 flex mt-2" src="/ED.png" alt=""></p>
        </div>
      </div>
      
      <div>
        
      </div>
      <table class="table-fixed mt-5">
  <thead>
    <tr>
      <th class="w-1/4 px-4 py-2 text-sm font-serif">Quantité</th>
      <th class="w-1/2 px-4 py-2 text-sm font-serif">Description</th>
      
      <th class="w-1/4 px-4 py-2 text-sm font-serif">Montant</th>
    </tr>
  </thead>
  <tbody v-for="paie in paiement" :key="paie.Id_Payement" >
    
    <tr v-if="paie.Id_Incription==inscription.Id_Incription">
      <td  class="border px-4 py-2 text-sm font-serif">{{ paie.Id_Payement }}</td>
      <td class="border px-4 py-2 text-sm font-serif">{{ paie.moyenpayement }}</td>
      <td class="border px-4 py-2 text-sm font-serif">{{ paie.montant }}</td>
    </tr>
    
  </tbody>
  
</table>
<table class="table-fixed mt-5">
  <thead>
    <tr>
      <!-- <th class="w-1/4 px-4 py-2 text-sm font-serif">1</th>
      <th class="w-1/2 px-4 py-2 text-sm font-serif">2</th>
      
      <th class="w-1/4 px-4 py-2 text-sm font-serif">3</th> -->
    </tr>
  </thead>
  <tbody  >
    
    <tr class="">
     
      <td class="border w-24  flex  px-4 py-2 text-sm font-serif">Total :</td>
      <td class="border  px-4 py-2 text-sm font-serif"></td>
    </tr>
    
  </tbody>
</table>
&nbsp;&nbsp;
<div class="flex space-x-10 top-5">
  <p class="flex h-28 w-40 justify-center text-center text-sm border-solid border-2 border-black h-10">SIGNATURE &nbsp; ENFANT</p>
  <p class="flex h-28 w-44  justify-center  text-center text-sm border-solid border-2 border-black h-10"> SIGANTURE &nbsp; RESPONSABLE</p>
</div>
    </div>
   
  </div> 
</section>
<div class="flex justify-center items-center top-32">
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
const {data:paiements} = await $fetch("/api/payement")
const paiement=paiements;
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
