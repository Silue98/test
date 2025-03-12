import { defineStore } from 'pinia';

interface User {
  id: number;
  email: string;
  name: string;
}

interface LoginCredentials {
  email: string;
  password: string;
}

export const useUserStore = defineStore('user', {
  state: () => ({
    user: null as User | null,
    token: null as string | null,
    userId: null as number | null,
  }),

  actions: {
    async login(credentials: LoginCredentials) {
      try {
        const response = await fetch('/api/auth/login', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(credentials),
        });
    
        console.log("📡 Réponse brute de l'API :", response);
    
        if (!response.ok) {
          throw new Error(`Échec de la requête - Code: ${response.status}`);
        }
    
        const data = await response.json();
        console.log("📡 Données reçues de l'API :", data);
    
        // ✅ Correction : conversion en nombre
        if (parseInt(data.status) === 200 && data.token) {
          this.user = data.user;
          this.token = data.token;
          this.userId = data.user.id;
    
          if (process.client) {
            localStorage.setItem('token', data.token);
            localStorage.setItem('user', JSON.stringify(data.user));
            localStorage.setItem('userId', data.user.id.toString());
          }
    
          console.log("✅ Connexion réussie :", this.user);
        } else {
          throw new Error(data.message || "Échec de connexion");
        }
      } catch (error: any) {
        console.error("❌ Erreur lors de la connexion :", error.message);
        throw error;
      }
    
    
        
    },

    logout() {
      this.user = null;
      this.token = null;
      this.userId = null;

      // Supprimer les données du localStorage (côté client uniquement)
      if (process.client) {
        localStorage.removeItem('token');
        localStorage.removeItem('user');
        localStorage.removeItem('userId');
      }
      window.location.href = "/"; // Redirige vers la page de connexion et recharge la page


      console.log("🚪 Déconnexion réussie !");
    },

    initialize() {
      if (process.client) {
        const token = localStorage.getItem('token');
        const user = localStorage.getItem('user');
        const userId = localStorage.getItem('userId');

        if (token && user && userId) {
          this.token = token;
          this.user = JSON.parse(user);
          this.userId = parseInt(userId, 10);
        }

        console.log("🔄 Initialisation du store, token récupéré :", this.token);
      }
    },
  },
});
