<template>
  <div class="flex min-h-screen w-full bg-orange-50 text-gray-900">
    <!-- Bouton de menu pour les petits écrans -->
    <button
      @click="toggleSidebar"
      class="fixed top-4 left-4 z-50 p-2 bg-orange-500 text-white rounded-lg shadow-md sm:hidden"
    >
      <svg
        xmlns="http://www.w3.org/2000/svg"
        class="h-6 w-6"
        fill="none"
        viewBox="0 0 24 24"
        stroke="currentColor"
      >
        <path
          stroke-linecap="round"
          stroke-linejoin="round"
          stroke-width="2"
          d="M4 6h16M4 12h16M4 18h16"
        />
      </svg>
    </button>

    <!-- Barre latérale -->
    <aside
      v-show="isSidebarOpen || !isMobile"
      class="fixed inset-y-0 left-0 w-64 bg-white text-gray-800 shadow-lg border-r border-orange-300 transform transition-transform duration-300 ease-in-out sm:translate-x-0"
      :class="{ '-translate-x-full': !isSidebarOpen && isMobile }"
    >
      <!-- Logo -->
      <div class="mb-8 text-center py-6 bg-orange-500 text-white rounded-b-lg shadow-md">
        <NuxtLink to="/DashboardStatistique" class="text-3xl font-extrabold tracking-wide hover:text-orange-200 transition duration-300">
          ECODIM
        </NuxtLink>
      </div>

      <!-- Navigation -->
      <nav class="space-y-4 px-4">
        <NuxtLink
          to="/DashboardStatistique" 
          class="flex items-center space-x-3 rounded-lg px-5 py-3 text-lg font-medium transition duration-300 bg-orange-100 hover:bg-orange-300 hover:text-white">
          <span>🏠</span>
          <span>Tableau de Bord</span>
        </NuxtLink>

        <NuxtLink 
          to="/ListInscrit" 
          class="flex items-center space-x-3 rounded-lg px-5 py-3 text-lg font-medium transition duration-300 bg-orange-100 hover:bg-orange-300 hover:text-white">
          <span>📝</span>
          <span>Liste</span>
        </NuxtLink>

        <NuxtLink 
          to="/formulaire" 
          class="flex items-center space-x-3 rounded-lg px-5 py-3 text-lg font-medium transition duration-300 bg-orange-100 hover:bg-orange-300 hover:text-white">
          <span>📄</span>
          <span>Formulaire</span>
        </NuxtLink>

        <NuxtLink 
          to="/users" 
          class="flex items-center space-x-3 rounded-lg px-5 py-3 text-lg font-medium transition duration-300 bg-orange-100 hover:bg-orange-300 hover:text-white">
          <span>👥</span>
          <span>Utilisateurs</span>
        </NuxtLink>

        <NuxtLink 
          to="/settings" 
          class="flex items-center space-x-3 rounded-lg px-5 py-3 text-lg font-medium transition duration-300 bg-orange-100 hover:bg-orange-300 hover:text-white">
          <span>⚙️</span>
          <span>Paramètres</span>
        </NuxtLink>

        <NuxtLink 
          to="/reports" 
          class="flex items-center space-x-3 rounded-lg px-5 py-3 text-lg font-medium transition duration-300 bg-orange-100 hover:bg-orange-300 hover:text-white">
          <span>📊</span>
          <span>Rapports</span>
        </NuxtLink>

        <NuxtLink 
          to="/messages" 
          class="flex items-center space-x-3 rounded-lg px-5 py-3 text-lg font-medium transition duration-300 bg-orange-100 hover:bg-orange-300 hover:text-white">
          <span>💬</span>
          <span>Père</span>
        </NuxtLink>

        <NuxtLink 
          to="/notifications" 
          class="flex items-center space-x-3 rounded-lg px-5 py-3 text-lg font-medium transition duration-300 bg-orange-100 hover:bg-orange-300 hover:text-white">
          <span>🔔</span>
          <span>Mère</span>
        </NuxtLink>

        <NuxtLink 
          to="/"
          @click.prevent="logout"  
          class="flex items-center space-x-3 rounded-lg px-5 py-3 text-lg font-medium transition duration-300 bg-red-500 text-white hover:bg-red-400">
          <span>🚪</span>
          <span>Déconnexion</span>
        </NuxtLink>
      </nav>
    </aside>

    <!-- Contenu principal -->
    <div class="flex-1 ml-0 sm:ml-64">
      <!-- Toolbar fixe -->
      <div class="fixed top-0 left-0 sm:left-64 right-0 bg-white shadow-md z-10">
        <Toolbar />
      </div>

      <!-- Contenu défilable -->
      <main class="mt-16 p-6 overflow-y-auto">
        <slot />
      </main>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue';
import { useRouter } from 'vue-router';
import { useUserStore } from '~/store/user';

const router = useRouter();
const userStore = useUserStore(); // Initialisation du store
const isSidebarOpen = ref(false);
const isMobile = ref(false);

// Fonction pour basculer la barre latérale
function toggleSidebar() {
  isSidebarOpen.value = !isSidebarOpen.value;
}

// Fonction pour détecter la taille de l'écran
function checkScreenSize() {
  isMobile.value = window.innerWidth < 640; // 640px est le breakpoint `sm` de Tailwind
}

// Détecter la taille de l'écran au montage et lors du redimensionnement
onMounted(() => {
  checkScreenSize();
  window.addEventListener('resize', checkScreenSize);
});

// Nettoyer l'écouteur d'événement
onUnmounted(() => {
  window.removeEventListener('resize', checkScreenSize);
});

// Fonction de déconnexion avec empêchement du retour arrière
function logout() {
  userStore.logout(); // Supprimer les données utilisateur et le token
  
  // Empêcher l'utilisateur de revenir en arrière après la déconnexion
  window.history.pushState(null, "", "/");

  // Redirection propre
  window.location.replace("/");
}
</script>
