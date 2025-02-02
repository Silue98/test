import { PrismaClient, type presence} from "@prisma/client"
import { PrismaClientKnownRequestError } from "@prisma/client/runtime/library";
export default defineEventHandler(async (event) => {
  const body = await readBody<presence[]>(event)

  // const isDataValid = body.every((item) => {
  //   if (!item.Id_Enfant || !item.Id_Presence) { 
  //     return false;
  //   }

  //   return true;
  // })

  // if (isDataValid === false) { 
  //   throw createError({
  //     status: 400,
  //     message: "Les données envoyées ne sont pas valides",
  //   });
  // }

  const data = body.map((presence) => ({
    ...presence,
    present: String(presence.present),
    absent: String(presence.absent),
    Id_Incription: String(presence.Id_Incription),
  }));


    const prisma = new PrismaClient()

  try {
    const presence = await prisma.presence.createMany({ data })

    //const users = await prisma.Admin.findMany();
    //console.log(`Un nouveau père a été ajouté avec l'ID : ${pere.Id_Pere}`);
    console.log("Appel créé avec succès:", presence);
    
    return { data: presence }
  } catch (error: unknown) { 
    console.error("Impossible de créer l'appel:", error);
    throw createError({
      status: 500,
      message: "Impossible de créer l'appel",
    });
  }
  
     


    
  // return { data: mere }
})