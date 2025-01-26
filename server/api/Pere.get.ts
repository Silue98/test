import { PrismaClient } from '@prisma/client'

export default defineEventHandler(async (event) => {
  const prisma = new PrismaClient()
  const peres = await prisma.pere.findMany();
  return { data: peres }
})