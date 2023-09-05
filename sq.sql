CREATE OR REPLACE FUNCTION add_picture_nomination()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO picture_nomination (id_nomination) VALUES (NEW.id);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER nomination_added
AFTER INSERT ON nomination
FOR EACH ROW
EXECUTE FUNCTION add_picture_nomination();
