-- CreateTable
CREATE TABLE `Funcionario` (
    `idFuncionario` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(191) NOT NULL,
    `carteiraDeTrabalho` INTEGER NOT NULL,
    `dataContratacao` DATETIME(3) NOT NULL,
    `salario` DOUBLE NOT NULL,

    PRIMARY KEY (`idFuncionario`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Filme` (
    `idFilme` INTEGER NOT NULL AUTO_INCREMENT,
    `NomeBR` VARCHAR(191) NOT NULL,
    `NomeEN` VARCHAR(191) NOT NULL,
    `anoLancamento` INTEGER NOT NULL,
    `sinopse` VARCHAR(191) NOT NULL,
    `IDgenero` INTEGER NOT NULL,

    PRIMARY KEY (`idFilme`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Genero` (
    `idGenero` INTEGER NOT NULL AUTO_INCREMENT,
    `genero` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`idGenero`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Sala` (
    `idSala` INTEGER NOT NULL AUTO_INCREMENT,
    `nomeSala` VARCHAR(191) NOT NULL,
    `capacidade` INTEGER NOT NULL,
    `suporta3D` BOOLEAN NOT NULL,
    `IDcinema` INTEGER NOT NULL,

    PRIMARY KEY (`idSala`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Cinema` (
    `idCinema` INTEGER NOT NULL AUTO_INCREMENT,
    `nomeCinema` VARCHAR(191) NOT NULL,
    `enderecoCinema` VARCHAR(191) NOT NULL,
    `contatoCinema` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`idCinema`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Horario` (
    `idHorario` INTEGER NOT NULL AUTO_INCREMENT,
    `horario` DATETIME(3) NOT NULL,

    PRIMARY KEY (`idHorario`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Ingresso` (
    `idIngresso` INTEGER NOT NULL AUTO_INCREMENT,
    `data` DATETIME(3) NOT NULL,
    `valor` DOUBLE NOT NULL,
    `poltrona` INTEGER NOT NULL,
    `sala_idSala` INTEGER NOT NULL,
    `IDfuncionario` INTEGER NOT NULL,
    `IDsessao` INTEGER NOT NULL,

    PRIMARY KEY (`idIngresso`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Sessao` (
    `idSessao` INTEGER NOT NULL AUTO_INCREMENT,
    `inicio` DATETIME(3) NOT NULL,
    `fim` DATETIME(3) NOT NULL,
    `legendado` VARCHAR(191) NOT NULL,
    `IDsala` INTEGER NOT NULL,
    `IDfilme` INTEGER NOT NULL,
    `IDhorario` INTEGER NOT NULL,

    PRIMARY KEY (`idSessao`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Filme` ADD CONSTRAINT `Filme_IDgenero_fkey` FOREIGN KEY (`IDgenero`) REFERENCES `Genero`(`idGenero`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Sala` ADD CONSTRAINT `Sala_IDcinema_fkey` FOREIGN KEY (`IDcinema`) REFERENCES `Cinema`(`idCinema`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Ingresso` ADD CONSTRAINT `Ingresso_IDfuncionario_fkey` FOREIGN KEY (`IDfuncionario`) REFERENCES `Funcionario`(`idFuncionario`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Ingresso` ADD CONSTRAINT `Ingresso_IDsessao_fkey` FOREIGN KEY (`IDsessao`) REFERENCES `Sessao`(`idSessao`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Sessao` ADD CONSTRAINT `Sessao_IDsala_fkey` FOREIGN KEY (`IDsala`) REFERENCES `Sala`(`idSala`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Sessao` ADD CONSTRAINT `Sessao_IDfilme_fkey` FOREIGN KEY (`IDfilme`) REFERENCES `Filme`(`idFilme`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Sessao` ADD CONSTRAINT `Sessao_IDhorario_fkey` FOREIGN KEY (`IDhorario`) REFERENCES `Horario`(`idHorario`) ON DELETE RESTRICT ON UPDATE CASCADE;
