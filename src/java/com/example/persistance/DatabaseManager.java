package com.example.persistance;

import jakarta.servlet.http.Part;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.sql.*;
import java.util.Base64;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Thato Keith Kujwane
 */
public class DatabaseManager {
    
    public class Applicant implements Serializable {

        final private String firstName, surname, idNumber;
        final private Part idCopy;

        public Applicant(String firstName, String surname, String idNumber, Part idCopy) {
            this.firstName = firstName;
            this.surname = surname;
            this.idNumber = idNumber;
            this.idCopy = idCopy;
        }

        public String getFirstName() {
            return firstName;
        }

        public String getSurname() {
            return surname;
        }

        public String getIdNumber() {
            return idNumber;
        }

        public Part getIdCopy() {
            return idCopy;
        }

        public String getStringIDCopy() {
            try (InputStream inputStream = idCopy.getInputStream(); ByteArrayOutputStream outputStream = new ByteArrayOutputStream()) {
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                byte[] fileBytes = outputStream.toByteArray();
                return Base64.getEncoder().encodeToString(fileBytes);
            } catch (IOException ex) {
                Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
                return null;
            }
        }
    }

    private class BlobPart implements Part {

        private final byte[] data;

        public BlobPart(byte[] data) {
            this.data = data;
        }

        @Override
        public InputStream getInputStream() throws IOException {
            return new ByteArrayInputStream(this.data);
        }

        @Override
        public String getContentType() {
            return "application/pdf";
        }

        @Override
        public String getName() {
            return "id_copy";
        }

        @Override
        public String getSubmittedFileName() {
            return "id_copy";
        }

        @Override
        public long getSize() {
            return this.data.length;
        }

        @Override
        public void write(String string) throws IOException {

        }

        @Override
        public void delete() throws IOException {
            throw new UnsupportedOperationException("Not supported yet.");
        }

        @Override
        public String getHeader(String string) {
            return string;
        }

        @Override
        public Collection<String> getHeaders(String string) {
            return null;
        }

        @Override
        public Collection<String> getHeaderNames() {
            return null;
        }

    }

    private final Connection connection;

    public DatabaseManager() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        this.connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3360/online_application_system_db?useSSL=false&allowPublicKeyRetrieval=true", "root", "root");
        System.out.println("Database connected");
    }

    public void insert(Applicant applicant) throws SQLException, IOException {
        PreparedStatement pst = this.connection.prepareStatement("INSERT INTO applicant(first_name, surname, id_number, id_copy) VALUES(?,?,?,?)");
        pst.setString(1, applicant.getFirstName());
        pst.setString(2, applicant.getSurname());
        pst.setString(3, applicant.getIdNumber());
        pst.setBlob(4, applicant.getIdCopy().getInputStream());
        pst.execute();
        pst.close();
    }

    public Applicant fetchApplicant(String applicantID) throws SQLException {
        PreparedStatement pst = this.connection.prepareStatement("SELECT * FROM applicant WHERE id_number = ?");
        pst.setString(1, applicantID);

        ResultSet rs = pst.executeQuery();

        if (!rs.next()) {
            return null;
        }

        String firstName = rs.getString("first_name");
        String surname = rs.getString("surname");
        //byte[] idCopy = rs.getBytes("id_copy");
        //InputStream in = rs.getBinaryStream("id_copy");

        return new Applicant(firstName, surname, surname, new BlobPart(rs.getBytes("id_copy")));
    }

    public void closeConnection() throws SQLException {
        this.connection.close();
    }
}
