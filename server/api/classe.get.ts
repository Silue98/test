import { PrismaClient } from '@prisma/client'

export default defineEventHandler(async (event) => {
  const prisma = new PrismaClient()
  const classes= await prisma.classe.findMany();
  return { data: classes }
})