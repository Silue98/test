import { PrismaClient} from "@prisma/client";

export default defineEventHandler(async (event) => {
  // Assurez-vous que event.params.id existe avant de l'extraire
  const id = event.context.params.id 
  
  //const result = id ? `Hello, ${id}!` : 'Hello!';
  const prisma = new PrismaClient();
  const inscriptions = await prisma.incription.findUnique({
    where: {
      Id_Incription:parseInt(id)
    },
    
  }) 
  console.log('id:'+id)

  return {data:inscriptions};
  
  
});