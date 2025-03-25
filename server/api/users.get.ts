import { PrismaClient } from '@prisma/client'

export default defineEventHandler(async (event) => {
  const prisma = new PrismaClient()
  const users = await prisma.utilisateur.findMany({
    include: {
     classe: true
    }
  });
  return { data: users }
})