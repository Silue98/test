<template>
  <div class="flex min-h-screen w-full bg-orange-50 text-gray-900">
    <!-- Sidebar -->
    <aside class="w-64 bg-white text-gray-800 shadow-lg border-r border-orange-300">
      <!-- Logo -->
      <div class="mb-8 text-center py-6 bg-orange-500 text-white rounded-b-lg shadow-md">
        <NuxtLink to="/" class="text-3xl font-extrabold tracking-wide hover:text-orange-200 transition duration-300">
          ECODIM
        </NuxtLink>
      </div>

      <!-- Navigation -->
      <nav class="space-y-4 px-4">
        <NuxtLink 
          to="/dashboard" 
          class="flex items-center space-x-3 rounded-lg px-5 py-3 text-lg font-medium transition duration-300 bg-orange-100 hover:bg-orange-300 hover:text-white">
          <span>🏠</span>
          <span>Tableau de Bord</span>
        </NuxtLink>

        <NuxtLink 
          to="/Form1" 
          class="flex items-center space-x-3 rounded-lg px-5 py-3 text-lg font-medium transition duration-300 bg-orange-100 hover:bg-orange-300 hover:text-white">
          <span>📝</span>
          <span>Enregistrer</span>
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
          <span>Messages</span>
        </NuxtLink>

        <NuxtLink 
          to="/notifications" 
          class="flex items-center space-x-3 rounded-lg px-5 py-3 text-lg font-medium transition duration-300 bg-orange-100 hover:bg-orange-300 hover:text-white">
          <span>🔔</span>
          <span>Notifications</span>
        </NuxtLink>

        <NuxtLink 
  to="/logout" 
  @click.prevent="logout"  
  class="flex items-center space-x-3 rounded-lg px-5 py-3 text-lg font-medium transition duration-300 bg-red-500 text-white hover:bg-red-400">
  <span>🚪</span>
  <span>Déconnexion</span>
</NuxtLink>
      </nav>
    </aside>

    <!-- Zone de contenu principal -->
    <div class="flex-1 flex flex-col">
      <!-- Toolbar -->
      <Toolbar />

      <!-- Contenu de la page injecté ici -->
      <main class="p-6">
        <slot />
      </main>
    </div>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router';  // Importation du hook de navigation

// Créez un objet router pour la navigation
const router = useRouter();

// Fonction de déconnexion
function logout() {
  // Effacer les informations de session ou de token
  localStorage.removeItem('userToken');  // Si vous utilisez localStorage pour stocker le token
  sessionStorage.removeItem('userToken');  // Si vous utilisez sessionStorage

  // Rediriger vers la page d'accueil (login)
  router.push('/');  // Redirection vers la page de login (index)
}
</script>
