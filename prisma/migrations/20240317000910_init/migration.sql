-- CreateTable
CREATE TABLE `absencepresence` (
    `Id_absencepresence` INTEGER NOT NULL,
    `dateappel` DATE NULL,
    `statutappel` VARCHAR(10) NULL,

    PRIMARY KEY (`Id_absencepresence`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `classe` (
    `Id_classe` INTEGER NOT NULL AUTO_INCREMENT,
    `nomclass` VARCHAR(50) NULL,
    `delclass` VARCHAR(50) NULL,
    `moniprincipal` VARCHAR(50) NULL,

    PRIMARY KEY (`Id_classe`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `enfant` (
    `Id_Enfant` INTEGER NOT NULL AUTO_INCREMENT,
    `nomenfant` VARCHAR(50) NULL,
    `prenomenfant` VARCHAR(50) NULL,
    `genre` VARCHAR(10) NULL,
    `habitationenfant` VARCHAR(50) NULL,
    `lieuhabitation` VARCHAR(50) NULL,
    `numerotelephone` VARCHAR(50) NULL,
    `emailenfant` VARCHAR(50) NULL,
    `datenaissance` DATE NULL,
    `lieunaissanceenfant` VARCHAR(50) NULL,
    `club` VARCHAR(50) NULL,
    `dateentreed` DATE NULL,
    `orphelinpas` VARCHAR(50) NULL,
    `pere_mere` VARCHAR(50) NULL,
    `Id_Mere` INTEGER NOT NULL,
    `Id_Pere` INTEGER NOT NULL,

    INDEX `Id_Mere`(`Id_Mere`),
    INDEX `Id_Pere`(`Id_Pere`),
    PRIMARY KEY (`Id_Enfant`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `incription` (
    `Id_Incription` INTEGER NOT NULL,
    `nomenfant` VARCHAR(50) NULL,
    `prenomenfant` VARCHAR(50) NULL,
    `classe` VARCHAR(50) NULL,
    `Id_classe` INTEGER NOT NULL,
    `Id_Enfant` INTEGER NOT NULL,
    `dateinscription` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Id_Enfant`(`Id_Enfant`),
    INDEX `Id_classe`(`Id_classe`),
    PRIMARY KEY (`Id_Incription`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `mere` (
    `Id_Mere` INTEGER NOT NULL AUTO_INCREMENT,
    `nommere` VARCHAR(50) NULL,
    `prenommere` VARCHAR(50) NULL,
    `lieuhabitationmere` VARCHAR(50) NULL,
    `numeromere` VARCHAR(50) NULL,
    `emailmere` VARCHAR(50) NULL,
    `professionmere` VARCHAR(50) NULL,
    `religionmere` VARCHAR(50) NULL,
    `eglisemere` VARCHAR(50) NULL,

    PRIMARY KEY (`Id_Mere`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `migrations` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `migration` VARCHAR(100) NOT NULL,
    `batch` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `payement` (
    `Id_Payement` INTEGER NOT NULL AUTO_INCREMENT,
    `montant` DECIMAL(15, 2) NULL,
    `moyenpayement` VARCHAR(50) NULL,
    `totatpayement` DECIMAL(15, 2) NULL,
    `reponsablefinancement` VARCHAR(50) NULL,
    `statutpayement` VARCHAR(10) NULL,
    `Id_Incription` INTEGER NOT NULL,

    INDEX `Id_Incription`(`Id_Incription`),
    PRIMARY KEY (`Id_Payement`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pere` (
    `Id_Pere` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(50) NULL,
    `profession` VARCHAR(50) NULL,
    `nompere` VARCHAR(50) NULL,
    `prenompere` VARCHAR(50) NULL,
    `lieuhabitation` VARCHAR(50) NULL,
    `numerotelephone` VARCHAR(50) NULL,
    `religionpere` VARCHAR(50) NULL,
    `eglisepere` VARCHAR(50) NULL,

    PRIMARY KEY (`Id_Pere`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `presence` (
    `Id_Incription` INTEGER NOT NULL AUTO_INCREMENT,
    `Id_absencepresence` INTEGER NOT NULL,

    INDEX `Id_absencepresence`(`Id_absencepresence`),
    PRIMARY KEY (`Id_Incription`, `Id_absencepresence`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
