import { PrismaClient } from "@prisma/client";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";

export default defineEventHandler(async (event) => {
  const prisma = new PrismaClient();
  const body = await readBody(event);

  const { email, password } = body;

  // Vérifier si l'utilisateur existe
  const user = await prisma.utilisateur.findUnique({
    where: { email },
  });

  if (!user) {
    return { error: "Email ou mot de passe incorrect." };
  }

  // Vérifier le mot de passe
  const passwordMatch = await bcrypt.compare(password, user.password);
  if (!passwordMatch) {
    return { error: "Email ou mot de passe incorrect." };
  }

  // Générer un token JWT
  const token = jwt.sign({ id: user.id, email: user.email }, "secret_key", { expiresIn: "1h" });

  return { token, user: { id: user.id, name: user.name, email: user.email } };
});
