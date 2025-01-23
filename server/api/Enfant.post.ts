import { PrismaClient } from "@prisma/client"
export default defineEventHandler(async (event) => {
    const {
        Id_Enfant,
        nomenfant, 
      prenomenfant,
      genre,
      habitationenfant,
      lieuhabitation,
      numerotelephone,
      emailenfant,
      datenaissance,
      lieunaissanceenfant,
      club,
      dateentreed,
      orphelinpas,
      pere_mere,
      Id_Mere,
      Id_Pere
}= await readBody(event)
    const prisma = new PrismaClient()
    const professeur = await prisma.enfant.create({
   
        data:{
          Id_Enfant, 
          nomenfant,
        prenomenfant,
      genre,
    habitationenfant,
    lieuhabitation,
    numerotelephone,
    emailenfant,
    datenaissance,
    lieunaissanceenfant,
    club,
    dateentreed,
    orphelinpas,
    pere_mere,
    Id_Mere,
    Id_Pere
        }
        
      })
     
    //const users = await prisma.Admin.findMany();
  
    //return { data: users }


    
  return { data: professeur }
})