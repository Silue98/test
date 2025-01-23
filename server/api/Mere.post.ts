import { PrismaClient } from "@prisma/client"
export default defineEventHandler(async (event) => {
    const {
        Id_Mere,
        nommere, 
        prenommere,
        lieuhabitationmere,
        numeromere,
        emailmere,
        professionmere,
        religionmere,
        eglisemere,
     
}= await readBody(event)
    const prisma = new PrismaClient()
    const professeur = await prisma.mere.create({
   
        data:{
        Id_Mere,
        nommere,
        prenommere,
        lieuhabitationmere,
        numeromere,
        emailmere,
        professionmere,
        religionmere,
        eglisemere
        }
        
      })
     
    //const users = await prisma.Admin.findMany();
  
    //return { data: users }


    
  return { data: professeur }
})