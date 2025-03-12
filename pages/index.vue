<template>
  <div class="relative flex flex-col justify-center min-h-screen overflow-hidden">
    <div class="w-full p-6 m-auto bg-white border-t border-yellow-500 rounded shadow-lg shadow-purple-800/50 lg:max-w-md">
      <h1 class="text-3xl font-semibold text-center text-purple-700">
        <img src="/ED.png" alt="Logo">
      </h1>

      <form class="mt-6" @submit.prevent="handleLogin">
        <div>
          <label for="email" class="block text-sm text-gray-800">Email</label>
          <input v-model="email" type="email" id="email" name="email" autocomplete="email" required
            class="block w-full px-4 py-2 mt-2 text-purple-700 bg-white border rounded-md focus:border-purple-400 focus:ring-purple-300 focus:outline-none focus:ring focus:ring-opacity-40">
        </div>

        <div class="mt-4 relative">
          <label for="password" class="block text-sm text-gray-800">Password</label>
          <input :type="showPassword ? 'text' : 'password'" v-model="password" id="password" name="password" autocomplete="current-password" required
            class="block w-full px-4 py-2 mt-2 text-purple-700 bg-white border rounded-md focus:border-purple-400 focus:ring-purple-300 focus:outline-none focus:ring focus:ring-opacity-40">
          
          <button type="button" @click.prevent="togglePassword" class="absolute right-3 top-10 text-gray-500 hover:text-gray-700">
            <EyeIcon v-if="!showPassword" class="w-5 h-5"/>
            <EyeSlashIcon v-else class="w-5 h-5"/>
          </button>
        </div>

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
import { EyeIcon, EyeSlashIcon } from "@heroicons/vue/24/outline";
import { useUserStore } from "@/store/user";

const email = ref("");
const password = ref("");
const showPassword = ref(false);
const userStore = useUserStore();

const togglePassword = () => {
  showPassword.value = !showPassword.value;
};

const handleLogin = async () => {
  const credentials = {
    email: email.value,
    password: password.value,
  };

  try {
    await userStore.login(credentials);

    console.log("🔓 Token après connexion :", userStore.token);

    if (userStore.token) { 
      alert("Connexion réussie !");
      await navigateTo("/DashboardStatistique", { replace: true });
    } else {
      alert("Problème de connexion. Veuillez réessayer.");
    }
  } catch (error) {
    alert(error.message || "Erreur de connexion");
  }
};

definePageMeta({
  layout: 'connexion'
});
</script>
