<template>
  <nav class="bg-white border-gray-200 dark:bg-yellow-500">
    <div class="mx-auto max-w-7xl px-2 sm:px-6 lg:px-8">
      <div class="relative flex h-16 items-center justify-between">
        <!-- Bouton menu mobile -->
        <div class="absolute inset-y-0 left-0 flex items-center sm:hidden">
          <button
            type="button"
            class="relative inline-flex items-center justify-center rounded-md p-2 text-gray-400 hover:bg-gray-700 hover:text-white focus:ring-2 focus:ring-white focus:outline-none focus:ring-inset"
            aria-controls="mobile-menu"
            aria-expanded="false"
            @click="toggleMobileMenu"
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

        <!-- Barre de recherche -->
        <div class="flex items-center justify-center w-full sm:w-auto ml-12 sm:ml-0">
          <input
            type="text"
            v-model="searchQuery"
            placeholder="Rechercher..."
            class="w-full sm:w-64 px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500 transition duration-300"
            @input="handleSearch"
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
              <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-gray-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 14c4.418 0 8-2.686 8-6s-3.582-6-8-6-8 2.686-8 6 3.582 6 8 6zM4 20c0-4.418 3.582-8 8-8s8 3.582 8 8H4z" />
              </svg>
              <h1 class="font-bold text-black">{{ userStore.user?.name }}</h1>
            </NuxtLink>
          </div>
        </div>
      </div>
    </div>

    <!-- Menu mobile (affiché sur petits écrans) -->
    <div v-if="isMobileMenuOpen" class="sm:hidden" id="mobile-menu">
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
import { ref, computed } from "vue";
import { useRoute } from "vue-router";

export default {
  setup() {
    const userStore = useUserStore();
    const searchQuery = ref("");
    const route = useRoute();
    const isMobileMenuOpen = ref(false);

    // Détecter la page actuelle
    const currentPage = computed(() => {
      return route.path; // Retourne le chemin de la route actuelle
    });

    // Gérer la recherche en fonction de la page
    const handleSearch = () => {
      const query = searchQuery.value.trim();

      if (query) {
        // Logique de recherche en fonction de la page
        switch (currentPage.value) {
          case "/DashboardStatistique": // Dashboard
            console.log("Recherche sur le dashboard :", query);
            // Ajoutez ici la logique pour filtrer les données du dashboard
            break;
          case "/List": // Enfants enregistrés
            console.log("Recherche sur la liste des enfants enregistrés :", query);
            // Ajoutez ici la logique pour filtrer la liste des enfants enregistrés
            break;
          case "/ListInscrit": // Enfants inscrits
            console.log("Recherche sur la liste des enfants inscrits :", query);
            // Ajoutez ici la logique pour filtrer la liste des enfants inscrits
            break;
          case "/ListInscritPaiement": // Paiements
            console.log("Recherche sur la liste des paiements :", query);
            // Ajoutez ici la logique pour filtrer la liste des paiements
            break;
          default:
            console.log("Page non gérée :", currentPage.value);
        }
      } else {
        // Si la recherche est vide, réinitialiser les résultats
        console.log("Réinitialisation de la recherche");
        // Ajoutez ici la logique pour réinitialiser les résultats
      }
    };

    // Basculer le menu mobile
    const toggleMobileMenu = () => {
      isMobileMenuOpen.value = !isMobileMenuOpen.value;
    };

    return {
      userStore,
      searchQuery,
      handleSearch,
      isMobileMenuOpen,
      toggleMobileMenu,
    };
  },
};
</script>