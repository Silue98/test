import { PrismaClient } from "@prisma/client";

export default defineEventHandler(async (event) => {
  const prisma = new PrismaClient();

  try {
    // Vérifier si event.context.params est défini et contient un id
    if (!event.context.params?.id) {
      return { error: "L'identifiant de l'enfant est requis." };
    }

    const id = parseInt(event.context.params.id, 10); // Convertir en nombre

    if (isNaN(id)) {
      return { error: "L'identifiant fourni n'est pas valide." };
    }

    const enfant = await prisma.enfant.findUnique({
      where: {
        Id_Enfant: id,
      },
    });

    if (!enfant) {
      return { error: "Aucun enfant trouvé avec cet identifiant." };
    }

    return { data: enfant };
  } catch (error) {
    console.error("Erreur lors de la récupération de l'enfant :", error);
    return { error: "Une erreur est survenue lors de la récupération des données." };
  } finally {
    await prisma.$disconnect(); // Fermer la connexion Prisma proprement
  }
});
