/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Role;
import com.exavalu.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Preyangsee
 */
public class RoleService {
    
    public static ArrayList getAllRoles() {

        ArrayList roleList = new ArrayList();
        try {

            Connection con = JDBCConnectionManager.getConnection();

            String sql = "Select * from roles";

            PreparedStatement preparedStatement = con.prepareStatement(sql);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Role role = new Role();
                
                role.setRoleId(rs.getInt("roleId"));
                role.setRoleName(rs.getString("roleName"));
                
                roleList.add(role);
                
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return roleList;
    }
    public static Role getRole(String roleId){
        
        Role role = new Role();
        
        Connection con = JDBCConnectionManager.getConnection();
        
        return role;
    }
}
