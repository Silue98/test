import { PrismaClient } from "@prisma/client";
import bcrypt from "bcrypt";

export default defineEventHandler(async (event) => {
  const prisma = new PrismaClient();
  const body = await readBody(event);

  const { name, email, password } = body;

  // Vérifier si l'utilisateur existe déjà
  const existingUser = await prisma.utilisateur.findUnique({
    where: { email },
  });

  if (existingUser) {
    return { error: "L'email est déjà utilisé." };
  }

  // Hacher le mot de passe
  const hashedPassword = await bcrypt.hash(password, 10);

  // Créer l'utilisateur
  const user = await prisma.utilisateur.create({
    data: {
      name,
      email,
      password: hashedPassword,
    },
  });

  return { message: "Utilisateur créé avec succès", user };
});
