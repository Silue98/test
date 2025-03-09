import { PrismaClient } from "@prisma/client";

export default defineEventHandler(async (event) => {
  // Lire les données du corps de la requête
  const {
    nomenfant,
    prenomenfant,
    genre,
    habitationenfant,
    lieuhabitation,
    numerotelephone,
    emailenfant,
    datenaissance,
    lieunaissanceenfant,
    club,
    dateentreed,
    orphelinpas,
    pere_mere,
    // Id_Mere,
    // Id_Pere,
    // Id_classe,
  } = await readBody(event);

  // Initialiser Prisma Client
  const prisma = new PrismaClient();

  try {
    // Valider que Id_Mere est fourni (si obligatoire)
    
    // Créer un nouvel enfant dans la base de données
    const nouvelEnfant = await prisma.enfant.create({
      data: {
        nomenfant,
        prenomenfant,
        genre,
        habitationenfant,
        lieuhabitation,
        numerotelephone,
        emailenfant,
        datenaissance,
        lieunaissanceenfant,
        club,
        dateentreed,
        orphelinpas,
        pere_mere,
        Id_Mere:1, // Valeur par défaut si Id_Mere est null ou undefined
        Id_Pere:1, // Valeur par défaut si Id_Pere est null ou undefined
        Id_classe:0,
      },
    });

    // Retourner la réponse avec le nouvel enfant créé
    return {
      data: nouvelEnfant,
      status: 201, // 201 Created
      message: "Enfant créé avec succès",
    };
  } catch (error) {
    console.error("Erreur lors de la création de l'enfant :", error);
    throw createError({
      statusCode: 500,
      statusMessage: "Erreur interne du serveur lors de la création de l'enfant",
    });
  } finally {
    // Fermer la connexion Prisma
    await prisma.$disconnect();
  }
});