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
    
        if (!response.ok) {
          throw new Error(`Échec de la requête - Code: ${response.status}`);
        }
    
        const data = await response.json();
    
        if (parseInt(data.status) === 200 && data.token) {
          this.user = data.user;
          this.token = data.token;
          this.userId = data.user.id;
    
          if (process.client) {
            localStorage.setItem('token', data.token);
            localStorage.setItem('user', JSON.stringify(data.user));
            localStorage.setItem('userId', data.user.id.toString());
          }
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
    
      if (process.client) {
        localStorage.removeItem('token');
        localStorage.removeItem('user');
        localStorage.removeItem('userId');
      }
    
      return navigateTo('/');
    },

    initialize() {
      if (process.client) {
        const token = localStorage.getItem('token');
        const user = localStorage.getItem('user');
        const userId = localStorage.getItem('userId');

        if (token && user && userId) {
          const tokenExpiration = this.isTokenExpired(token);
          if (tokenExpiration) {
            this.logout(); // Si le token est expiré, déconnecte l'utilisateur
          } else {
            this.token = token;
            this.user = JSON.parse(user);
            this.userId = parseInt(userId, 10);
          }
        }
      }
    },

    // Fonction pour vérifier si le token a expiré
    isTokenExpired(token: string): boolean {
      const decoded: any = this.decodeToken(token);
      const expirationTime = decoded.exp * 1000; // Convertir l'expiration de secondes à millisecondes
      const currentTime = Date.now();
      return currentTime > expirationTime;
    },

    // Fonction pour décoder un token sans le valider côté serveur (juste pour vérifier l'expiration)
    decodeToken(token: string): any {
      const base64Url = token.split('.')[1];
      const base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
      const jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
      }).join(''));

      return JSON.parse(jsonPayload);
    }
  },
});
