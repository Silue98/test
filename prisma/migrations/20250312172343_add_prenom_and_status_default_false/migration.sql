/*
  Warnings:

  - Added the required column `prenom` to the `Utilisateur` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `presence_Id_Enfant_fkey` ON `presence`;

-- AlterTable
ALTER TABLE `utilisateur` ADD COLUMN `prenom` VARCHAR(191) NOT NULL,
    ADD COLUMN `status` BOOLEAN NOT NULL DEFAULT false;

-- AddForeignKey
ALTER TABLE `classe` ADD CONSTRAINT `classe_utilisateurId_fkey` FOREIGN KEY (`utilisateurId`) REFERENCES `Utilisateur`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `enfant` ADD CONSTRAINT `enfant_Id_classe_fkey` FOREIGN KEY (`Id_classe`) REFERENCES `classe`(`Id_classe`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `presence` ADD CONSTRAINT `presence_Id_Enfant_fkey` FOREIGN KEY (`Id_Enfant`) REFERENCES `enfant`(`Id_Enfant`) ON DELETE RESTRICT ON UPDATE CASCADE;
