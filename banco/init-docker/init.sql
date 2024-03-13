CREATE TABLE area (
    id_area integer NOT NULL,
    nome_area text NOT NULL
);

CREATE TABLE condominio (
    id_condominio integer NOT NULL,
    nome_condominio text NOT NULL
);

CREATE TABLE estrutura_condominio (
    id_condominio integer NOT NULL,
    id_area integer NOT NULL
);

CREATE TABLE reserva (
    id_reserva integer NOT NULL,
    id_area integer NOT NULL,
    id_usuario integer NOT NULL,
    id_condominio integer NOT NULL,
    data date NOT NULL
);

CREATE TABLE usuario (
    id_usuario integer NOT NULL,
    id_condominio integer NOT NULL,
    nome_usuario text NOT NULL,
    senha text NOT NULL
);

-- Sequências e chaves primárias são configuradas automaticamente na exportação, então não são listadas aqui explicitamente

-- Populando a tabela area
INSERT INTO area (id_area, nome_area) VALUES
(1, 'churrasqueira'),
(2, 'quadra de esportes'),
(3, 'salão de festas'),
(4, 'salão de dança'),
(5, 'Espaço Zen');

-- Populando a tabela condominio
INSERT INTO condominio (id_condominio, nome_condominio) VALUES
(1, 'Marisol'),
(2, 'Vila Campestre');

-- Populando a tabela estrutura_condominio
INSERT INTO estrutura_condominio (id_condominio, id_area) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 2),
(2, 4);

-- Populando a tabela reserva
INSERT INTO reserva (id_reserva, id_area, id_usuario, id_condominio, data) VALUES
(48, 3, 1, 1, '2024-04-03'),
(49, 3, 1, 1, '2024-04-11'),
(50, 2, 1, 1, '2024-04-04');

-- Populando a tabela usuario
INSERT INTO usuario (id_usuario, id_condominio, nome_usuario, senha) VALUES
(1, 1, 'Yuri', '123'),
(2, 2, 'Biu', '234');

