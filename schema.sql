/*** SCHEMA ***/

/* CREATES */

--CRIA A TABELA PROVA
CREATE TABLE prova
(
  id integer NOT NULL,
  distancia integer NOT NULL,
  modalidade varchar(50),
  sexo char,
  CONSTRAINT prova_id PRIMARY KEY (id)
);

--CRIA A TABELA SERIE
CREATE TABLE serie
(
  id integer NOT NULL,
  prova_id integer NOT NULL,
  data date,
  etapa varchar(20),
  CONSTRAINT serie_id PRIMARY KEY (id),
  CONSTRAINT serie_prova_fk FOREIGN KEY (prova_id) REFERENCES prova(id)
);

--CRIA A TABELA PATROCINADOR
CREATE TABLE patrocinador
(
  id integer NOT NULL,
  nome varchar(20),
  CONSTRAINT patrocinador_id PRIMARY KEY (id)
);

--CRIA A TABELA COMPETIDOR
CREATE TABLE competidor
(
  id integer NOT NULL,
  nome varchar(20),
  nascimento date,
  CONSTRAINT competidor_id PRIMARY KEY (id)
);

--CRIA A TABELA COMPETIDOR POR SERIE
CREATE TABLE competidor_por_serie
(
  competidor_id integer NOT NULL,
  serie_id integer NOT NULL,
  tempo integer,
  raia integer,
  CONSTRAINT CPS_competidor_fk FOREIGN KEY (competidor_id) REFERENCES competidor(id),
  CONSTRAINT CPS_serie_fk FOREIGN KEY (serie_id) REFERENCES serie(id),
  CONSTRAINT CPS_serie_id PRIMARY KEY (competidor_id, serie_id)
);

/* SEQUENCES */

create sequence seq_prova_identity_id
  start with 1
  increment by 1;

create sequence seq_serie_identity_id
  start with 1
  increment by 1;


create sequence seq_competidor_identity_id
  start with 1
  increment by 1;

create sequence seq_patrocinador_identity_id
  start with 1
  increment by 1;

/* INSERT */
-- Exemplo de uso da sequence para insert de PK

INSERT INTO PROVA(distancia, modalidade, sexo, id) VALUES(500, 'peito', 'M', seq_prova_identity_id.nextval);


/* TRIGGERS */

create or replace
TRIGGER tempo_competidor
  BEFORE UPDATE ON competidor_por_serie
  FOR EACH ROW
DECLARE
  cnt number;
BEGIN
  
    SELECT COUNT(*) INTO cnt FROM SERIE serieanterior
    INNER JOIN SERIE seriealterada on seriealterada.prova_id = serieanterior.prova_id 
    inner join COMPETIDOR_POR_SERIE c on c.serie_id = serieanterior.id
    WHERE seriealterada.id = :old.SERIE_ID
    AND serieanterior.DATA < seriealterada.DATA
    AND c.TEMPO IS NULL;
  
  IF cnt > 0 THEN
    RAISE_APPLICATION_ERROR (-25000, 'As series anteriores estao incompletas!');
  END IF;
END;
