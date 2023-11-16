# Exercícios de Modelagem de Banco de dados

## Para quem se interessar pelo assunto, recomendo está leitura:
:mag_right: -> [Livro Projeto de Banco de Dados](https://www.cin.ufpe.br/~jrsl/Books/Projeto%20de%20Banco%20de%20Dados%20-%20C.%20A.%20Heuser.pdf)

## Começando....



:memo:Dos [diversos](https://pt.wikipedia.org/wiki/Lista_de_bancos_de_dados) banco de dados relacionais que existem.
Neste projeto foi utilizado o SQL Server Management Studio, pois é bem [popular](https://db-engines.com/en/ranking)

Durante os exemplos utilizei o SQL Server [Microsoft](https://learn.microsoft.com/pt-br/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16) devido a sua facil instalação (Next/Next/Finish)


Caso você esteja com **zero** vontade de baixar toda essa caralhada de coisas e configurar.   
Você pode simplesmente usar um site como esses:  
https://sqliteonline.com/ ou https://onecompiler.com/

## Explicação de como criar um Banco, Tabela

SQL
Maneira simplista...  
-> O Banco armazena tabelas   
-> Tabelas armazena Registros. 

Então pela lógica, armazenar registros (nome, email, telefone, data de nascimento, etc precisamos de um banco...)

o SQL-Statment é:  
```sql
CREATE DATABASE nome_do_banco
```

Vamos criar o banco 'exemplo'... com o nome de `exemplo` (Inception Feelings)
```sql
CREATE DATABASE exemplo;
```

E criar uma tabela chamada `produto` que contem um número indentificador (id) e nome do produto (nome).
```sql
USE exemplo;
CREATE TABLE produto (
  id_produto INT IDENTITY(1,1) NOT NULL, -- Quando for MySQL usar AUTO_INCREMENT no lugar do IDENTITY
  nome VARCHAR(255) NOT NULL,
);
```
OUWWWWW! É coisa pra caramba nova aqui hehe.

Basicamente informamos que a tabela produto tem dois campos **(id, nome)**  
E cada um desses campos possui um data_type/tipo primitivo (INT/DOUBLE/CHAR/VARCHAR).   

No caso o tipo/data_type da coluna **id** é um INT (inteiro)    
  - ->Uma CONSTRAINT de **PRIMARY KEY** :key:.    
  - ->PRIMARY KEY significa que é uma chave única (impossivel de ter 2x o mesmo número) e automaticamente obrigatório (NOT NULL).

Leia mais:   
https://pt.wikipedia.org/wiki/Chave_prim%C3%A1ria  

NOT NULL é exatamentea tradução.... :exclamation:NÃO PODE SER NULO AQUI:exclamation:

Já no caso do **nome** temos VARCHAR(50), que recebe um texto até 50 caracteres (caso exceda, ele ignora o restante)

Entenda mais sobre INT,VARCHAR, CHAR, TEXT, DATE, DATETIME  
http://www.rcoli.com.br/2012/08/tipos-de-campos-no-mysql-saiba-como-escolher-o-tipo-correto/  


Mais informação a respeito do CREATE aqui:  
https://dev.mysql.com/doc/refman/5.7/en/create-table.html  

------------------------------------------
Então vamos para o nosso projeto:

## Cenário:

- -> Você foi contrato por uma empresa de logística, onde será necessário um sistema para gerenciar seus clientes, pedidos e entregas. O sistema deve permitir que os usuários façam o seguinte:
- Cadastrar clientes: o cadastro dos clientes deve conter, código de identificação, nome, endereço, telefone, e-mail, CPF ou CNPJ;
- Cadastro de produtos: cada produto deve ser registrado no sistema com as seguintes informações, nome, descrição, código de identificação, preço
- Criar pedidos: ao criar pedidos o sistema deve permitir que seja incluso, código de identificação data, produto, quantidade, valor, status;
- Acompanhar entrega: o acompanhamento das entregas deve conter: código de identificação, data, hora, local, motorista, veículo;
- Registro do motorista responsável pela entrega: os motoristas que iram realizar as entregas deveram ser registrados no sistema com as seguintes informações, nome, código de identificação, CPF, CNH, telefone; veículo, marca, modelo e ano.
- Registro de veículos: assim como os motoristas os veículos para entrega deveram ser registrados no sistema, com as informações: Código de identificação, Marca, modelo, placa, ano.

 Agora com este cenário vamos fazer a modelagem conceitual.
 # Modelagem conceitual:
 ![image](https://github.com/Sheila724/Banco-de-Dados/assets/135647046/4a31de9e-be19-49ee-976f-82ce7cd7a255)

Na modelagem conceitual, usamos um fluxograma pois é uma técnica visual que representa de forma clara e simplificada os conceitos e processos de um sistema ou ideia. 

Show, agora vamos fazer a modelagem lógica:

 # Modelagem lógica:
 ![image](https://github.com/Sheila724/Banco-de-Dados/assets/135647046/b984b20c-2ee8-4ed0-a858-4e99c4b6de79)

A modelagem de banco de dados lógica é crucial para criar uma representação precisa e eficiente dos dados que serão armazenados e manipulados pelo sistema. Ela serve como base para a implementação física do banco de dados.

Bora criar as tabelas e colocar alguns dados, afinal... Talk is cheap, show me the code....

# Tabelas:
```sql
CREATE TABLE cliente (
  id_cliente INT IDENTITY(1,1) NOT NULL,
  nome VARCHAR(255) NOT NULL,
  endereço VARCHAR(255) NOT NULL,
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
  veículo VARCHAR(255) NOT NULL,
  id_pedido INT NOT NULL,
  PRIMARY KEY (id_entrega),
  FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido)
);

CREATE TABLE produto (
  id_produto INT IDENTITY(1,1) NOT NULL,
  nome VARCHAR(255) NOT NULL,
  descrição VARCHAR(255) NOT NULL,
  código VARCHAR(255) NOT NULL,
  preço FLOAT NOT NULL,
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

CREATE TABLE veículo (
  id_veículo INT IDENTITY(1,1) NOT NULL,
  marca VARCHAR(255) NOT NULL,
  modelo VARCHAR(255) NOT NULL,
  placa VARCHAR(7) NOT NULL,
  ano INT NOT NULL,
  PRIMARY KEY (id_veículo)
);
```
Depois de criar as tabelas vamos colocar alguns dados...
# Dados:
```sql
INSERT INTO cliente (nome, endereço, telefone, email) VALUES
('João Silva', 'Rua A, 123', '(11) 1234-5678', 'joao.silva@email.com'),
('Maria Oliveira', 'Av. B, 456', '(22) 2345-6789', 'maria.oliveira@email.com'),
('Carlos Santos', 'Rua C, 789', '(33) 3456-7890', 'carlos.santos@email.com'),
('Ana Pereira', 'Av. D, 101', '(44) 4567-8901', 'ana.pereira@email.com'),
('Rodrigo Lima', 'Rua E, 202', '(55) 5678-9012', 'rodrigo.lima@email.com'),
('Juliana Costa', 'Av. F, 303', '(66) 6789-0123', 'juliana.costa@email.com'),
('Fernando Souza', 'Rua G, 404', '(77) 7890-1234', 'fernando.souza@email.com'),
('Mariana Santos', 'Av. H, 505', '(88) 8901-2345', 'mariana.santos@email.com'),
('Ricardo Oliveira', 'Rua I, 606', '(99) 9012-3456', 'ricardo.oliveira@email.com'),
('Patrícia Lima', 'Av. J, 707', '(10) 0123-4567', 'patricia.lima@email.com'),
('Luiz Silva', 'Rua K, 808', '(21) 1234-5678', 'luiz.silva@email.com'),
('Cristina Costa', 'Av. L, 909', '(32) 2345-6789', 'cristina.costa@email.com'),
('Eduardo Pereira', 'Rua M, 111', '(43) 3456-7890', 'eduardo.pereira@email.com'),
('Fátima Souza', 'Av. N, 222', '(54) 4567-8901', 'fatima.souza@email.com'),
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
('Vinícius Lima', 'Rua Y, 1313', '(75) 5678-9012', 'vinicius.lima@email.com'),
('Renata Costa', 'Av. Z, 1414', '(86) 6789-0123', 'renata.costa@email.com'),
('José Oliveira', 'Rua 1, 1515', '(97) 7890-1234', 'jose.oliveira@email.com'),
('Camila Lima', 'Av. 2, 1616', '(08) 8901-2345', 'camila.lima@email.com'),
('Hugo Santos', 'Rua 3, 1717', '(19) 9012-3456', 'hugo.santos@email.com'),
('Daniela Costa', 'Av. 4, 1818', '(20) 0123-4567', 'daniela.costa@email.com');

INSERT INTO pedido (data, produto, quantidade, valor, status, id_cliente) VALUES
('2023-11-29', 'Laptop UltraSlim', 5, 1000.00, 'Em processamento', 1),
('2023-11-29', 'Smart TV 4K', 3, 800.00, 'Em processamento', 2),
('2023-11-29', 'Smartphone Avançado', 2, 600.50, 'Aguardando pagamento', 3),
('2023-11-28', 'Câmera Digital Profissional', 1, 1200.75, 'Enviado', 4),
('2023-11-28', 'Forno Micro-ondas Inteligente', 4, 300.20, 'Entregue', 5),
('2023-11-25', 'Impressora Multifuncional a Laser', 2, 500.50, 'Em processamento', 6),
('2023-11-25', 'Máquina de Café Automática', 3, 150.30, 'Em processamento', 7),
('2023-11-27', 'Headphones Bluetooth Premium', 1, 250.75, 'Aguardando pagamento', 8),
('2023-11-27', 'Tablet Híbrido', 6, 700.00, 'Enviado', 9),
('2023-11-27', 'Aspirador de Pó Robô', 2, 350.25, 'Entregue', 10),
('2023-11-29', 'Drone de Alta Performance', 4, 450.50, 'Em processamento', 11),
('2023-11-30', 'Monitor Curvo Gamer', 3, 550.25, 'Em processamento', 12),
('2023-11-30', 'Mochila Executiva Resistente à Água', 1, 1100.00, 'Aguardando pagamento', 13),
('2023-11-10', 'Teclado Mecânico RGB', 5, 200.50, 'Enviado', 14),
('2023-11-10', 'Console de Videogame de Última Geração', 2, 950.75, 'Entregue', 15),
('2023-11-10', 'Caixa de Som Bluetooth Portátil', 3, 650.30, 'Em processamento', 16),
('2023-11-10', 'Conjunto de Panelas Antiaderentes', 1, 400.25, 'Em processamento', 17),
('2023-11-17', 'Relógio Inteligente com GPS', 4, 500.50, 'Aguardando pagamento', 18),
('2023-11-17', 'Conjunto de Ferramentas Profissionais', 2, 850.25, 'Enviado', 19),
('2023-11-17', 'Bicicleta Elétrica Dobrável', 3, 750.00, 'Entregue', 20),
('2023-11-15', 'Purificador de Ar com Ionizador', 1, 300.75, 'Em processamento', 21),
('2023-11-15', 'Kit de Maquiagem Profissional', 5, 350.20, 'Aguardando pagamento', 22),
('2023-11-15', 'Adega Climatizada para Vinhos', 2, 1200.50, 'Enviado', 23),
('2023-11-15', 'Patins Inline de Alta Velocidade', 3, 800.30, 'Entregue', 24),
('2023-11-05', 'Conjunto de Malas de Viagem', 1, 550.25, 'Em processamento', 25),
('2023-11-04', 'Kit de Churrasco em Aço Inoxidável', 4, 600.50, 'Em processamento', 26),
('2023-11-03', 'Sofá Modular com Sistema de Som Integrado', 2, 700.25, 'Aguardando pagamento', 27),
('2023-11-02', 'Monitor de Pressão Arterial Digital', 3, 1100.00, 'Enviado', 28),
('2023-11-01', 'Kit de Jardinagem Completo', 1, 450.50, 'Entregue', 29),
('2023-11-07', 'Óculos de Realidade Virtual', 5, 1000.75, 'Em processamento', 30);

INSERT INTO entrega (data, hora, local, motorista, veículo, id_pedido) VALUES
('2023-11-15', '10:00:00', 'Rua A, 123', 'Carlos Silva', 'Chevrolet Cruze', 6),
('2023-11-15', '11:30:00', 'Av. B, 456', 'Marta Oliveira', 'Ford Focus', 7),
('2023-11-15', '13:00:00', 'Rua C, 789', 'Pedro Santos', 'Toyota Corolla', 8),
('2023-11-15', '14:30:00', 'Av. D, 101', 'Beatriz Pereira', 'Honda Civic', 9),
('2023-11-15', '16:00:00', 'Rua E, 202', 'Roberto Lima', 'Volkswagen Golf', 10),
('2023-11-16', '10:00:00', 'Av. F, 303', 'Carolina Costa', 'Nissan Altima', 11),
('2023-11-16', '11:30:00', 'Rua G, 404', 'Fábio Souza', 'Hyundai Elantra', 12),
('2023-11-16', '13:00:00', 'Av. H, 505', 'Lúcia Santos', 'Mazda Mazda3', 13),
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
('2023-11-19', '16:00:00', 'Rua Y, 1313', 'Vinícius Lima', 'Subaru Legacy', 30),
('2023-11-20', '10:00:00', 'Av. Z, 1414', 'Renata Costa', 'Kia Optima', 31),
('2023-11-20', '11:30:00', 'Rua 1, 1515', 'José Oliveira', 'Mercedes-Benz E-Class', 32),
('2023-11-20', '13:00:00', 'Av. 2, 1616', 'Camila Lima', 'BMW 5 Series', 33),
('2023-11-20', '14:30:00', 'Rua 3, 1717', 'Hugo Santos', 'Audi A6', 34),
('2023-11-20', '16:00:00', 'Av. 4, 1818', 'Daniela Costa', 'Lexus ES', 35);

INSERT INTO produto (nome, descrição, código, preço) VALUES
('Laptop UltraSlim', 'Laptop fino e leve para mobilidade máxima', 'LU123', 1000.00),
('Smart TV 4K', 'TV inteligente com resolução Ultra HD', 'TV4K456', 800.00),
('Smartphone Avançado', 'Telefone inteligente com recursos avançados', 'SA789', 600.50),
('Câmera Digital Profissional', 'Câmera de alta resolução para fotografia profissional', 'CDP123', 1200.75),
('Forno Micro-ondas Inteligente', 'Micro-ondas com funcionalidades avançadas', 'FMI456', 300.20),
('Impressora Multifuncional a Laser', 'Impressora que imprime, digitaliza e copia', 'IML789', 500.50),
('Máquina de Café Automática', 'Máquina que prepara café automaticamente', 'MCA123', 150.30),
('Headphones Bluetooth Premium', 'Fones de ouvido sem fio de alta qualidade', 'HBP456', 250.75),
('Tablet Híbrido', 'Tablet versátil com teclado destacável', 'TH789', 700.00),
('Aspirador de Pó Robô', 'Aspirador de pó automático controlado por aplicativo', 'APR123', 350.25),
('Drone de Alta Performance', 'Drone com câmera de alta resolução e recursos avançados', 'DHP456', 450.50),
('Monitor Curvo Gamer', 'Monitor curvo otimizado para experiência de jogo', 'MCG789', 550.25),
('Mochila Executiva Resistente à Água', 'Mochila resistente à água para profissionais em movimento', 'MER123', 1100.00),
('Teclado Mecânico RGB', 'Teclado mecânico com iluminação RGB personalizável', 'TMR456', 200.50),
('Console de Videogame de Última Geração', 'Console de videogame com tecnologia avançada', 'CVU789', 950.75),
('Caixa de Som Bluetooth Portátil', 'Caixa de som portátil com conectividade Bluetooth', 'CSB123', 650.30),
('Conjunto de Panelas Antiaderentes', 'Conjunto de panelas duráveis e antiaderentes', 'CPA456', 400.25),
('Relógio Inteligente com GPS', 'Relógio inteligente com rastreamento GPS', 'RIG789', 500.50),
('Conjunto de Ferramentas Profissionais', 'Conjunto de ferramentas de alta qualidade para uso profissional', 'CFP123', 850.25),
('Bicicleta Elétrica Dobrável', 'Bicicleta elétrica compacta e dobrável', 'BED456', 750.00),
('Purificador de Ar com Ionizador', 'Purificador de ar com tecnologia de ionização', 'PAI789', 300.75),
('Kit de Maquiagem Profissional', 'Kit de maquiagem de qualidade profissional', 'KMP123', 350.20),
('Adega Climatizada para Vinhos', 'Adega para armazenamento e climatização de vinhos', 'ACV456', 1200.50),
('Patins Inline de Alta Velocidade', 'Patins inline projetados para alta velocidade', 'PIH789', 800.30),
('Conjunto de Malas de Viagem', 'Conjunto de malas duráveis para viagens', 'CMV123', 550.25),
('Kit de Churrasco em Aço Inoxidável', 'Kit completo de churrasco em aço inoxidável', 'KCA456', 600.50),
('Sofá Modular com Sistema de Som Integrado', 'Sofá modular com sistema de som embutido', 'SMS789', 700.25),
('Monitor de Pressão Arterial Digital', 'Monitor digital para medição da pressão arterial', 'MPA123', 1100.00),
('Kit de Jardinagem Completo', 'Kit completo de ferramentas para jardinagem', 'KJC456', 450.50),
('Óculos de Realidade Virtual', 'Óculos para experiências imersivas de realidade virtual', 'ORV789', 1000.75);

INSERT INTO motorista (nome, cpf, cnh, telefone) VALUES
('Carlos Silva', '12345678901', 'ABC123456', '(11) 1234-5678'),
('Marta Oliveira', '23456789012', 'DEF654321', '(22) 2345-6789'),
('Pedro Santos', '34567890123', 'GHI987654', '(33) 3456-7890'),
('Beatriz Pereira', '45678901234', 'JKL321098', '(44) 4567-8901'),
('Roberto Lima', '56789012345', 'MNO987654', '(55) 5678-9012'),
('Carolina Costa', '67890123456', 'PQR123456', '(66) 6789-0123'),
('Fábio Souza', '78901234567', 'STU654321', '(77) 7890-1234'),
('Lúcia Santos', '89012345678', 'VWX123456', '(88) 8901-2345'),
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
('Vinícius Lima', '56789012345', 'UVW123456', '(75) 5678-9012'),
('Renata Costa', '67890123456', 'XYZ987654', '(86) 6789-0123'),
('José Oliveira', '78901234567', 'ABC123456', '(97) 7890-1234'),
('Camila Lima', '89012345678', 'DEF654321', '(08) 8901-2345'),
('Hugo Santos', '90123456789', 'GHI987654', '(19) 9012-3456'),
('Daniela Costa', '01234567890', 'JKL123456', '(20) 0123-4567');

INSERT INTO veículo (marca, modelo, placa, ano) VALUES
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
```
A inserção de dados em tabelas de banco de dados é uma operação fundamental que permite adicionar novos registros à base de dados.

# Crud:

O CRUD é um acrônimo que representa as quatro operações básicas realizadas em bancos de dados relacionais: Create (Criação), Read (Leitura), Update (Atualização) e Delete (Exclusão). Essas operações são fundamentais para interagir com dados armazenados em um banco de dados.
```sql
INSERT INTO produto (nome, descrição, código, preço) VALUES ('Câmera de Ação 4K', 'Câmera compacta para capturar aventuras em alta resolução', 'CA4K789', 299.99); -- Inserindo dados na tabela produto
INSERT INTO produto (nome, descrição, código, preço) VALUES ('Smartwatch Fitness', 'Relógio inteligente com recursos de monitoramento de saúde e fitness', 'SWF123', 129.50); -- Inserindo dados na tabela produto
```
![image](https://github.com/Sheila724/Banco-de-Dados/assets/135647046/c94c3dae-4452-4d7d-be60-48f3e48187f9)
```sql
INSERT INTO cliente (nome, endereço, telefone, email) VALUES ('Filipe Oliveira', 'Rua X, 789', '(33) 3456-7890', 'filipe.oliveira@email.com'); -- Inserindo dados na tabela cliente
INSERT INTO cliente (nome, endereço, telefone, email) VALUES ('Frederico Rocha', 'Av. Y, 456', '(44) 4567-8901', 'frederico.rocha@email.com'); -- Inserindo dados na tabela cliente
```
![image](https://github.com/Sheila724/Banco-de-Dados/assets/135647046/cbfc9552-8506-4548-a146-d19f0232616a)
```sql
INSERT INTO pedido (data, produto, quantidade, valor, status, id_cliente) VALUES ('2023-11-15', 'Câmera de Ação 4K', 2, 299.99, 'Em andamento', 1); -- Inserindo dados na tabela pedido
INSERT INTO pedido (data, produto, quantidade, valor, status, id_cliente) VALUES ('2023-11-15', 'Smartwatch Fitness', 3, 129.50, 'Concluído', 2); -- Inserindo dados na tabela pedido
```
![image](https://github.com/Sheila724/Banco-de-Dados/assets/135647046/dc0e0d3e-0b7a-4e38-8243-52e98903a1f1)
```sql
INSERT INTO entrega (data, hora, local, motorista, veículo, id_pedido) VALUES ('2023-12-01', '10:00:00', 'Rua X, 789', 'Gabreil Araújo', 'Sandero', 6); -- Inserindo dados na tabela entrega
INSERT INTO entrega (data, hora, local, motorista, veículo, id_pedido) VALUES ('2023-12-05', '11:30:00', 'Av. Y, 456', 'Mario Cesar', 'Astra', 7); -- Inserindo dados na tabela entrega
```
![image](https://github.com/Sheila724/Banco-de-Dados/assets/135647046/e10fc834-8f46-46a8-8195-af3364982156)
```sql
SELECT * FROM cliente; -- Consultando dados na tabela cliente
```
![image](https://github.com/Sheila724/Banco-de-Dados/assets/135647046/f2192b0e-3ace-436e-99fc-c8604bc16659)
```sql
SELECT * FROM pedido; -- Consultando dados na tabela pedido
```
![image](https://github.com/Sheila724/Banco-de-Dados/assets/135647046/a459556c-7080-4721-bc53-a1254c6558c6)
```sql
SELECT * FROM produto; -- Consultando dados na tabela produto
```
![image](https://github.com/Sheila724/Banco-de-Dados/assets/135647046/78df514d-a5f1-4af9-b951-987463616992)

```sql
SELECT * FROM entrega; -- Consultando dados na tabela entrega
```
![image](https://github.com/Sheila724/Banco-de-Dados/assets/135647046/febecc48-ba30-4656-918c-4ce7c207c262)

```sql
SELECT * FROM motorista; -- Consultando dados na tabela motorista
```
![image](https://github.com/Sheila724/Banco-de-Dados/assets/135647046/2939bab9-6c8c-480e-bb00-5e89d306e4e3)

```sql
SELECT * FROM veículo; -- Consultando dados na tabela veículo
```
![image](https://github.com/Sheila724/Banco-de-Dados/assets/135647046/c62bd55b-0ecf-4722-8e45-cc0c897c17db)

```sql
UPDATE produto SET preço = 120.00 WHERE id_produto = 1; -- Atualizando dados na tabela produto
```
![image](https://github.com/Sheila724/Banco-de-Dados/assets/135647046/0f8ed37a-440d-4b1f-b457-cd9ea20fe5ef)
```sql
UPDATE cliente SET telefone = '(11) 9876-5432' WHERE id_cliente = 1; -- Atualizando dados na tabela cliente
```
![image](https://github.com/Sheila724/Banco-de-Dados/assets/135647046/12e57c93-8089-4c9d-be39-0a22ce61d25f)

```sql
UPDATE entrega SET local = 'Rua Antonio pedro da silva' WHERE id_entrega = 15; -- Atualizando dados na tabela entrega
```
![image](https://github.com/Sheila724/Banco-de-Dados/assets/135647046/3e569898-61cb-4742-9632-d8873b4472f8)

```sql
DELETE FROM produto WHERE id_produto = 2; -- Excluindo dados na tabela produto
```
![image](https://github.com/Sheila724/Banco-de-Dados/assets/135647046/e52fe0c7-0a0c-4265-a0aa-605d16b9c697)
```sql
DELETE FROM pedido WHERE id_pedido = 2; -- Excluindo dados na tabela pedido
```
![image](https://github.com/Sheila724/Banco-de-Dados/assets/135647046/c84c56ee-c466-4424-a903-bceefd33f781)
```sql
DELETE FROM entrega WHERE id_entrega = 2; -- Excluindo dados na tabela entrega
```
![image](https://github.com/Sheila724/Banco-de-Dados/assets/135647046/a499954c-3994-4f06-94c6-0034ea3b358d)

Agora para finalizar vou acrescentar algumas seleções e filtros para exibir alguns dados do Banco de Dados que foi criado.

# Relatórios:
```sql
SELECT nome, preço FROM produto; -- Listando todos os produtos com o preço
```
![image](https://github.com/Sheila724/Banco-de-Dados/assets/135647046/a2ffad40-a3e6-4083-a21d-ae17c2e45f65)

```sql
SELECT id_pedido, data, status
FROM pedido
WHERE id_cliente = 30; -- Listando os pedidos e seu status para um cliente específico
```
![image](https://github.com/Sheila724/Banco-de-Dados/assets/135647046/91f4282f-9c8d-407d-89d6-c39c16342529)
```sql
SELECT e.id_entrega, e.data, e.local, e.motorista, e.veículo, p.produto, p.quantidade
FROM entrega e
JOIN pedido p ON e.id_pedido = p.id_pedido
WHERE e.id_entrega = 25; -- Exibindo detalhes de uma entrega, incluindo informações do pedido associado
```
![image](https://github.com/Sheila724/Banco-de-Dados/assets/135647046/f9beac66-bd73-4127-9016-a33aaed3688d)
```sql
SELECT c.nome AS cliente, p.nome AS produto, p.preço
FROM cliente c
JOIN pedido pd ON c.id_cliente = pd.id_cliente
JOIN produto p ON pd.produto = p.nome
ORDER BY p.preço DESC; -- Exibir os produtos mais caros, juntamente com seus clientes associados
```
![image](https://github.com/Sheila724/Banco-de-Dados/assets/135647046/4b0122aa-9f2f-47e2-949d-bc5b7364e067)
```sql
SELECT pd.id_pedido, pd.data, pd.status, SUM(p.preço * pd.quantidade) AS valor_total
FROM pedido pd
JOIN produto p ON pd.produto = p.nome
WHERE p.preço > 500
GROUP BY pd.id_pedido, pd.data, pd.status
ORDER BY valor_total DESC; -- Listar os pedidos com produtos que custam mais de 500 reais, ordenados pelo valor total do pedido
```
![image](https://github.com/Sheila724/Banco-de-Dados/assets/135647046/a8bbd618-f77c-4543-b382-c38396af185f)
```sql
SELECT c.nome, COUNT(p.id_pedido) AS num_pedidos
FROM cliente c
LEFT JOIN pedido p ON c.id_cliente = p.id_cliente
GROUP BY c.nome
ORDER BY num_pedidos DESC; --Listando os clientes e a quantidade de pedidos que cada um fez, ordenados pelo número de pedidos (do maior para o menor)
```
![image](https://github.com/Sheila724/Banco-de-Dados/assets/135647046/4ef3f0b0-93b6-418b-87d7-24a19196683a)
```sql
SELECT c.nome, COUNT(p.id_pedido) AS num_pedidos
FROM cliente c
LEFT JOIN pedido p ON c.id_cliente = p.id_cliente
GROUP BY c.nome
ORDER BY num_pedidos DESC; --Listando os clientes e a quantidade de pedidos que cada um fez, ordenados pelo número de pedidos (do maior para o menor)
```
![image](https://github.com/Sheila724/Banco-de-Dados/assets/135647046/aab8a5c9-2f58-4b76-b0fb-c71a9dde405a)
```sql
SELECT pd.id_pedido, pd.data, pd.status, SUM(p.preço * pd.quantidade) AS valor_total
FROM pedido pd
JOIN produto p ON pd.produto = p.nome
WHERE pd.id_cliente =10AND pd.status = 'Entregue'
GROUP BY pd.id_pedido, pd.data, pd.status
ORDER BY valor_total DESC; --Listar os pedidos entregues de um cliente específico, ordenados pelo valor total do pedido (do maior para o menor)
```
![image](https://github.com/Sheila724/Banco-de-Dados/assets/135647046/ccfdfaac-ef83-448f-9bef-14f2ea348b79)
```sql
SELECT nome, preço
FROM produto
WHERE preço > (SELECT AVG(preço) FROM produto)
ORDER BY preço DESC; --Exibir os produtos com preço acima da média, ordenados pelo preço em ordem decrescente
```
![image](https://github.com/Sheila724/Banco-de-Dados/assets/135647046/19f8f6bc-d44c-4dcf-87fc-aca2ea59c5c1)
```sql
SELECT c.nome
FROM cliente c
LEFT JOIN pedido p ON c.id_cliente = p.id_cliente
WHERE p.id_pedido IS NULL
ORDER BY c.nome; --Listar os clientes que não realizaram nenhum pedido, ordenados pelo nome do cliente
```
![image](https://github.com/Sheila724/Banco-de-Dados/assets/135647046/dff7dcf8-495f-4e05-ac0b-230bc9b738aa)

Bom este foi o um pequeno projeto de uma modelagem de Dados completa!!
