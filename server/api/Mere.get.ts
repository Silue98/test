import { PrismaClient } from '@prisma/client'

export default defineEventHandler(async (event) => {
  const prisma = new PrismaClient()
  const meres = await prisma.mere.findMany();
  return { data: meres }
})