
SEQUENCE
-- create sequence
CREATE SEQUENCE mdm.entity_mgr_uam_en_id_seq;

--add sequence to a specific column
ALTER TABLE mdm.entity_mgr_uam
ALTER COLUMN en_id SET DEFAULT nextval('mdm.entity_mgr_uam_en_id_seq'::regclass);

--update sequence
ALTER SEQUENCE mdm.entity_mgr_uam_en_id_seq RESTART WITH 50;