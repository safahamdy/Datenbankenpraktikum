
ALTER TABLE CustomerContactData
    ADD CONSTRAINT CCD_Customer_FK
        FOREIGN KEY (CustKey)
            REFERENCES Customer (CustKey) ON DELETE CASCADE ON UPDATE RESTRICT;
