ALTER TABLE produto ADD COLUMN id_user integer;
ALTER TABLE produto ADD CONSTRAINT fk_id FOREIGN KEY (id_user) REFERENCES usuario (id);