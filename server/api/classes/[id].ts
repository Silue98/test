import { defineEventHandler } from 'h3';
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient(); // Initialisation du client Prisma

export default defineEventHandler(async (event) => {
  try {
    // Vérifier si l'ID est bien passé dans les paramètres
    const { id } = event.context.params || {}; 

    if (!id) {
      return {
        statusCode: 400,
        body: { message: "ID de l'utilisateur manquant" },
      };
    }

    const userId = parseInt(id); // Convertir l'ID de l'utilisateur en entier
    console.log(`Recherche de la classe pour l'utilisateur ID: ${userId}`);

    // Étape 1 : Trouver l'utilisateur et son ID de classe
    const utilisateurWithClasse = await prisma.classe.findUnique({
      where: { utilisateurId: userId }, // Utiliser 'id' comme clé primaire pour l'utilisateur
      select: { Id_classe: true }, // On ne récupère que l'ID de la classe
    });

    if (!utilisateurWithClasse || !utilisateurWithClasse.Id_classe) {
      return {
        statusCode: 404,
        body: { message: "Utilisateur ou classe non trouvée" },
      };
    }

    const classeId = utilisateurWithClasse.Id_classe;
    console.log(`Utilisateur trouvé. ID de la classe : ${classeId}`);

    // Étape 2 : Trouver les élèves associés à cette classe
    const eleves = await prisma.enfant.findMany({
      where: { Id_classe: classeId }, // Utilisation de la clé étrangère
      // include: { classe: true }, // Inclure les infos de la classe
    });
    console.log(`nombre user: ${eleves.length}`);


    // Si aucun élève n'est trouvé
    if (eleves.length === 0) {
      return {
        statusCode: 404,
        body: { message: "Aucun élève trouvé pour cette classe" },
      };
    }

    // Retourner les élèves trouvés avec un statut 200
    return {
      statusCode: 200,
      body: eleves,
    };
  } catch (error) {
    // Gestion des erreurs serveur
    console.error("Erreur serveur :", error);
    return {
      statusCode: 500,
      body: { message: "Erreur lors de la récupération des élèves" },
    };
  }
});
