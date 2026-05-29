create database  dog;
use dog;

CREATE TABLE IF NOT EXISTS Contacts (
    contact_id INT AUTO_INCREMENT PRIMARY KEY,
    name       VARCHAR(100) NOT NULL,
    phone      VARCHAR(20)  NOT NULL,
    email      VARCHAR(100),
    city       VARCHAR(50),
    created_at  datetime default now(),
    updated_at datetime default now()
);

select*from Contacts;

-- ----------------------------------------------------------- --
DELIMITER //

CREATE PROCEDURE add_contact(
    IN p_name  VARCHAR(100),
    IN p_phone VARCHAR(20),
    IN p_email VARCHAR(100),
    IN p_city  VARCHAR(50)
)
BEGIN
    DECLARE new_id INT;

    -- Validation
    IF TRIM(p_name) = '' OR p_name IS NULL THEN
        SELECT 'Error: Name cannot be empty' AS message;
    ELSEIF TRIM(p_phone) = '' OR p_phone IS NULL THEN
        SELECT 'Error: Phone number cannot be empty' AS message;
    ELSE
        INSERT INTO Contacts (name, phone, email, city)
        VALUES (TRIM(p_name), TRIM(p_phone), TRIM(p_email), TRIM(p_city));
        
        SET new_id = LAST_INSERT_ID();
        
        SELECT 
            new_id AS contact_id,
            'Success: Contact added successfully!' AS message;
    END IF;
END //

DELIMITER ;

call add_contact('ram','9087654321','esaw@sdyuyg','kathmandu');

 -- --------------------------------------------------------- ---
 
DELIMITER //

CREATE PROCEDURE search_contact(IN p_partial_name VARCHAR(100))
BEGIN
    IF TRIM(p_partial_name) = '' OR p_partial_name IS NULL THEN
        SELECT 'Error: Please enter a name to search' AS message;
    ELSE
        SELECT 
            contact_id,
            name,
            phone,
            email,
            city,
            created_at
        FROM Contacts
        WHERE name LIKE CONCAT('%', (p_partial_name), '%')
        ORDER BY name;
    END IF;
END //

DELIMITER ;


-- --------------------------------------------------------------------  --
DELIMITER //

CREATE PROCEDURE update_contact(IN p_partial_name VARCHAR(100), IN P_phone varchar(10))

begin 
UPDATE Contacts
    SET phone = P_phone
    WHERE name = p_partial_name;
    
end  //
delimiter ;


-- --------------------------------------------------------- ---
 DELIMITER //

CREATE PROCEDURE update_contact(IN p_partial_name VARCHAR(100))

begin 
declare total int;
select count(*) INTO total
from Contacts
where name = p_partial_name ;

if total= 0 then 
select 'contact not found' as message;
else 
delete from Contacts
where  name = p_partial_name ;

end 
DELIMITER ;
