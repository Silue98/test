import { useUserStore } from "~/store/user";

export default defineNuxtRouteMiddleware((to, from) => {
  const userStore = useUserStore();

  // Initialiser le store côté client
  if (process.client) {
    userStore.initialize();
  }

  console.log("🔐 Middleware exécuté, token :", userStore.token);

  // Exclure la page de connexion du middleware
  if (to.path === "/") {
    return;
  }

  // Rediriger si l'utilisateur n'est pas connecté
  if (!userStore.token) {
    console.warn("⚠️ Accès refusé : utilisateur non authentifié");
    return navigateTo("/");
  }
});