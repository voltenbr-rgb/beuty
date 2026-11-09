-- Banco D1 de destino desta versão: manicure001 (binding no Pages: DB)
-- Opcional: a function cria esta tabela sozinha. Use só se quiser criar manualmente.
CREATE TABLE IF NOT EXISTS registros (
  store   TEXT NOT NULL,
  id      TEXT NOT NULL,
  data    TEXT,
  updated INTEGER NOT NULL DEFAULT 0,
  deleted INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (store, id)
);
