-- AlterTable
ALTER TABLE `absencepresence` MODIFY `dateappel` VARCHAR(50) NULL;

-- AlterTable
ALTER TABLE `enfant` MODIFY `datenaissance` VARCHAR(50) NULL,
    MODIFY `dateentreed` VARCHAR(50) NULL;

-- AlterTable
ALTER TABLE `incription` MODIFY `dateinscription` VARCHAR(50) NULL;
