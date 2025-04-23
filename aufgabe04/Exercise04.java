package de.tuberlin.dima.dbpra.exercises;

import de.tuberlin.dima.dbpra.interfaces.Exercise04Interface;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class Exercise04 implements Exercise04Interface {

    /**
     * Task 1- Create User-Defined Functions (UDFs)
     *  - HAVERSINE: calculates geographical distance between two points
     *  - ROUND4: rounds a value to 4 decimal places
     */

    public void ex01CreateUDFs(Connection con) throws SQLException {

        Statement statement = con.createStatement();
        String haversineFunction =
                "CREATE OR REPLACE FUNCTION haversine(length1 DOUBLE, width1 DOUBLE, length2 DOUBLE, width2 DOUBLE) " +
                        "RETURNS DOUBLE " +
                        "BEGIN " + "DECLARE d DOUBLE; " +
                        "    SET d = 12742 * Asin(Sqrt(Power(Sin((Radians(width2 - width1)) / 2), 2) + " +
                        "            (1 - Power(Sin((Radians(width2 - width1)) / 2), 2) - " +
                        "            Power(Sin((Radians(width2 + width1)) / 2), 2)) " +
                        "            * Power(Sin((Radians(length2 - length1)) / 2), 2))); " +
                        "    RETURN d; " +
                        "END";

        statement.execute(haversineFunction);

        String round4 =
                "CREATE FUNCTION ROUND4(X DOUBLE) RETURNS DOUBLE " +
                        "BEGIN " +
                        "RETURN ROUND(X, 4);" +
                        "END";

        statement.executeUpdate(round4);



    }

    /**
     * Task 2- Create View 'DISTANCE_PLACES'
     *  View that shows each place in the UK (except London)
     *  with its distance to London, using the HAVERSINE function.
     */
    public void ex02CreateView1(Connection con) throws SQLException {
        Statement statement = con.createStatement();

        String createViewSQL =
                "CREATE OR REPLACE VIEW DISTANCE_PLACES AS " +
                        "SELECT PLACE.id, " +
                        "PLACE.name, " +
                        "PLACE.longitude, " +
                        "PLACE.latitude, " +
                        "ROUND(HAVERSINE (PLACE.longitude, PLACE.latitude, LONDON.longitude, LONDON.latitude), 4) AS DISTANCE_LONDON " +
                        "FROM PLACES_IN_UK AS PLACE " +
                        "JOIN (SELECT longitude, latitude FROM PLACES_IN_UK WHERE name = 'London') AS LONDON " +
                        "ON 1 = 1 " +
                        "WHERE PLACE.name <> 'London'";

        statement.executeUpdate(createViewSQL);

    }


    /**
     * Task 3 – Create View 'AVG_DISTANCE'
     * For each place, calculate the average distance to all other places.
     * Only include places with latitude ≤ 55.4.
     */
    public void ex03CreateView2(Connection con) throws SQLException {

        Statement statement = con.createStatement();

        String view2 =
                "CREATE VIEW AVG_DISTANCE AS " +
                        "SELECT PLACES.ID, PLACES.NAME, ROUND(AVG(HAVERSINE(PLACES.LONGITUDE, PLACES.LATITUDE, " +
                        "PLACES2.LONGITUDE, PLACES2.LATITUDE)), 4) " +
                        "AS AVG_DISTANCE " +
                        "FROM Places_in_UK AS PLACES " + "JOIN Places_in_UK AS PLACES2 " + "ON PLACES.NAME != PLACES2.NAME " +
                        "AND PLACES.LATITUDE <= 55.4 AND PLACES2.LATITUDE <= 55.4 " + "GROUP BY PLACES.ID, PLACES.NAME";

        statement.executeUpdate(view2);

    }

    /**
     * Task 4 – Create Trigger 'DISTANCE_PLACES_UPDATE'
     * When the view is updated, update the original PLACES_IN_UK table.
     */
    public void ex04CreateTrigger(Connection con) throws SQLException {

        Statement statement = con.createStatement();

        String trigger =

                        "CREATE OR REPLACE TRIGGER DISTANCE_PLACES_UPDATE " +
                "INSTEAD OF UPDATE ON DISTANCE_PLACES " +
                "REFERENCING NEW AS NEW " +
                "FOR EACH ROW" +
                                " BEGIN " +
                                "UPDATE Places_in_UK " +
                "SET LONGITUDE = NEW.LONGITUDE, LATITUDE = NEW.LATITUDE " +
                "WHERE ID = NEW.ID; " +
                                "END";


        statement.executeUpdate(trigger);
    }

    /**
     * Task 5 – Create Stored Procedure 'ComputeAffiliationsOfBars'
     * Procedure updates the AVG_DISTANCE view using the HAVERSINE calculation.
     */
    public void ex05CreateProcedure(Connection con) throws SQLException {

        Statement statement = con.createStatement();

        String procedureSQL =
                "CREATE OR REPLACE PROCEDURE ComputeAffiliationsOfBars() " +
                        "LANGUAGE SQL " +
                        "BEGIN " +
                        "  Update AVG_DISTANCE based on HAVERSINE function calculation " +
                        "  UPDATE AVG_DISTANCE " +
                        "  SET AVG_DISTANCE = " +
                        "    (SELECT ROUND(AVG(HAVERSINE(P1.LONGITUDE, P1.LATITUDE, P2.LONGITUDE, P2.LATITUDE)), 4) " +
                        "     FROM PLACES_IN_UK AS P1, PLACES_IN_UK AS P2 " +
                        "     WHERE P1.ID = AVG_DISTANCE.ID " +
                        "       AND P1.NAME != P2.NAME " +
                        "       AND P1.LATITUDE <= 55.4 AND P2.LATITUDE <= 55.4); " +
                        "END";

        statement.execute(procedureSQL);
    }

}
