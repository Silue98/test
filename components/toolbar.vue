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

        <!-- Logo et liens de navigation -->
        <div class="flex flex-1 items-center justify-center sm:items-stretch sm:justify-start">
          <div class="flex shrink-0 items-center">
            <img class="h-8 w-auto rounded-md bg-white" src="/ED.png" alt="Votre société" />
          </div>
          <div class="hidden sm:ml-6 sm:block">
            <div class="flex space-x-4">
              <NuxtLink to="/" class="rounded-md px-3 py-2 text-sm font-medium text-white" aria-current="page">
                ECODIM
              </NuxtLink>
              <NuxtLink to="/Form1" class="rounded-md px-3 py-2 text-sm font-medium text-gray-300 hover:text-white">
                Engistrer
              </NuxtLink>
              <NuxtLink to="/List" class="rounded-md px-3 py-2 text-sm font-medium text-gray-300 hover:text-white">
                Enfants enregistrés
              </NuxtLink>
              <NuxtLink to="/ListInscrit" class="rounded-md px-3 py-2 text-sm font-medium text-gray-300 hover:text-white">
                Enfants inscrits
              </NuxtLink>
              <NuxtLink to="/ListInscritPaiement" class="rounded-md px-3 py-2 text-sm font-medium text-gray-300 hover:text-white">
                Payements
              </NuxtLink>
            </div>
          </div>
        </div>

        <!-- Boutons à droite (notifications et profil) -->
        <div class="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0">
          <button
            type="button"
            class="relative rounded-full bg-gray-800 p-1 text-gray-400 hover:text-white focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800 focus:outline-hidden"
          >
            <span class="absolute -inset-1.5"></span>
            <span class="sr-only">Voir les notifications</span>
            <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
              <path stroke-linecap="round" stroke-linejoin="round" d="M14.857 17.082a23.848 23.848 0 0 0 5.454-1.31A8.967 8.967 0 0 1 18 9.75V9A6 6 0 0 0 6 9v.75a8.967 8.967 0 0 1-2.312 6.022c1.733.64 3.56 1.085 5.455 1.31m5.714 0a24.255 24.255 0 0 1-5.714 0m5.714 0a3 3 0 1 1-5.714 0" />
            </svg>
          </button>

          <div class="relative ml-3">
            <div>
              <button
                type="button"
                class="relative flex rounded-full bg-gray-800 text-sm focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800 focus:outline-hidden"
                id="user-menu-button"
                aria-expanded="false"
                aria-haspopup="true"
              >
                <span class="absolute -inset-1.5"></span>
                <span class="sr-only">Ouvrir le menu utilisateur</span>
                <img
                  class="w-10 h-10 rounded-full"
                  src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                  alt=""
                />
              </button>
            </div>
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
          Engistrer
        </NuxtLink>
        <NuxtLink to="/List" class="block rounded-md px-3 py-2 text-base font-medium text-gray-300 hover:bg-gray-700 hover:text-white">
          Enfants enregistrés
        </NuxtLink>
        <NuxtLink to="/ListInscrit" class="block rounded-md px-3 py-2 text-base font-medium text-gray-300 hover:bg-gray-700 hover:text-white">
          Enfants inscrits
        </NuxtLink>
        <NuxtLink to="/ListInscritPaiement" class="block rounded-md px-3 py-2 text-base font-medium text-gray-300 hover:bg-gray-700 hover:text-white">
          Payements
        </NuxtLink>
      </div>
    </div>
  </nav>
</template>

<script setup>
</script>
