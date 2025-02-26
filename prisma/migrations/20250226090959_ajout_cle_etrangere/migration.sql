-- DropIndex
DROP INDEX `presence_Id_Enfant_fkey` ON `presence`;

-- AddForeignKey
ALTER TABLE `presence` ADD CONSTRAINT `presence_Id_Enfant_fkey` FOREIGN KEY (`Id_Enfant`) REFERENCES `enfant`(`Id_Enfant`) ON DELETE RESTRICT ON UPDATE CASCADE;
