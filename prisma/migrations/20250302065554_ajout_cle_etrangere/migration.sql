/*
  Warnings:

  - A unique constraint covering the columns `[utilisateurId]` on the table `classe` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX `presence_Id_Enfant_fkey` ON `presence`;

-- AlterTable
ALTER TABLE `classe` ADD COLUMN `utilisateurId` INTEGER NULL;

-- CreateIndex
CREATE UNIQUE INDEX `classe_utilisateurId_key` ON `classe`(`utilisateurId`);

-- CreateIndex
CREATE INDEX `idx_utilisateurId` ON `classe`(`utilisateurId`);

-- AddForeignKey
ALTER TABLE `classe` ADD CONSTRAINT `classe_utilisateurId_fkey` FOREIGN KEY (`utilisateurId`) REFERENCES `Utilisateur`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `enfant` ADD CONSTRAINT `enfant_Id_classe_fkey` FOREIGN KEY (`Id_classe`) REFERENCES `classe`(`Id_classe`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `presence` ADD CONSTRAINT `presence_Id_Enfant_fkey` FOREIGN KEY (`Id_Enfant`) REFERENCES `enfant`(`Id_Enfant`) ON DELETE RESTRICT ON UPDATE CASCADE;
