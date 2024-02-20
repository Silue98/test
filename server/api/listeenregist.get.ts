import { PrismaClient } from '@prisma/client'

export default defineEventHandler(async (event) => {
  const prisma = new PrismaClient()
  const enfants = await prisma.enfant.findMany();
  return { data: enfants }
})