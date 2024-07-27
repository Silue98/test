import { PrismaClient } from "@prisma/client"
export default defineEventHandler(async (event) => {
    const {
       Id_Incription,montant,moyenpayement,totatpayement, reponsablefinancement 
    }= await readBody(event)
        
    const prisma = new PrismaClient()
    const incription = await prisma.payement.create({
      data:{
        Id_Incription:Id_Incription,
        montant:montant,
        moyenpayement:moyenpayement,
        totatpayement:totatpayement,
        reponsablefinancement:reponsablefinancement,
       
      }
       
        
        
      })
      
    
  
    


    
  return { data: incription }
 
})