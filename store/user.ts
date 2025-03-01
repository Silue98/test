import { defineStore } from 'pinia';

// Définition de l'interface LoginCredentials
interface LoginCredentials {
  email: string;
  password: string;
}

export const useUserStore = defineStore('user', {
  state: () => ({
    user: null, // Stocke les infos utilisateur
    token: null as string | null, // JWT token après connexion
    userId: null as number | null, // ID de l'utilisateur
  }),

  actions: {
    async login(credentials: LoginCredentials) {
      try {
        const response = await fetch('/api/auth/login', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(credentials),
        });

        if (!response.ok) {
          throw new Error('Échec de la requête');
        }

        const data = await response.json();

        if (data.status="200") {

          this.user = data.user;
          console.log("Réponse API :", this.user);

          this.token = data.token;
          this.userId = data.user.id;
          console.log("Connexion réussie :", this.user);
        } else {
          throw new Error(data.message || "Échec de connexion");
        }
      } catch (error: any) {
        console.error("Erreur lors de la connexion :", error.message);
        throw error;
      }
    },

    logout() {
      this.user = null;
      this.token = null;
      this.userId = null;
      console.log("Déconnexion réussie !");
    }
  }
});
