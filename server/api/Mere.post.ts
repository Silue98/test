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
    const mere = await prisma.mere.create({
   
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
  //console.log(`Un nouveau père a été ajouté avec l'ID : ${pere.Id_Pere}`);
  // console.log("Père créé avec succès:", mere);
    return { data: mere}


    
  // return { data: mere }
})