create database bd_tde3;

-- Tabelas de cima
create table cliente (
    cpf varchar(11) primary key,
    nome_completo varchar(255) not null,
    rg varchar(10) not null unique,
    data_nascimento date not null,
    telefone varchar(15) not null,
    email varchar(255) not null,
    cnh_fk varchar(11),
    id_endereco int,
    foreign key (cnh_fk) references cnh (numero_cnh),
    foreign key (id_endereco) references endereco (id)   
);

INSERT INTO cliente(cpf, nome_completo, rg, data_nascimento, telefone, email, cnh_fk, id_endereco) VALUES
(96177498310, 'Mario Gustavo Thiago Oliveira', '283257295', '1986-07-07', '88995013322', 'mario_gustavo_olive@email.com', 88533584470, 1),
(81727845382, 'Matheus Fernando Aparicio', '329798674', '2005-05-06', '88994692388', 'matheus_fernando_ap@email.com', 90583422515, 2),
(15968872306, 'Geraldo Iago Novaes', '373681549', '1987-06-24', '88996547716', 'geraldo_novaes@agmail.com', 59528840941, 3),
(14238053303, 'Renato Raimundo Assis', '440693366', '1990-04-23', '88994472776', 'renato_raimundo_as@email.com', 43068331169, 4),
(64545216307, 'Kaue Eduardo da Mota', '280655459', '2003-07-17', '88999222602', 'kaue_damota@tce.com', 57267189451, 5),
(61604519363, 'Otavio Osvaldo Daniel da Rocha', '132128044', '1990-05-01', '88985533336', 'otavio-darocha72@uni.com', 43223480313, 6),
(22987304315, 'Benedito Giovanni Ferreira', '141878691', '1995-04-08', '88985437219', 'benedito_ferreira@hiz.com', 83276444971, 7),
(52647331391, 'Emanuel Enzo dos Santos', '411873659', '2006-09-18', '88997179534', 'emanuel-dossantos@email.com', 60915681332, 8),
(72413026304, 'Julio Luis Thales Mendes', '446092125', '2003-06-02', '8898933-1865', 'julio-mendes96@yandex.com', 47496720295, 9),
(45871945309, 'Gustavo Isaac de Paula', '123667276', '1990-05-08', '88991859382', 'gustavo_depaula@ao.com', 40810829887, 10);


create table cnh (
    numero_cnh varchar(11) primary key,
    validade date not null constraint cnh_validade check(validade > now()),
    categoria char(1) constraint cat_chk check (
        categoria in ('B', 'C', 'D')
    ) not null
);
select * from cnh;

INSERT INTO cnh (numero_cnh, validade, categoria) VALUES
(88533584470, '2030-01-10', 'B'),
(90583422515, '2029-03-25', 'C'),
(59528840941, '2028-07-05', 'B'),
(43068331169, '2031-06-12', 'B'),
(57267189451, '2027-09-18', 'D'),
(43223480313, '2026-12-01', 'C'),
(83276444971, '2032-04-20', 'D'),
(60915681332, '2027-05-30', 'C'),
(47496720295, '2030-11-17', 'B'),
(40810829887, '2033-08-05', 'C');

create table endereco (
    id serial primary key,
    cidade varchar(255) not null,
    estado char(2) not null,
    bairro varchar(255) not null,
    rua varchar(255) not null,
    numero varchar(10) not null,
    complemento varchar(255)
);
select * from endereco;

INSERT INTO endereco (cidade, estado, bairro, rua, numero, complemento) VALUES
('Juazeiro do Norte', 'CE', 'Santa Tereza', 'Rua São Damião', 351, 'perto do bar do michel'),
('Juazeiro do Norte', 'CE', 'Centro', 'Rua Doutor Flor Bartolomeu', 204, 'vizinho ao balduino'),
('Juazeiro do Norte', 'CE', 'Frei Damião', 'Rua Severina Lindalva Soares', 934, NULL),
('Juazeiro do Norte', 'CE', 'Centro', 'Rua Francisco Alves Bezerra', 362, NULL),
('Juazeiro do Norte', 'CE', 'Betolândia', 'Rua Esmeraldino Tavares de Souza', 947, NULL),
('Juazeiro do Norte', 'CE', 'Santo Antônio', 'Rua Laura Paiva', 300, 'perto do bar da rejane'),
('Juazeiro do Norte', 'CE', 'Leandro Bezerra de Meneses', 'Rua Olgiví Magalhães Melo', 377, NULL),
('Juazeiro do Norte', 'CE', 'José Geraldo da Cruz', 'Rua Manoel Pires', 826, NULL),
('Juazeiro do Norte', 'CE', 'Lagoa Seca', 'Rua José Antônio dos Santos', 584, NULL),
('Juazeiro do Norte', 'CE', 'Salgadinho', 'Rua São José', 736, 'enfrente a casa do seu ze');


-- Tabelas da direita
create table veiculo (
    renavam BIGINT primary key,
    placa varchar(7) not null unique,
    cor varchar(50) not null,
    modelo varchar(150) not null,
    marca varchar(50) not null,
    ano_fabricacao int not null,
    valor_diaria decimal(10, 2) not null,
    status varchar(15) constraint status_chk check (
        status in ('DISPONIVEL', 'OCUPADO')
    ) not null,

    id_categoria_fk int not null,
    foreign key (id_categoria_fk) references categoria (id)
);
-- drop table veiculo;

INSERT INTO veiculo (renavam, placa, cor, modelo, marca, ano_fabricacao, valor_diaria, status,id_categoria_fk) VALUES
(79394492450, 'HUF3145', 'Bege', 'Strada WORKING Hard 1.4 Fire Flex 8V CE', 'Fiat',2000, 95.00, 'OCUPADO',1),
(59420093907, 'HVL7673', 'Vermelho', 'UNO WAY XINGU 1.4 EVO F.Flex 8V', 'Fiat', 1999, 70.00, 'OCUPADO',2),
(74361187894, 'HWN5533', 'Azul', 'MOBI WAY 1.0 Fire Flex 5p.', 'Fiat', 2006, 80.00, 'DISPONIVEL',2),
(71594594102, 'HVC0280', 'Verde', 'UNO SPORTING 1.4 B.Edit. Flex 8V 5P', 'Fiat', 1997, 85.00, 'OCUPADO',2),
(77808268110, 'HXI7768', 'Cinza', 'Grand Siena ESSENCE ITALIA 1.6 Flex 16V', 'Fiat', 2007, 90.00, 'DISPONIVEL',3),
(5219289019, 'HVC8386', 'Preto', 'EcoSport SE 1.6 16V Flex 5p Mec.', 'Ford', 2008, 110.00, 'OCUPADO',4),
(3714800649, 'HXI2674', 'Amarelo', 'Ranger XLT 4.0 4x4 CD', 'Ford', 2022, 150.00, 'DISPONIVEL',5),
(7242146680, 'HVK4219', 'Cinza', 'CITY Sedan LX 1.5 Flex 16V 4p Mec.', 'Honda', 2021, 105.00, 'OCUPADO',3),
(6426976613, 'HXK5536', 'Prata', 'Civic Sedan LXS 1.8/1.8 Flex 16V Mec. 4p', 'Honda', 2020, 120.00, 'DISPONIVEL',3),
(50363213933, 'HYO5888', 'Bege', 'Frontier SL CD 4X4 2.5TB Diesel Aut', 'Nissan', 2019, 180.00, 'OCUPADO',5),
(2332697858, 'HYV8815', 'Verde', 'Hilux CD SRV D-4D 4x2 3.0 163cv TDI Dies', 'Toyota', 2024, 200.00, 'OCUPADO',5),
(31668738421, 'HWG8457', 'Dourado', 'Renegade Trailhawk 2.0 4x4 TB Diesel Aut', 'Jeep', 2022, 160.00, 'DISPONIVEL',4);

create table categoria (
    id serial primary key,
    nome varchar(100) not null,
    descricao text not null
    
);
select * from categoria;
-- drop table categoria;
-- drop table reserva;

INSERT INTO categoria(nome, descricao) VALUES
('Picape leve', 'veículo utilitário com uma cabine fechada para passageiros e uma caçamba aberta na parte traseira, utilizada para transporte de carga.'),
('Compacto', 'automóvel de tamanho reduzido, projetado para ser ágil, econômico e prático, especialmente em ambientes urbanos'),
('Sedan compacto', 'Automóvel de porte intermediário, com carroceria de três volumes, projetado para oferecer bom espaço interno, conforto e economia, mantendo a praticidade no uso urbano.'),
('SUV compacto', 'veículo utilitário esportivo menor que combina o design robusto e a altura elevada de um SUV com a agilidade de um carro de passeio para uso urbano'),
('Picape média', 'veículo que oferece um equilíbrio entre a capacidade de carga e reboque de uma picape grande com a facilidade de manobra e eficiência de um carro menor. Elas são versáteis e projetadas para trabalho, uso diário e lazer, em ambientes urbanos e off-road. ');


-- Tabelas de baixo
create table reserva (
    id_reserva serial primary key,
    data_reserva date not null,
    data_inicio date not null,
    data_fim date not null,
    observacao text,

    cpf_cliente_fk varchar(11) not null,
    renavam_fk bigint not null,
    id_pagamento_fk int not null,
    foreign key (cpf_cliente_fk) references cliente (cpf),
    foreign key (renavam_fk) references veiculo (renavam),
    foreign key (id_pagamento_fk) references pagamento (id_pagamento)
);


INSERT INTO reserva (data_reserva, data_inicio, data_fim, observacao, cpf_cliente_fk, renavam_fk, id_pagamento_fk) VALUES
('2025-10-26', '2025-10-28', '2025-10-30', 'vai mandar uma pessoa fazer a retirada', 96177498310, 79394492450, ),
('2025-10-26', '2025-10-29', '2025-10-31', NULL, 81727845382, 59420093907, ),
('2025-10-25', '2025-10-27', '2025-10-29', NULL, 15968872306, 71594594102, ),
('2025-10-25', '2025-10-28', '2025-10-30', NULL, 14238053303, 5219289019, ),
('2025-10-24', '2025-10-26', '2025-10-28', NULL, 64545216307, 7242146680, ),
('2025-10-24', '2025-10-27', '2025-10-29', NULL, 61604519363, 50363213933, ),
('2025-10-23', '2025-10-25', '2025-10-27', 'vem fazer retirada pessoalmente.', 22987304315, 2332697858, );

INSERT INTO reserva (data_reserva, data_inicio, data_fim, observacao, cpf_cliente_fk, renavam_fk, id_pagamento_fk) VALUES
('2025-10-26', '2025-10-28', '2025-10-30', 'Retirada será feita por um parente autorizado.', '96177498310', 79394492450, 1), -- Mario - Strada - crédito

('2025-10-26', '2025-10-29', '2025-10-31', NULL, '81727845382', 59420093907, 2), -- Matheus - Uno - débito

('2025-10-25', '2025-10-27', '2025-10-29', 'Cliente pediu tanque cheio.', '15968872306', 71594594102, 3), -- Geraldo - Uno Sporting - Pix

('2025-10-25', '2025-10-28', '2025-10-30', 'Entrega prevista para 10h da manhã.', '14238053303', 5219289019, 4), -- Renato - EcoSport - crédito

('2025-10-24', '2025-10-26', '2025-10-28', 'Cliente solicitará prorrogação de 1 dia.', '64545216307', 7242146680, 5), -- Kaue - City - Pix

('2025-10-24', '2025-10-27', '2025-10-29', 'Retirada no balcão principal.', '61604519363', 50363213933, 6), -- Otavio - Frontier - crédito

('2025-10-23', '2025-10-25', '2025-10-27', 'Cliente fará retirada pessoalmente.', '22987304315', 2332697858, 7); -- Benedito - Hilux - débito


-- deve adicionar o id_pagamento_fk na tabela de reserva.

create table pagamento (
    -- Essa chave vai virar fk nas especializações
    id_pagamento serial primary key,
    data_pagamento date not null,
    valor decimal(10, 2) not null,
    forma_pagamento varchar(50) not null
);

INSERT INTO pagamento (data_pagamento, valor, forma_pagamento) VALUES
('2025-10-26', 190.00, 'Crédito'),
('2025-10-26', 140.00, 'Débito'),
('2025-10-25', 170.00, 'Pix'),
('2025-10-25', 220.00, 'Crédito'),
('2025-10-24', 210.00, 'Pix'),
('2025-10-24', 250.00, 'Crédito'),
('2025-10-23', 300.00, 'Débito');


create table cartao (
    -- Essa chave primaria vai virar fk nas especializações 
    -- em baixo dela
    numero_cartao int not null primary key,
    bandeira varchar(20) not null,
    nome_titular varchar(100) not null,
    validade date not null,
    cvv char(3) not null,
    
    id_pagamento int,
    Foreign Key (id_pagamento) REFERENCES pagamento (id_pagamento)
);

INSERT INTO cartao (numero_cartao, bandeira, nome_titular, validade, cvv, id_pagamento) VALUES
(123456, 'Visa', 'Mario Gustavo', '2028-05-01', '812', 1), -- crédito
(654321, 'Mastercard', 'Matheus Fernando', '2027-11-15', '229', 2), -- débito
(789012, 'Elo', 'Renato Raimundo', '2029-03-22', '944', 4), -- crédito
(210987, 'Visa', 'Otavio Osvaldo', '2028-06-30', '103', 6), -- crédito
(345678, 'Mastercard', 'Benedito Giovanni', '2026-12-11', '551', 7); -- débito



create table credito (
    id_credito serial primary key,
    qtd_parcelas int not null,
    valor_parcela numeric(10, 2) not null,
    juros numeric(5, 2),

    numero_cartao_fk int,
    foreign key (numero_cartao_fk) references cartao (numero_cartao)
);

INSERT INTO credito (qtd_parcelas, valor_parcela, juros, numero_cartao_fk) VALUES
(3, 63.33, 2.5, 123456),
(2, 110.00, 0.0, 789012),
(4, 62.50, 3.0, 210987);


create table debito (
    conta int GENERATED ALWAYS AS IDENTITY,
    agencia int GENERATED ALWAYS AS IDENTITY, 
    banco varchar(50) not null,
    tipo_conta varchar(20) constraint tipo_conta_chk check 
	 (tipo_conta in ('Corrente', 'Poupanca')) not null,
	 
	PRIMARY KEY(conta,agencia),
	  
    numero_cartao_fk int,
    foreign key (numero_cartao_fk) references cartao (numero_cartao)
);

INSERT INTO debito (banco, tipo_conta, numero_cartao_fk) VALUES
('Banco do Brasil', 'Corrente', 654321),
('Caixa Econômica', 'Poupanca', 345678);


create table pix (
    codigo_transacao int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    chave_pix varchar(100) not null,
    tipo_chave varchar(20) constraint tipo_chave_chk check (
        tipo_chave in (
            'CPF',
            'CNPJ',
            'EMAIL',
            'TELEFONE'
        )
    ) not null,
    
    id_pagamento_fk int not null,
    foreign key (id_pagamento_fk) references pagamento (id_pagamento)
);

INSERT INTO pix (chave_pix, tipo_chave, id_pagamento_fk) VALUES
('matheusfernando@email.com', 'EMAIL', 3),
('21998877665', 'TELEFONE', 5);

-- Listar todos os veiculos disponíveis para locação

select modelo, marca, placa, valor_diaria, status from veiculo
where status = 'DISPONIVEL';


-- Clientes com reservas ativas

select c.nome_completo, r.data_inicio, r.data_fim, v.modelo from cliente c
inner join reserva r on c.cpf = r.cpf_cliente_fk
inner join veiculo v on r.renavam_fk = v.renavam
where CURRENT_DATE between r.data_inicio and r.data_fim;

-- Veículos mais alugados

SELECT v.modelo, v.marca, COUNT(r.id_reserva) AS total_reserva
FROM veiculo v
INNER JOIN reserva r ON v.renavam = r.renavam_fk
GROUP BY v.modelo, v.marca
ORDER BY total_reserva DESC;

-- Reservas futuras agendadas

SELECT c.nome_completo, v.modelo, r.data_inicio, r.data_fim
FROM reserva r
JOIN cliente c ON r.cpf_cliente_fk = c.cpf
JOIN veiculo v ON r.renavam_fk = v.renavam
WHERE r.data_inicio > CURRENT_DATE;










