/*
  Warnings:

  - The primary key for the `presence` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `Id_absencepresence` on the `presence` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[Id_Enfant]` on the table `presence` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `Id_Enfant` to the `presence` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Id_Presence` to the `presence` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `Id_absencepresence` ON `presence`;

-- AlterTable
ALTER TABLE `presence` DROP PRIMARY KEY,
    DROP COLUMN `Id_absencepresence`,
    ADD COLUMN `Id_Enfant` INTEGER NOT NULL,
    ADD COLUMN `Id_Presence` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `absent` VARCHAR(20) NULL,
    ADD COLUMN `classe` VARCHAR(50) NULL,
    ADD COLUMN `dateappel` VARCHAR(50) NULL,
    ADD COLUMN `motif` VARCHAR(200) NULL,
    ADD COLUMN `nomenfant` VARCHAR(50) NULL,
    ADD COLUMN `prenomenfant` VARCHAR(50) NULL,
    ADD COLUMN `present` VARCHAR(20) NULL,
    MODIFY `Id_Incription` VARCHAR(50) NULL,
    ADD PRIMARY KEY (`Id_Presence`);

-- CreateIndex
CREATE UNIQUE INDEX `Id_Enfant` ON `presence`(`Id_Enfant`);

-- CreateIndex
CREATE INDEX `Id_Incription` ON `presence`(`Id_Incription`);
