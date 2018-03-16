CREATE TABLE usuario (
	cd_usuario bigserial NOT NULL,
    nm_usuario varchar(50) NOT NULL,
    ds_senha varchar(100) NOT NULL,
    tp_usuario varchar(1) NOT NULL,
    CONSTRAINT pk_usuario PRIMARY KEY (cd_usuario) 
);

CREATE TABLE sala (
	cd_sala bigserial NOT NULL,
    nm_sala varchar(30) NOT NULL,
    qt_lugares integer NOT NULL,
    ds_caminho_mapa varchar(4000),
    tp_sala varchar(1), -- se é enumarado ou normal
    CONSTRAINT pk_sala PRIMARY KEY (cd_sala)
);

CREATE TABLE espetaculo (
    cd_espetaculo bigserial NOT NULL,
    cd_sala biginteger NOT NULL,
    nm_espetaculo varchar(100) NOT NULL,
    ds_espetaculo varchar(4000),
    vl_bilhete numeric (18,2) NOT NULL,
    CONSTRAINT pk_espetaculo PRIMARY KEY (cd_espetaculo),
    CONSTRAINT fk_sala FOREIGN KEY cd_sala REFERENCES sala (cd_sala)
);

CREATE TABLE horario_espetaculo (
	cd_horario bigserial NOT NULL,
    cd_espetaculo biginteger NOT NULL,
    dt_hora_inicio timestamp NOT NULL,
    dt_hora_termino timestamp NOT NULL,
    CONSTRAINT pk_horario_espetaculo PRIMARY KEY (horario_espetaculo),
    CONSTRAINT fk_espetaculo FOREIGN KEY cd_espetaculo REFERENCES espetaculo (cd_espetaculo) 
);

CREATE TABLE foto_espetaculo (
	cd_foto bigserial NOT NULL,
    cd_espetaculo biginteger NOT NULL,
    ds_caminho varchar(4000) NOT NULL,
    CONSTRAINT pk_foto_espetaculo PRIMARY KEY (foto_espetaculo),
    CONSTRAINT fk_espetaculo FOREIGN KEY cd_espetaculo REFERENCES espetaculo (cd_espetaculo)
);