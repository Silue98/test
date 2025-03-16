<template>
    <div class="flex flex-col items-center justify-center min-h-screen">
      <div class="w-full max-w-md p-6 bg-white rounded shadow">
        <h2 class="text-2xl font-semibold text-center">Créer un compte</h2>
        <form @submit.prevent="register">
          <div class="mt-4">
            <label>Nom</label>
            <input v-model="name" type="text" class="border rounded w-full px-3 py-2" required>
          </div>
          <div class="mt-4">
            <label>Prenom</label>
            <input v-model="prenom" type="text" class="border rounded w-full px-3 py-2" required>
          </div>
          <div class="mt-4">
            <label>Email</label>
            <input v-model="email" type="email" class="border rounded w-full px-3 py-2" required>
          </div>
          <div class="mt-4">
            <label>Mot de passe</label>
            <input v-model="password" type="password" class="border rounded w-full px-3 py-2" required>
          </div>
          <div class="mt-4">
            <label>Confirmer le mot de passe</label>
            <input v-model="confirmPassword" type="password" class="border rounded w-full px-3 py-2" required>
          </div>
          <button type="submit" class="mt-4 w-full bg-yellow-500 text-white py-2 rounded">S'inscrire</button>
        </form>
        <p v-if="error" class="text-red-500 mt-2">{{ error }}</p>
        <p v-if="success" class="text-green-500 mt-2">Inscription réussie ! Redirection...</p>
        <p class="mt-4 text-center text-sm">
          Déjà un compte ? <NuxtLink to="/" class="text-yellow-500">Se connecter</NuxtLink>
        </p>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref } from "vue";
  
  const name = ref("");
  const email = ref("");
  const password = ref("");
  const prenom = ref("");
  const confirmPassword = ref("");
  const error = ref("");
  const success = ref(false);
  
  const register = async () => {
    error.value = "";
    success.value = false;
  
    if (password.value !== confirmPassword.value) {
      error.value = "Les mots de passe ne correspondent pas.";
      return;
    }
  
    try {
      const response = await fetch("/api/auth/register", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          name: name.value,
          email: email.value,
          password: password.value,
          prenom: prenom.value,
        }),
      });
  
      const data = await response.json();
      if (data.error) {
        error.value = data.error;
      } else {
        success.value = true;
        setTimeout(() => {
          window.location.href = "/"; // Redirection vers la page de connexion
        }, 2000);
      }
    } catch (err) {
      error.value = "Erreur lors de l'inscription.";
    }
  };
  definePageMeta({
    layout: 'connexion',

  });
  
  </script>
  