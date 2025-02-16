<template>
  <div class="flex min-h-screen w-full bg-gray-50 dark:bg-slate-800 dark:text-slate-100">
    <!-- Sidebar -->
    <aside class="w-64 bg-gray-800 text-white h-screen p-4">
      <!-- ... contenu du sidebar ... -->
      <div class="mb-6">
        <NuxtLink to="/" class="text-2xl font-bold hover:text-gray-300">ECODIM</NuxtLink>
      </div>
      <nav class="space-y-2">
        <!-- Liens du sidebar -->
        <NuxtLink to="/Form1" class="block rounded-md px-3 py-2 text-sm font-medium text-gray-300 hover:bg-gray-700 hover:text-white">
          Engistrer
        </NuxtLink>
        <!-- Autres liens... -->
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
</script>
