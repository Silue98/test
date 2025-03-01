<template>
  <nav class="bg-white border-gray-200 dark:bg-yellow-500">
    <div class="mx-auto max-w-7xl px-2 sm:px-6 lg:px-8">
      <div class="relative flex h-16 items-center justify-between">
        <!-- Bouton menu mobile -->
        <div class="absolute inset-y-0 left-0 flex items-center sm:hidden">
          <button
            type="button"
            class="relative inline-flex items-center justify-center rounded-md p-2 text-gray-400 hover:bg-gray-700 hover:text-white focus:ring-2 focus:ring-white focus:outline-hidden focus:ring-inset"
            aria-controls="mobile-menu"
            aria-expanded="false"
          >
            <span class="absolute -inset-0.5"></span>
            <span class="sr-only">Ouvrir le menu</span>
            <svg class="block h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
              <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
            </svg>
            <svg class="hidden h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
              <path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" />
            </svg>
          </button>
        </div>

        <!-- Logo ECODIM (au centre de la toolbar) -->
        
        <!-- Barre de recherche -->
        <div class="flex items-center justify-center w-full sm:w-auto">
          <input
            type="text"
            placeholder="Rechercher..."
            class="w-full sm:w-64 px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500 transition duration-300"
          />
        </div>

        <!-- Menu de navigation sur écran large -->
        <div class="hidden sm:ml-6 sm:block">
          <div class="flex space-x-4">
           
            <NuxtLink to="/table" class="rounded-md px-3 py-2 text-sm font-medium text-gray-300 hover:bg-gray-700 hover:text-white transition duration-300">
              Enregistrer
            </NuxtLink>
            <NuxtLink to="/List" class="rounded-md px-3 py-2 text-sm font-medium text-gray-300 hover:bg-gray-700 hover:text-white transition duration-300">
              Enfants enregistrés
            </NuxtLink>
            <NuxtLink to="/ListInscrit" class="rounded-md px-3 py-2 text-sm font-medium text-gray-300 hover:bg-gray-700 hover:text-white transition duration-300">
              Enfants inscrits
            </NuxtLink>
            <NuxtLink to="/ListInscritPaiement" class="rounded-md px-3 py-2 text-sm font-medium text-gray-300 hover:bg-gray-700 hover:text-white transition duration-300 flex items-center space-x-2">
  <!-- Icône de profil humain (tête de l'homme) -->
  <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-gray-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 14c4.418 0 8-2.686 8-6s-3.582-6-8-6-8 2.686-8 6 3.582 6 8 6zM4 20c0-4.418 3.582-8 8-8s8 3.582 8 8H4z" />
  </svg>
  <!-- Texte en noir et gras -->
  <h1 class="font-bold text-black">{{ userStore.user?.name }}</h1>
</NuxtLink>





          </div>
        </div>
      </div>
    </div>

    <!-- Menu mobile (affiché sur petits écrans) -->
    <div class="sm:hidden" id="mobile-menu">
      <div class="space-y-1 px-2 pt-2 pb-3">
        <NuxtLink to="/" class="block rounded-md bg-gray-900 px-3 py-2 text-base font-medium text-white" aria-current="page">
          Dashboard
        </NuxtLink>
        <NuxtLink to="/Form1" class="block rounded-md px-3 py-2 text-base font-medium text-gray-300 hover:bg-gray-700 hover:text-white">
          Enregistrer
        </NuxtLink>
        <NuxtLink to="/List" class="block rounded-md px-3 py-2 text-base font-medium text-gray-300 hover:bg-gray-700 hover:text-white">
          Enfants enregistrés
        </NuxtLink>
        <NuxtLink to="/ListInscrit" class="block rounded-md px-3 py-2 text-base font-medium text-gray-300 hover:bg-gray-700 hover:text-white">
          Enfants inscrits
        </NuxtLink>
        <NuxtLink to="/ListInscritPaiement" class="block rounded-md px-3 py-2 text-base font-medium text-gray-300 hover:bg-gray-700 hover:text-white">
          Paiements
        </NuxtLink>
      </div>
    </div>
  </nav>
</template>
<script>
  import { useUserStore } from "../store/user";
  
  export default {
    setup() {
      const userStore = useUserStore(); // Correction : appel de la fonction
  
      
  
      return { userStore };
    },
  };
  </script>