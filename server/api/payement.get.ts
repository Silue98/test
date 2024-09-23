import { PrismaClient } from '@prisma/client'

export default defineEventHandler(async (event) => {
  const prisma = new PrismaClient()
  const paiements = await prisma.payement.findMany();
  return { data: paiements }
})