import { defineStore } from 'pinia';

// Définition de l'interface User
interface User {
  id: number;
  name: string;
  email: string;
  role: string; // Rôle de l'utilisateur
}

// Définition de l'interface LoginCredentials
interface LoginCredentials {
  email: string;
  password: string;
}

export const useUserStore = defineStore('user', {
  state: () => ({
    user: null as User | null, // Stocke les infos de l'utilisateur connecté
    token: null as string | null, // JWT token après connexion
    userId: null as number | null, // ID de l'utilisateur
    classeId: null as number | null, // ID de la classe associée au user
    eleves: [] as any[], // Liste des élèves de la classe
  }),

  getters: {
    isAuthenticated: (state) => !!state.token, // Vérifie si un token existe
    getUserRole: (state) => state.user?.role, // Récupère le rôle de l'utilisateur
  },

  actions: {
    async login(credentials: LoginCredentials) {
      try {
        const response = await fetch('/api/auth/login', { // Ajout d'un slash au début de l'URL
          method: 'POST',
          body: JSON.stringify(credentials),
          headers: { 'Content-Type': 'application/json' },
        });

        if (!response.ok) {
          throw new Error('Échec de la requête');
        }

        const data = await response.json();
        console.log("Réponse API :", data);

        if (data.success) {
          this.user = data.user as User; // Associe les données utilisateur
          this.token = data.token;
          this.userId = data.user.id;  // Stocke l'ID de l'utilisateur dans le store
          console.log("Connexion réussie, userId :", this.userId); // Log pour débogage
        } else {
          throw new Error(data.message || "Échec de connexion");
        }
      } catch (error) {
        console.error("Erreur lors de la connexion :", error);
      }
    },

    async fetchClasseEtEleves() {
      if (!this.user) {
        console.error("Aucun utilisateur connecté");
        return;
      }

      try {
        // 1️⃣ Récupérer l'ID de la classe en fonction de l'ID du professeur
        const classeResponse = await fetch(`/api/classe/${this.user.id}`);
        if (!classeResponse.ok) {
          throw new Error('Échec de la récupération de la classe');
        }
        const classeData = await classeResponse.json();
        this.classeId = classeData.classeId;

        // 2️⃣ Récupérer la liste des élèves de la classe
        const elevesResponse = await fetch(`/api/eleves/${this.classeId}`);
        if (!elevesResponse.ok) {
          throw new Error('Échec de la récupération des élèves');
        }
        const elevesData = await elevesResponse.json();
        this.eleves = elevesData;
      } catch (error) {
        console.error("Erreur lors de la récupération des élèves :", error);
        throw error;
      }
    },
  },
});