import { PrismaClient } from "@prisma/client";

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
  } = await readBody(event);

  const prisma = new PrismaClient();

  // Création du père dans la base de données
  const pere = await prisma.pere.create({
    data: {
      Id_Pere,
      email:email,
      profession:profession,
      nompere:nompere,
      prenompere:prenompere,
      lieuhabitation:lieuhabitation,
      numerotelephone:numerotelephone,
      religionpere:religionpere,
      eglisepere:eglisepere,
    },
  });

  // Message dans la console après la création du père
  // console.log("Père créé avec succès:", pere);

  // Vous pouvez également ajouter un message plus détaillé si vous le souhaitez
  // console.log(`Un nouveau père a été ajouté avec l'ID : ${pere.Id_Pere}`);

  return { data: pere };
});
