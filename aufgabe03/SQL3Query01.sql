
CREATE TABLE CustomerContactData (
                                     CustKey INTEGER NOT NULL PRIMARY KEY,
                                     TwitterId VARCHAR(35),
                                     GoogleId BIGINT,
                                     FacebookId BIGINT,
                                     InstagramId VARCHAR(26),
                                     GithubId VARCHAR(34),
                                     TelegramName VARCHAR(38),
                                     ZipCode VARCHAR(5),
                                     Phone VARCHAR(40)
);


