-- OPCIONAL: limpar antes
DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS videos;
DROP TABLE IF EXISTS users;

-- Tabela de usuários
CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    email      VARCHAR(255) NOT NULL UNIQUE,
    password   VARCHAR(255) NOT NULL
);

-- Tabela de roles (perfis) do usuário
CREATE TABLE user_roles (
    user_id BIGINT      NOT NULL,
    role    VARCHAR(100) NOT NULL,
    CONSTRAINT fk_user_roles_user
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE,
    CONSTRAINT pk_user_roles
        PRIMARY KEY (user_id, role)
);

-- Tabela de vídeos
CREATE TABLE videos (
    id        BIGSERIAL PRIMARY KEY,
    link      TEXT        NOT NULL,
    descricao VARCHAR(500) NOT NULL
);
