import { useUserStore } from "~/store/user";

export default defineNuxtRouteMiddleware((to, from) => {
  const userStore = useUserStore();

  if (process.client) {
    userStore.initialize();
  }

  console.log("🔐 Middleware exécuté, token :", userStore.token);

  // 🔽 Exclure la page /register
  if (to.path === "/" || to.path === "/register") {
    return;
  }

  if (!userStore.token) {
    console.warn("⚠️ Accès refusé : utilisateur non authentifié");
    
    // ✅ Utilisation de replace pour empêcher le retour en arrière
    return navigateTo("/", { replace: true });
  }
});
