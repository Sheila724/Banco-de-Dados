CREATE TABLE cliente (
  id_cliente INT IDENTITY(1,1) NOT NULL,
  nome VARCHAR(255) NOT NULL,
  endere�o VARCHAR(255) NOT NULL,
  telefone VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  PRIMARY KEY (id_cliente)
);

CREATE TABLE pedido (
  id_pedido INT IDENTITY(1,1) NOT NULL,
  data DATE NOT NULL,
  produto VARCHAR(255) NOT NULL,
  quantidade INT NOT NULL,
  valor DECIMAL NOT NULL,
  status VARCHAR(255) NOT NULL,
  id_cliente INT NOT NULL,
  PRIMARY KEY (id_pedido),
  FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);

CREATE TABLE entrega (
  id_entrega INT IDENTITY(1,1) NOT NULL,
  data DATE NOT NULL,
  hora TIME NOT NULL,
  local VARCHAR(255) NOT NULL,
  motorista VARCHAR(255) NOT NULL,
  ve�culo VARCHAR(255) NOT NULL,
  id_pedido INT NOT NULL,
  PRIMARY KEY (id_entrega),
  FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido)
);

CREATE TABLE produto (
  id_produto INT IDENTITY(1,1) NOT NULL,
  nome VARCHAR(255) NOT NULL,
  descri��o VARCHAR(255) NOT NULL,
  c�digo VARCHAR(255) NOT NULL,
  pre�o FLOAT NOT NULL,
  PRIMARY KEY (id_produto)
);

CREATE TABLE motorista (
  id_motorista INT IDENTITY(1,1) NOT NULL,
  nome VARCHAR(255) NOT NULL,
  cpf VARCHAR(11) NOT NULL,
  cnh VARCHAR(255) NOT NULL,
  telefone VARCHAR(255) NOT NULL,
  PRIMARY KEY (id_motorista)
);

CREATE TABLE ve�culo (
  id_ve�culo INT IDENTITY(1,1) NOT NULL,
  marca VARCHAR(255) NOT NULL,
  modelo VARCHAR(255) NOT NULL,
  placa VARCHAR(7) NOT NULL,
  ano INT NOT NULL,
  PRIMARY KEY (id_ve�culo)
);

INSERT INTO cliente (nome, endere�o, telefone, email) VALUES
('Jo�o Silva', 'Rua A, 123', '(11) 1234-5678', 'joao.silva@email.com'),
('Maria Oliveira', 'Av. B, 456', '(22) 2345-6789', 'maria.oliveira@email.com'),
('Carlos Santos', 'Rua C, 789', '(33) 3456-7890', 'carlos.santos@email.com'),
('Ana Pereira', 'Av. D, 101', '(44) 4567-8901', 'ana.pereira@email.com'),
('Rodrigo Lima', 'Rua E, 202', '(55) 5678-9012', 'rodrigo.lima@email.com'),
('Juliana Costa', 'Av. F, 303', '(66) 6789-0123', 'juliana.costa@email.com'),
('Fernando Souza', 'Rua G, 404', '(77) 7890-1234', 'fernando.souza@email.com'),
('Mariana Santos', 'Av. H, 505', '(88) 8901-2345', 'mariana.santos@email.com'),
('Ricardo Oliveira', 'Rua I, 606', '(99) 9012-3456', 'ricardo.oliveira@email.com'),
('Patr�cia Lima', 'Av. J, 707', '(10) 0123-4567', 'patricia.lima@email.com'),
('Luiz Silva', 'Rua K, 808', '(21) 1234-5678', 'luiz.silva@email.com'),
('Cristina Costa', 'Av. L, 909', '(32) 2345-6789', 'cristina.costa@email.com'),
('Eduardo Pereira', 'Rua M, 111', '(43) 3456-7890', 'eduardo.pereira@email.com'),
('F�tima Souza', 'Av. N, 222', '(54) 4567-8901', 'fatima.souza@email.com'),
('Gabriel Lima', 'Rua O, 333', '(65) 5678-9012', 'gabriel.lima@email.com'),
('Isabela Costa', 'Av. P, 444', '(76) 6789-0123', 'isabela.costa@email.com'),
('Lucas Santos', 'Rua Q, 555', '(87) 7890-1234', 'lucas.santos@email.com'),
('Raquel Oliveira', 'Av. R, 666', '(98) 8901-2345', 'raquel.oliveira@email.com'),
('Henrique Lima', 'Rua S, 777', '(09) 9012-3456', 'henrique.lima@email.com'),
('Amanda Silva', 'Av. T, 888', '(20) 0123-4567', 'amanda.silva@email.com'),
('Marcos Costa', 'Rua U, 999', '(31) 1234-5678', 'marcos.costa@email.com'),
('Larissa Souza', 'Av. V, 1010', '(42) 2345-6789', 'larissa.souza@email.com'),
('Paulo Santos', 'Rua W, 1111', '(53) 3456-7890', 'paulo.santos@email.com'),
('Tatiane Pereira', 'Av. X, 1212', '(64) 4567-8901', 'tatiane.pereira@email.com'),
('Vin�cius Lima', 'Rua Y, 1313', '(75) 5678-9012', 'vinicius.lima@email.com'),
('Renata Costa', 'Av. Z, 1414', '(86) 6789-0123', 'renata.costa@email.com'),
('Jos� Oliveira', 'Rua 1, 1515', '(97) 7890-1234', 'jose.oliveira@email.com'),
('Camila Lima', 'Av. 2, 1616', '(08) 8901-2345', 'camila.lima@email.com'),
('Hugo Santos', 'Rua 3, 1717', '(19) 9012-3456', 'hugo.santos@email.com'),
('Daniela Costa', 'Av. 4, 1818', '(20) 0123-4567', 'daniela.costa@email.com');

INSERT INTO pedido (data, produto, quantidade, valor, status, id_cliente) VALUES
('2023-11-29', 'Laptop UltraSlim', 5, 1000.00, 'Em processamento', 1),
('2023-11-29', 'Smart TV 4K', 3, 800.00, 'Em processamento', 2),
('2023-11-29', 'Smartphone Avan�ado', 2, 600.50, 'Aguardando pagamento', 3),
('2023-11-28', 'C�mera Digital Profissional', 1, 1200.75, 'Enviado', 4),
('2023-11-28', 'Forno Micro-ondas Inteligente', 4, 300.20, 'Entregue', 5),
('2023-11-25', 'Impressora Multifuncional a Laser', 2, 500.50, 'Em processamento', 6),
('2023-11-25', 'M�quina de Caf� Autom�tica', 3, 150.30, 'Em processamento', 7),
('2023-11-27', 'Headphones Bluetooth Premium', 1, 250.75, 'Aguardando pagamento', 8),
('2023-11-27', 'Tablet H�brido', 6, 700.00, 'Enviado', 9),
('2023-11-27', 'Aspirador de P� Rob�', 2, 350.25, 'Entregue', 10),
('2023-11-29', 'Drone de Alta Performance', 4, 450.50, 'Em processamento', 11),
('2023-11-30', 'Monitor Curvo Gamer', 3, 550.25, 'Em processamento', 12),
('2023-11-30', 'Mochila Executiva Resistente � �gua', 1, 1100.00, 'Aguardando pagamento', 13),
('2023-11-10', 'Teclado Mec�nico RGB', 5, 200.50, 'Enviado', 14),
('2023-11-10', 'Console de Videogame de �ltima Gera��o', 2, 950.75, 'Entregue', 15),
('2023-11-10', 'Caixa de Som Bluetooth Port�til', 3, 650.30, 'Em processamento', 16),
('2023-11-10', 'Conjunto de Panelas Antiaderentes', 1, 400.25, 'Em processamento', 17),
('2023-11-17', 'Rel�gio Inteligente com GPS', 4, 500.50, 'Aguardando pagamento', 18),
('2023-11-17', 'Conjunto de Ferramentas Profissionais', 2, 850.25, 'Enviado', 19),
('2023-11-17', 'Bicicleta El�trica Dobr�vel', 3, 750.00, 'Entregue', 20),
('2023-11-15', 'Purificador de Ar com Ionizador', 1, 300.75, 'Em processamento', 21),
('2023-11-15', 'Kit de Maquiagem Profissional', 5, 350.20, 'Aguardando pagamento', 22),
('2023-11-15', 'Adega Climatizada para Vinhos', 2, 1200.50, 'Enviado', 23),
('2023-11-15', 'Patins Inline de Alta Velocidade', 3, 800.30, 'Entregue', 24),
('2023-11-05', 'Conjunto de Malas de Viagem', 1, 550.25, 'Em processamento', 25),
('2023-11-04', 'Kit de Churrasco em A�o Inoxid�vel', 4, 600.50, 'Em processamento', 26),
('2023-11-03', 'Sof� Modular com Sistema de Som Integrado', 2, 700.25, 'Aguardando pagamento', 27),
('2023-11-02', 'Monitor de Press�o Arterial Digital', 3, 1100.00, 'Enviado', 28),
('2023-11-01', 'Kit de Jardinagem Completo', 1, 450.50, 'Entregue', 29),
('2023-11-07', '�culos de Realidade Virtual', 5, 1000.75, 'Em processamento', 30);

INSERT INTO entrega (data, hora, local, motorista, ve�culo, id_pedido) VALUES
('2023-11-15', '10:00:00', 'Rua A, 123', 'Carlos Silva', 'Chevrolet Cruze', 6),
('2023-11-15', '11:30:00', 'Av. B, 456', 'Marta Oliveira', 'Ford Focus', 7),
('2023-11-15', '13:00:00', 'Rua C, 789', 'Pedro Santos', 'Toyota Corolla', 8),
('2023-11-15', '14:30:00', 'Av. D, 101', 'Beatriz Pereira', 'Honda Civic', 9),
('2023-11-15', '16:00:00', 'Rua E, 202', 'Roberto Lima', 'Volkswagen Golf', 10),
('2023-11-16', '10:00:00', 'Av. F, 303', 'Carolina Costa', 'Nissan Altima', 11),
('2023-11-16', '11:30:00', 'Rua G, 404', 'F�bio Souza', 'Hyundai Elantra', 12),
('2023-11-16', '13:00:00', 'Av. H, 505', 'L�cia Santos', 'Mazda Mazda3', 13),
('2023-11-16', '14:30:00', 'Rua I, 606', 'Diego Oliveira', 'Subaru Impreza', 14),
('2023-11-16', '16:00:00', 'Av. J, 707', 'Helena Lima', 'Kia Forte', 15),
('2023-11-17', '10:00:00', 'Rua K, 808', 'Ricardo Silva', 'Mercedes-Benz C-Class', 16),
('2023-11-17', '11:30:00', 'Av. L, 909', 'Carla Costa', 'BMW 3 Series', 17),
('2023-11-17', '13:00:00', 'Rua M, 111', 'Eduardo Pereira', 'Audi A4', 18),
('2023-11-17', '14:30:00', 'Av. N, 222', 'Sandra Souza', 'Lexus IS', 19),
('2023-11-17', '16:00:00', 'Rua O, 333', 'Gustavo Lima', 'Chrysler 200', 20),
('2023-11-18', '10:00:00', 'Av. P, 444', 'Tatiane Costa', 'Jeep Compass', 21),
('2023-11-18', '11:30:00', 'Rua Q, 555', 'Lucas Santos', 'Chevrolet Malibu', 22),
('2023-11-18', '13:00:00', 'Av. R, 666', 'Roberta Oliveira', 'Ford Fusion', 23),
('2023-11-18', '14:30:00', 'Rua S, 777', 'Rafael Lima', 'Toyota Camry', 24),
('2023-11-18', '16:00:00', 'Av. T, 888', 'Aline Silva', 'Honda Accord', 25),
('2023-11-19', '10:00:00', 'Rua U, 999', 'Marcos Costa', 'Volkswagen Passat', 26),
('2023-11-19', '11:30:00', 'Av. V, 1010', 'Larissa Souza', 'Nissan Maxima', 27),
('2023-11-19', '13:00:00', 'Rua W, 1111', 'Paulo Santos', 'Hyundai Sonata', 28),
('2023-11-19', '14:30:00', 'Av. X, 1212', 'Carolina Pereira', 'Mazda 626', 29),
('2023-11-19', '16:00:00', 'Rua Y, 1313', 'Vin�cius Lima', 'Subaru Legacy', 30),
('2023-11-20', '10:00:00', 'Av. Z, 1414', 'Renata Costa', 'Kia Optima', 31),
('2023-11-20', '11:30:00', 'Rua 1, 1515', 'Jos� Oliveira', 'Mercedes-Benz E-Class', 32),
('2023-11-20', '13:00:00', 'Av. 2, 1616', 'Camila Lima', 'BMW 5 Series', 33),
('2023-11-20', '14:30:00', 'Rua 3, 1717', 'Hugo Santos', 'Audi A6', 34),
('2023-11-20', '16:00:00', 'Av. 4, 1818', 'Daniela Costa', 'Lexus ES', 35);

INSERT INTO produto (nome, descri��o, c�digo, pre�o) VALUES
('Laptop UltraSlim', 'Laptop fino e leve para mobilidade m�xima', 'LU123', 1000.00),
('Smart TV 4K', 'TV inteligente com resolu��o Ultra HD', 'TV4K456', 800.00),
('Smartphone Avan�ado', 'Telefone inteligente com recursos avan�ados', 'SA789', 600.50),
('C�mera Digital Profissional', 'C�mera de alta resolu��o para fotografia profissional', 'CDP123', 1200.75),
('Forno Micro-ondas Inteligente', 'Micro-ondas com funcionalidades avan�adas', 'FMI456', 300.20),
('Impressora Multifuncional a Laser', 'Impressora que imprime, digitaliza e copia', 'IML789', 500.50),
('M�quina de Caf� Autom�tica', 'M�quina que prepara caf� automaticamente', 'MCA123', 150.30),
('Headphones Bluetooth Premium', 'Fones de ouvido sem fio de alta qualidade', 'HBP456', 250.75),
('Tablet H�brido', 'Tablet vers�til com teclado destac�vel', 'TH789', 700.00),
('Aspirador de P� Rob�', 'Aspirador de p� autom�tico controlado por aplicativo', 'APR123', 350.25),
('Drone de Alta Performance', 'Drone com c�mera de alta resolu��o e recursos avan�ados', 'DHP456', 450.50),
('Monitor Curvo Gamer', 'Monitor curvo otimizado para experi�ncia de jogo', 'MCG789', 550.25),
('Mochila Executiva Resistente � �gua', 'Mochila resistente � �gua para profissionais em movimento', 'MER123', 1100.00),
('Teclado Mec�nico RGB', 'Teclado mec�nico com ilumina��o RGB personaliz�vel', 'TMR456', 200.50),
('Console de Videogame de �ltima Gera��o', 'Console de videogame com tecnologia avan�ada', 'CVU789', 950.75),
('Caixa de Som Bluetooth Port�til', 'Caixa de som port�til com conectividade Bluetooth', 'CSB123', 650.30),
('Conjunto de Panelas Antiaderentes', 'Conjunto de panelas dur�veis e antiaderentes', 'CPA456', 400.25),
('Rel�gio Inteligente com GPS', 'Rel�gio inteligente com rastreamento GPS', 'RIG789', 500.50),
('Conjunto de Ferramentas Profissionais', 'Conjunto de ferramentas de alta qualidade para uso profissional', 'CFP123', 850.25),
('Bicicleta El�trica Dobr�vel', 'Bicicleta el�trica compacta e dobr�vel', 'BED456', 750.00),
('Purificador de Ar com Ionizador', 'Purificador de ar com tecnologia de ioniza��o', 'PAI789', 300.75),
('Kit de Maquiagem Profissional', 'Kit de maquiagem de qualidade profissional', 'KMP123', 350.20),
('Adega Climatizada para Vinhos', 'Adega para armazenamento e climatiza��o de vinhos', 'ACV456', 1200.50),
('Patins Inline de Alta Velocidade', 'Patins inline projetados para alta velocidade', 'PIH789', 800.30),
('Conjunto de Malas de Viagem', 'Conjunto de malas dur�veis para viagens', 'CMV123', 550.25),
('Kit de Churrasco em A�o Inoxid�vel', 'Kit completo de churrasco em a�o inoxid�vel', 'KCA456', 600.50),
('Sof� Modular com Sistema de Som Integrado', 'Sof� modular com sistema de som embutido', 'SMS789', 700.25),
('Monitor de Press�o Arterial Digital', 'Monitor digital para medi��o da press�o arterial', 'MPA123', 1100.00),
('Kit de Jardinagem Completo', 'Kit completo de ferramentas para jardinagem', 'KJC456', 450.50),
('�culos de Realidade Virtual', '�culos para experi�ncias imersivas de realidade virtual', 'ORV789', 1000.75);


INSERT INTO motorista (nome, cpf, cnh, telefone) VALUES
('Carlos Silva', '12345678901', 'ABC123456', '(11) 1234-5678'),
('Marta Oliveira', '23456789012', 'DEF654321', '(22) 2345-6789'),
('Pedro Santos', '34567890123', 'GHI987654', '(33) 3456-7890'),
('Beatriz Pereira', '45678901234', 'JKL321098', '(44) 4567-8901'),
('Roberto Lima', '56789012345', 'MNO987654', '(55) 5678-9012'),
('Carolina Costa', '67890123456', 'PQR123456', '(66) 6789-0123'),
('F�bio Souza', '78901234567', 'STU654321', '(77) 7890-1234'),
('L�cia Santos', '89012345678', 'VWX123456', '(88) 8901-2345'),
('Diego Oliveira', '90123456789', 'YZA654321', '(99) 9012-3456'),
('Helena Lima', '01234567890', 'BCD123456', '(10) 0123-4567'),
('Ricardo Silva', '12345678901', 'EFG654321', '(21) 1234-5678'),
('Carla Costa', '23456789012', 'HIJ987654', '(32) 2345-6789'),
('Eduardo Pereira', '34567890123', 'KLM123456', '(43) 3456-7890'),
('Sandra Souza', '45678901234', 'NOP987654', '(54) 4567-8901'),
('Gustavo Lima', '56789012345', 'QRS123456', '(65) 5678-9012'),
('Tatiane Costa', '67890123456', 'TUV987654', '(76) 6789-0123'),
('Lucas Santos', '78901234567', 'WXY123456', '(87) 7890-1234'),
('Roberta Oliveira', '89012345678', 'ZAB987654', '(98) 8901-2345'),
('Rafael Lima', '90123456789', 'CDE123456', '(09) 9012-3456'),
('Aline Silva', '01234567890', 'FGH987654', '(20) 0123-4567'),
('Marcos Costa', '12345678901', 'IJK123456', '(31) 1234-5678'),
('Larissa Souza', '23456789012', 'LMN987654', '(42) 2345-6789'),
('Paulo Santos', '34567890123', 'OPQ123456', '(53) 3456-7890'),
('Carolina Pereira', '45678901234', 'RST987654', '(64) 4567-8901'),
('Vin�cius Lima', '56789012345', 'UVW123456', '(75) 5678-9012'),
('Renata Costa', '67890123456', 'XYZ987654', '(86) 6789-0123'),
('Jos� Oliveira', '78901234567', 'ABC123456', '(97) 7890-1234'),
('Camila Lima', '89012345678', 'DEF654321', '(08) 8901-2345'),
('Hugo Santos', '90123456789', 'GHI987654', '(19) 9012-3456'),
('Daniela Costa', '01234567890', 'JKL123456', '(20) 0123-4567');

INSERT INTO ve�culo (marca, modelo, placa, ano) VALUES
('Chevrolet', 'Cruze', 'ABC1234', 2022),
('Ford', 'Focus', 'DEF5678', 2021),
('Toyota', 'Corolla', 'GHI9012', 2020),
('Honda', 'Civic', 'JKL3456', 2019),
('Volkswagen', 'Golf', 'MNO7890', 2018),
('Nissan', 'Altima', 'PQR1234', 2017),
('Hyundai', 'Elantra', 'STU5678', 2016),
('Mazda', 'Mazda3', 'VWX9012', 2015),
('Subaru', 'Impreza', 'YZA3456', 2014),
('Kia', 'Forte', 'BCD7890', 2013),
('Mercedes-Benz', 'C-Class', 'EFG1234', 2012),
('BMW', '3 Series', 'HIJ5678', 2011),
('Audi', 'A4', 'KLM9012', 2010),
('Lexus', 'IS', 'NOP3456', 2009),
('Chrysler', '200', 'QRS7890', 2008),
('Jeep', 'Compass', 'TUV1234', 2007),
('Chevrolet', 'Malibu', 'WXY5678', 2006),
('Ford', 'Fusion', 'ZAB9012', 2005),
('Toyota', 'Camry', 'CDE3456', 2004),
('Honda', 'Accord', 'FGH7890', 2003),
('Volkswagen', 'Passat', 'IJK1234', 2002),
('Nissan', 'Maxima', 'LMN5678', 2001),
('Hyundai', 'Sonata', 'OPQ9012', 2000),
('Mazda', '626', 'RST3456', 1999),
('Subaru', 'Legacy', 'UVW7890', 1998),
('Kia', 'Optima', 'XYZ1234', 1997),
('Mercedes-Benz', 'E-Class', 'ABC5678', 1996),
('BMW', '5 Series', 'DEF9012', 1995),
('Audi', 'A6', 'GHI3456', 1994),
('Lexus', 'ES', 'JKL7890', 1993);

-- Inserindo dados na tabela produto
INSERT INTO produto (nome, descri��o, c�digo, pre�o) VALUES ('C�mera de A��o 4K', 'C�mera compacta para capturar aventuras em alta resolu��o', 'CA4K789', 299.99);
INSERT INTO produto (nome, descri��o, c�digo, pre�o) VALUES ('Smartwatch Fitness', 'Rel�gio inteligente com recursos de monitoramento de sa�de e fitness', 'SWF123', 129.50);

-- Inserindo dados na tabela cliente
INSERT INTO cliente (nome, endere�o, telefone, email) VALUES ('Filipe Oliveira', 'Rua X, 789', '(33) 3456-7890', 'filipe.oliveira@email.com');
INSERT INTO cliente (nome, endere�o, telefone, email) VALUES ('Frederico Rocha', 'Av. Y, 456', '(44) 4567-8901', 'frederico.rocha@email.com');


-- Inserindo dados na tabela pedido
INSERT INTO pedido (data, produto, quantidade, valor, status, id_cliente) VALUES ('2023-11-15', 'C�mera de A��o 4K', 2, 299.99, 'Em andamento', 1);
INSERT INTO pedido (data, produto, quantidade, valor, status, id_cliente) VALUES ('2023-11-15', 'Smartwatch Fitness', 3, 129.50, 'Conclu�do', 2);

-- Inserindo dados na tabela entrega
INSERT INTO entrega (data, hora, local, motorista, ve�culo, id_pedido) VALUES ('2023-12-01', '10:00:00', 'Rua X, 789', 'Gabreil Ara�jo', 'Sandero', 6);
INSERT INTO entrega (data, hora, local, motorista, ve�culo, id_pedido) VALUES ('2023-12-05', '11:30:00', 'Av. Y, 456', 'Mario Cesar', 'Astra', 7);

-- Consultando dados na tabela cliente
SELECT * FROM cliente;

-- Consultando dados na tabela pedido
SELECT * FROM pedido;

-- Consultando dados na tabela produto
SELECT * FROM produto;

-- Consultando dados na tabela entrega
SELECT * FROM entrega;

-- Consultando dados na tabela motorista
SELECT * FROM motorista;

-- Consultando dados na tabela ve�culo
SELECT * FROM ve�culo

-- Atualizando dados na tabela produto
UPDATE produto SET pre�o = 120.00 WHERE id_produto = 1;

-- Atualizando dados na tabela cliente
UPDATE cliente SET telefone = '(11) 9876-5432' WHERE id_cliente = 1;


-- Atualizando dados na tabela entrega
UPDATE entrega SET local = 'Rua Antonio pedro da silva' WHERE id_entrega = 15;

-- Excluindo dados na tabela produto
DELETE FROM produto WHERE id_produto = 2;

-- Excluindo dados na tabela pedido
DELETE FROM pedido WHERE id_pedido = 2;

-- Excluindo dados na tabela entrega
DELETE FROM entrega WHERE id_entrega = 2;

-- Listando todos os produtos com o pre�o
SELECT nome, pre�o FROM produto;

-- Listando os pedidos e seu status para um cliente espec�fico
SELECT id_pedido, data, status
FROM pedido
WHERE id_cliente = 30;

-- Exibindo detalhes de uma entrega, incluindo informa��es do pedido associado:
SELECT e.id_entrega, e.data, e.local, e.motorista, e.ve�culo, p.produto, p.quantidade
FROM entrega e
JOIN pedido p ON e.id_pedido = p.id_pedido
WHERE e.id_entrega = 25; 

-- Exibir os produtos mais caros, juntamente com seus clientes associados
SELECT c.nome AS cliente, p.nome AS produto, p.pre�o
FROM cliente c
JOIN pedido pd ON c.id_cliente = pd.id_cliente
JOIN produto p ON pd.produto = p.nome
ORDER BY p.pre�o DESC;

-- Listar os pedidos com produtos que custam mais de 500 reais, ordenados pelo valor total do pedido:
SELECT pd.id_pedido, pd.data, pd.status, SUM(p.pre�o * pd.quantidade) AS valor_total
FROM pedido pd
JOIN produto p ON pd.produto = p.nome
WHERE p.pre�o > 500
GROUP BY pd.id_pedido, pd.data, pd.status
ORDER BY valor_total DESC;

--Listando os clientes e a quantidade de pedidos que cada um fez, ordenados pelo n�mero de pedidos (do maior para o menor):
SELECT c.nome, COUNT(p.id_pedido) AS num_pedidos
FROM cliente c
LEFT JOIN pedido p ON c.id_cliente = p.id_cliente
GROUP BY c.nome
ORDER BY num_pedidos DESC;

-- Listar os produtos mais vendidos, ordenados pela quantidade total vendida (do maior para o menor)

SELECT p.nome, SUM(pd.quantidade) AS total_vendido
FROM produto p
JOIN pedido pd ON p.nome = pd.produto
GROUP BY p.nome
ORDER BY total_vendido DESC;

--Listar os pedidos entregues de um cliente espec�fico, ordenados pelo valor total do pedido (do maior para o menor):

SELECT pd.id_pedido, pd.data, pd.status, SUM(p.pre�o * pd.quantidade) AS valor_total
FROM pedido pd
JOIN produto p ON pd.produto = p.nome
WHERE pd.id_cliente =10AND pd.status = 'Entregue'
GROUP BY pd.id_pedido, pd.data, pd.status
ORDER BY valor_total DESC;

--Exibir os produtos com pre�o acima da m�dia, ordenados pelo pre�o em ordem decrescente:

SELECT nome, pre�o
FROM produto
WHERE pre�o > (SELECT AVG(pre�o) FROM produto)
ORDER BY pre�o DESC;

--Listar os clientes que n�o realizaram nenhum pedido, ordenados pelo nome do cliente

SELECT c.nome
FROM cliente c
LEFT JOIN pedido p ON c.id_cliente = p.id_cliente
WHERE p.id_pedido IS NULL
ORDER BY c.nome;