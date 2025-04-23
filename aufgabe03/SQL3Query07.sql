
ALTER TABLE CustomerContactData
    ADD CONSTRAINT TWITTERID_CHECK
        CHECK (
            SUBSTR(TwitterId, 1, 1) = '@'
            AND LENGTH(TwitterId) <=22
            AND LENGTH(TRANSLATE(
                    SUBSTR(TwitterId, 2),
                    '',
                    'abcdefghijklmnopqrstuvwxyz0123456789*-'
                       )) = 0
            );

