/*
  Warnings:

  - You are about to drop the column `status` on the `utilisateur` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX `presence_Id_Enfant_fkey` ON `presence`;

-- AlterTable
ALTER TABLE `utilisateur` DROP COLUMN `status`,
    ADD COLUMN `Actif` BOOLEAN NOT NULL DEFAULT false;

-- AddForeignKey
ALTER TABLE `classe` ADD CONSTRAINT `classe_utilisateurId_fkey` FOREIGN KEY (`utilisateurId`) REFERENCES `Utilisateur`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `enfant` ADD CONSTRAINT `enfant_Id_classe_fkey` FOREIGN KEY (`Id_classe`) REFERENCES `classe`(`Id_classe`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `presence` ADD CONSTRAINT `presence_Id_Enfant_fkey` FOREIGN KEY (`Id_Enfant`) REFERENCES `enfant`(`Id_Enfant`) ON DELETE RESTRICT ON UPDATE CASCADE;
