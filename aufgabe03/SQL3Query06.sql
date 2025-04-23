
ALTER TABLE CustomerContactData
    ADD CONSTRAINT CHECK_Phone
        CHECK ((SUBSTR(Phone, 1, 3) IN ('+45', '+46', '+47'))
            AND SUBSTR(Phone, 4, 1) = ' '
            AND ( SUBSTR(Phone, 5, 3) BETWEEN '147' AND '158'
                OR SUBSTR(Phone, 5, 3) BETWEEN '171' AND '192')
            AND SUBSTR(Phone, 8, 1) = ' '
            AND LENGTH(SUBSTR(Phone, 9)) BETWEEN 8 AND 10
            AND LENGTH(Phone) BETWEEN 15 AND 19
            );

