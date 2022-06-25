/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package chat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author QUANG HUY
 */
public class ChatDAO {

    private final String GET_ALL_MAJOR = "SELECT (SELECT U.fullname FROM tblUser U WHERE U.id_user = C.idUserSend)as nameSender,(SELECT U.fullname FROM tblUser U WHERE U.id_user =C.idUserReceive)as nameReceive,[message],[create_time],C.idUserSend,C.idUserReceive\n" +
"FROM tblUser U, tblChat C\n" +
"WHERE U.id_user = C.idUserReceive AND C.idUserSend = ? AND C.idUserReceive = ?\n" +
"UNION\n" +
"SELECT (SELECT U.fullname FROM tblUser U WHERE U.id_user = C.idUserSend)as nameSender,(SELECT U.fullname FROM tblUser U WHERE U.id_user =C.idUserReceive)as nameRecevice,[message],[create_time],C.idUserSend,C.idUserReceive\n" +
"FROM tblUser U, tblChat C\n" +
"WHERE U.id_user = C.[idUserReceive] AND C.idUserSend = ? AND C.idUserReceive = ?  Order by [create_time] asc";

    public List<ChatDTO> getAllMessage(int idSend, int idReceive) throws SQLException {
        List<ChatDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_MAJOR);
                ptm.setInt(1, idSend);
                ptm.setInt(2, idReceive);
                ptm.setInt(3, idReceive);
                ptm.setInt(4, idSend);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String nameSend = rs.getString("nameSender");
                    String nameRecevice = rs.getString("nameReceive");
                    String message = rs.getString("message");
                    String time = rs.getString("create_time");
                    int idSendDB = rs.getInt("idUserSend");
                    int idReceiveDB = rs.getInt("idUserReceive");
                   list.add(new ChatDTO(message, nameSend,idSendDB, nameRecevice,idReceiveDB,time));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return list;
    }
}
