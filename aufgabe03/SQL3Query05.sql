
ALTER TABLE CustomerContactData
    ADD CONSTRAINT FacebookAndGoogleID_CHECK
        CHECK (
                (GoogleId IS NULL OR (GoogleId BETWEEN 100001 AND 999999 AND GoogleId NOT IN (886345, 456291, 366667, 227456)))
                AND
                (FacebookId IS NULL OR (FacebookId BETWEEN 100001 AND 999999 AND FacebookId NOT IN (623812, 736748, 698222, 981372))));

