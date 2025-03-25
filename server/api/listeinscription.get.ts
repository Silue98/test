import { PrismaClient } from '@prisma/client';

export default defineEventHandler(async (event) => {
  const prisma = new PrismaClient();

  // Récupérer toutes les inscriptions avec leurs classes associées
  const inscriptions = await prisma.incription.findMany({
    include: {
      classe: true, // Inclure les informations de la classe associée
    },
  });

  // Retourner les données
  return { data: inscriptions };
});
