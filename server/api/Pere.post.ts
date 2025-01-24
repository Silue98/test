import { PrismaClient } from "@prisma/client"
export default defineEventHandler(async (event) => {
    const {
        Id_Pere,
        email, 
        profession,
        nompere,
        prenompere,
        lieuhabitation,
        numerotelephone,
        religionpere,
        eglisepere,
}= await readBody(event)
    const prisma = new PrismaClient()
    const pere = await prisma.pere.create({
   
        data:{
        Id_Pere,
        email,
        profession,
        nompere,
        prenompere,
        lieuhabitation,
        numerotelephone,
        religionpere,
        eglisepere
        }
        
      })
     
    //const users = await prisma.Admin.findMany();
  
    //return { data: users }


    
  return { data: pere }
})