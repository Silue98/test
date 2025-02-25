<template>
  <div class="relative flex flex-col justify-center min-h-screen overflow-hidden">
    <div class="w-full p-6 m-auto bg-white border-t border-yellow-500 rounded shadow-lg shadow-purple-800/50 lg:max-w-md">
      <h1 class="text-3xl font-semibold text-center text-purple-700">
        <img src="/ED.png" alt="Logo">
      </h1>

      <form class="mt-6" @submit.prevent="login">
        <div>
          <label for="email" class="block text-sm text-gray-800">Email</label>
          <input v-model="email" type="email"
            class="block w-full px-4 py-2 mt-2 text-purple-700 bg-white border rounded-md focus:border-purple-400 focus:ring-purple-300 focus:outline-none focus:ring focus:ring-opacity-40">
        </div>

        <div class="mt-4 relative">
          <label for="password" class="block text-sm text-gray-800">Password</label>
          <input :type="showPassword ? 'text' : 'password'"
            v-model="password"
            class="block w-full px-4 py-2 mt-2 text-purple-700 bg-white border rounded-md focus:border-purple-400 focus:ring-purple-300 focus:outline-none focus:ring focus:ring-opacity-40">
          
          <!-- Icône pour afficher/masquer le mot de pass -->
          <button type="button" @click="togglePassword" class="absolute right-3 top-10 text-gray-500 hover:text-gray-700">
            <EyeIcon v-if="!showPassword" class="w-5 h-5"/>
            <EyeSlashIcon v-else class="w-5 h-5"/>
          </button>
          
        </div>

        <a href="#" class="text-xs text-gray-600 hover:underline">Forget Password?</a>

        <div class="mt-6">
          <button type="submit"
            class="w-full px-4 py-2 tracking-wide text-white transition-colors duration-200 transform bg-yellow-400 rounded-md hover:bg-yellow-300 focus:outline-none focus:bg-purple-600">
            Login
          </button>
        </div>
      </form>

      <p class="mt-8 text-xs font-light text-center text-gray-700">
        Don't have an account?
        <NuxtLink to="/register" class="font-medium text-yellow-500 hover:underline">Sign up</NuxtLink>
      </p>
    </div>
  </div>
</template>

<script setup>
import { ref } from "vue";
import { useRouter } from "vue-router";
import { EyeIcon, EyeSlashIcon } from "@heroicons/vue/24/outline"; // Import des icônes

const email = ref("");
const password = ref("");
const showPassword = ref(false);
const router = useRouter();

// Fonction pour afficher/masquer le mot de passe
const togglePassword = () => {
  showPassword.value = !showPassword.value;
};

// Fonction de connexion
const login = async () => {
  try {
    const response = await fetch("/api/auth/login", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ email: email.value, password: password.value }),
    });

    const data = await response.json();

    if (data.token) {
      localStorage.setItem("token", data.token);
      alert("Connexion réussie !");
      router.push("/DashboardStatistique");
    } else {
      alert(data.error);
    }
  } catch (error) {
    console.error("Erreur de connexion :", error);
  }
};

// Appliquer le layout spécifique
definePageMeta({
  layout: 'connexion'
});
</script>
