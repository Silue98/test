/*
  Warnings:

  - Added the required column `Id_classe` to the `enfant` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `presence_Id_Enfant_fkey` ON `presence`;

-- AlterTable
ALTER TABLE `enfant` ADD COLUMN `Id_classe` INTEGER NOT NULL;

-- CreateIndex
CREATE INDEX `Id_classe` ON `enfant`(`Id_classe`);

-- AddForeignKey
ALTER TABLE `enfant` ADD CONSTRAINT `enfant_Id_classe_fkey` FOREIGN KEY (`Id_classe`) REFERENCES `classe`(`Id_classe`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `presence` ADD CONSTRAINT `presence_Id_Enfant_fkey` FOREIGN KEY (`Id_Enfant`) REFERENCES `enfant`(`Id_Enfant`) ON DELETE RESTRICT ON UPDATE CASCADE;
