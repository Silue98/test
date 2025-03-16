import { PrismaClient } from "@prisma/client";
import bcrypt from "bcrypt";

const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
  const method = event.node.req.method;
  const id = event.context.params?.id; // Récupérer l'ID de l'utilisateur

  if (!id) {
    throw createError({ statusCode: 400, statusMessage: "ID utilisateur requis." });
  }

  if (method === "PUT") {
    // ✅ METTRE À JOUR L'UTILISATEUR
    const body = await readBody(event);
    const { name, email, password, prenom } = body;

    // Vérifier si l'utilisateur existe
    const existingUser = await prisma.utilisateur.findUnique({ where: { id: Number(id) } });

    if (!existingUser) {
      throw createError({ statusCode: 404, statusMessage: "Utilisateur non trouvé." });
    }

    // Vérifier si l'email est déjà utilisé par un autre utilisateur
    if (email && email !== existingUser.email) {
      const emailExists = await prisma.utilisateur.findUnique({ where: { email } });

      if (emailExists) {
        throw createError({ statusCode: 400, statusMessage: "Cet email est déjà utilisé par un autre utilisateur." });
      }
    }

    // Mise à jour des données
    let updatedData: any = { name, email, prenom };
    if (password) {
      updatedData.password = await bcrypt.hash(password, 10);
    }

    const updatedUser = await prisma.utilisateur.update({
      where: { id: Number(id) },
      data: updatedData,
    });

    return { message: "Utilisateur mis à jour avec succès", user: updatedUser };
  } else if (method === "DELETE") {
    // ✅ SUPPRIMER UN UTILISATEUR
    const existingUser = await prisma.utilisateur.findUnique({ where: { id: Number(id) } });

    if (!existingUser) {
      throw createError({ statusCode: 404, statusMessage: "Utilisateur non trouvé." });
    }

    await prisma.utilisateur.delete({ where: { id: Number(id) } });

    return { message: "Utilisateur supprimé avec succès" };
  }

  throw createError({ statusCode: 405, statusMessage: "Méthode non autorisée." });
});
