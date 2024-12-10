-- MySQL Script generated by MySQL Workbench
-- Mon Dec  9 23:11:14 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

-- Configurações iniciais para evitar problemas durante a execução
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Criação do schema `comanda_digital`
-- Representa o banco de dados para o sistema de comanda digital
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `comanda_digital` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `comanda_digital`;

-- -----------------------------------------------------
-- Tabela `dishes`
-- Representa os pratos disponíveis no sistema (modificada para incluir sorvetes)
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comanda_digital`.`dishes`;

CREATE TABLE IF NOT EXISTS `comanda_digital`.`dishes` (
  `id` BIGINT NOT NULL AUTO_INCREMENT, -- Identificador único do prato
  `description` VARCHAR(255) NULL DEFAULT NULL, -- Descrição do prato (opcional)
  `name` VARCHAR(255) NULL DEFAULT NULL, -- Nome do prato
  `price` DOUBLE NULL DEFAULT NULL, -- Preço do prato (opcional)
  PRIMARY KEY (`id`) -- Chave primária
)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- Inserir dados de exemplo de sorvetes na tabela `dishes`
INSERT INTO `comanda_digital`.`dishes` (`description`, `name`, `price`) VALUES
('Sorvete de chocolate com cobertura', 'Sorvete de Chocolate', 12.50),
('Sorvete de morango com pedaços de frutas', 'Sorvete de Morango', 15.00),
('Sorvete de baunilha com calda de caramelo', 'Sorvete de Baunilha', 13.00);

-- -----------------------------------------------------
-- Tabela `pedido`
-- Representa os pedidos realizados pelos clientes (modificada para incluir pedidos de sorvete)
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comanda_digital`.`pedido`;

CREATE TABLE IF NOT EXISTS `comanda_digital`.`pedido` (
  `id` BIGINT NOT NULL AUTO_INCREMENT, -- Identificador único do pedido
  `item` VARCHAR(255) NOT NULL, -- Nome do item solicitado
  `preco_unitario` DOUBLE NOT NULL, -- Preço unitário do item solicitado
  `status` VARCHAR(255) NOT NULL, -- Status do pedido (ex.: "pendente", "entregue")
  `dish_id` BIGINT NULL DEFAULT NULL, -- Chave estrangeira opcional para o prato relacionado
  PRIMARY KEY (`id`), -- Chave primária
  INDEX `fk_dish_pedido` (`dish_id` ASC) VISIBLE, -- Índice para a coluna de chave estrangeira
  CONSTRAINT `fk_dish_pedido` -- Chave estrangeira
    FOREIGN KEY (`dish_id`) -- Relaciona-se com a coluna `id` da tabela `dishes`
    REFERENCES `comanda_digital`.`dishes` (`id`)
)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- Inserir pedidos de exemplo de sorvete na tabela `pedido`
INSERT INTO `comanda_digital`.`pedido` (`item`, `preco_unitario`, `status`, `dish_id`) VALUES
('Sorvete de Chocolate', 12.50, 'pendente', 1),  -- `dish_id` 1 refere-se ao prato "Sorvete de Chocolate"
('Sorvete de Morango', 15.00, 'entregue', 2),    -- `dish_id` 2 refere-se ao prato "Sorvete de Morango"
('Sorvete de Baunilha', 13.00, 'pendente', 3);   -- `dish_id` 3 refere-se ao prato "Sorvete de Baunilha"

-- Restaura as configurações padrão após a execução
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;