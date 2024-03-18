import { PrismaClient } from '@prisma/client'

export default defineEventHandler(async (event) => {
  const prisma = new PrismaClient()
  const inscriptions = await prisma.incription.findMany();
  return { data: inscriptions}
})