
SEQUENCE
-- create sequence
CREATE SEQUENCE mdm.entity_mgr_uam_en_id_seq;

--add sequence to a specific column
ALTER TABLE mdm.entity_mgr_uam
ALTER COLUMN en_id SET DEFAULT nextval('mdm.entity_mgr_uam_en_id_seq'::regclass);

--update sequence
ALTER SEQUENCE mdm.entity_mgr_uam_en_id_seq RESTART WITH 50;




--Added Procedure For Insert Data And Return Primery Key
CREATE OR REPLACE PROCEDURE mdm.inserselleranddummybroker(
    IN entry1_en_cm_id bigint,
    IN entry1_en_type bigint,
    IN entry2_en_cm_id bigint,
    IN entry2_en_type bigint,
    OUT en_id bigint,
    OUT en_id_dummy bigint)
LANGUAGE 'plpgsql'
AS $BODY$
BEGIN
    -- Insert the first entry and return its ID
    INSERT INTO mdm.entity_mgr_uam (en_cm_id, en_type) VALUES (entry1_en_cm_id, entry1_en_type) RETURNING id INTO en_id;

    -- Insert the second entry and return its ID
    INSERT INTO mdm.entity_mgr_uam (en_cm_id, en_type) VALUES (entry2_en_cm_id, entry2_en_type) RETURNING id INTO en_id_dummy;
	
	    INSERT INTO mdm.entity_mapping_link_uam (eml_seller_en_id, eml_broker_en_id,eml_flag) VALUES (en_id,en_id_dummy);

END;
$BODY$;
