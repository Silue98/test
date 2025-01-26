import { PrismaClient } from '@prisma/client'

export default defineEventHandler(async (event) => {
  const prisma = new PrismaClient()
  const inscriptions = await prisma.incription.findMany({
    where: {
            classe: 'A6',  // Filtre pour récupérer seulement les inscriptions où la classe est A1
          },
        });
  return { data: inscriptions}
})
// import { PrismaClient } from '@prisma/client'

// export default defineEventHandler(async (event) => {
//   const prisma = new PrismaClient()
//   const inscriptions = await prisma.inscription.findMany({
//     where: {
//       classe: 'A1',  // Filtre pour récupérer seulement les inscriptions où la classe est A1
//     },
//   })
//   return { data: inscriptions }
// })
