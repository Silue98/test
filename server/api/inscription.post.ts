import { PrismaClient } from "@prisma/client"
import payementPost from "./payement.post"
export default defineEventHandler(async (event) => {
    const {
        nomenfant,prenomenfant,Id_classe,Id_Enfant,dateinscription,classe
    }= await readBody(event)
        
    const prisma = new PrismaClient()
    const incription = await prisma.incription.create({
      data:{
        nomenfant:nomenfant,
          prenomenfant:prenomenfant,
          Id_Enfant:Id_Enfant,
          Id_classe:Id_classe,
          dateinscription:dateinscription,
          classe:classe
         // totatpayement://<<Fabrice has commented this line 08_07_24
      }
        // data:{
          
        //   nomenfant:nomenfant,
        //   prenomenfant:prenomenfant,
        //   Id_Enfant:6 ,
        //   Id_classe:6,
        //   dateinscription:'1970-01-01T00:00:00.000Z'

          
        // }
        
        
      })
      console.log(incription.nomenfant,incription.prenomenfant,incription.Id_Enfant)
     
    //const users = await prisma.Admin.findMany();
  
    //return { data: users }


    
  return { data: incription,status:"200" }
 
})