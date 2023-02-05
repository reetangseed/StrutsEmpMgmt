/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.services;


import com.exavalu.models.Employee;
import com.exavalu.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Avijit Chattopadhyay
 */
public class EmployeeService {
    
    public static EmployeeService employeeService = null;
    
    public static EmployeeService getInstance()
    {
        if(employeeService==null)
        {
            return new EmployeeService();
        }
        else
        {
            return employeeService;
        }
    }
    
    public ArrayList getAllEmployees()
    {
        ArrayList empList = new ArrayList();
        try {
            Connection con = JDBCConnectionManager.getConnection();
            //String sql = "SELECT employeeId, firstName, lastName, phone, address, gender, age, basicSalary, .employees, employeedb.departments, employeedb.roles where employees.departmentId = departments.departmentId and employees.roleId = roles.roleId carAllowance, departmentName, roleName FROM employeedb.employees, employeedb.departments, employeedb.roles where employees.departmentId = departments.departmentId and employees.roleId = roles.roleId order by employeeId;";
            String sql = "select * from employees e, departments d, roles r "
                    + "where e.departmentId=d.departmentId and e.roleId=r.roleId and status=1 order by e.employeeId";
            PreparedStatement preparedStatement = con.prepareStatement(sql);

            ResultSet rs = preparedStatement.executeQuery();


            while(rs.next())
            {
                Employee emp = new Employee();
                
                emp.setEmployeeId(rs.getString("employeeId"));
                emp.setFirstName(rs.getString("firstName"));
                emp.setLastName(rs.getString("lastName"));
                emp.setPhone(rs.getString("phone"));
                emp.setAddress(rs.getString("address"));
                emp.setGender(rs.getString("gender"));
                emp.setAge(rs.getString("age"));
                emp.setBasicSalary(rs.getString("basicSalary"));
                emp.setCarAllowance(rs.getString("carAllowance"));
                emp.setDepartmentName(rs.getString("departmentName"));
                emp.setRoleName(rs.getString("roleName"));

                empList.add(emp);

            }


        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        System.out.println("Number of employees = "+empList.size());
        return empList;
    }
    
    public Employee getEmployee(String employeeId) {
        Employee emp = new Employee();
        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "SELECT employeeId, firstName, lastName, phone, address, gender, age, basicSalary, carAllowance, departmentName, roleName FROM employeedb.employees, employeedb.departments, employeedb.roles where employees.departmentId = departments.departmentId and employees.roleId = roles.roleId and employees.employeeId=?;";
//            String sql = "select * from employees e, departments d, roles r "
//                    + "where e.departmentId=d.departmentId and e.roleId=r.roleId "
//                    +"and e.employeeId=?";
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, employeeId);
            ResultSet rs = preparedStatement.executeQuery();


            while(rs.next())
            {
                emp.setEmployeeId(rs.getString("employeeId"));
                emp.setFirstName(rs.getString("firstName"));
                emp.setLastName(rs.getString("lastName"));
                emp.setPhone(rs.getString("phone"));
                emp.setAddress(rs.getString("address"));
                emp.setGender(rs.getString("gender"));
                emp.setAge(rs.getString("age"));
                emp.setBasicSalary(rs.getString("basicSalary"));
                emp.setCarAllowance(rs.getString("carAllowance"));
                emp.setDepartmentName(rs.getString("departmentName"));
                emp.setRoleName(rs.getString("roleName"));


            }


        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return emp;
    }
    public ArrayList SearchEmployeesDB(String firstName, String lastName, String gender, String departmentId, String roleId) {
        ArrayList empList = new ArrayList();
        try {
            Connection con = JDBCConnectionManager.getConnection();
            
            String sql = "select * from employees e, departments d, roles r "
                    + "where e.departmentId=d.departmentId and e.roleId=r.roleId having firstName like ? and lastName like ? and gender like ? and d.departmentId like ? and r.roleId like ? and status=1 order by employeeId";
            
//           if(!(emp.getFirstName().equals("null"))){
//               sql = sql + "and firstName= '" + emp.getFirstName()+"'";
//           }
//           if(!(emp.getLastName().equals("null"))){
//               sql = sql + "and lastName= '" + emp.getLastName()+"'";
//           }
//           if(!(emp.getGender().equals("null"))){
//               sql = sql + "and gender= '" + emp.getGender()+"'";
//           }
//           if(!emp.getDepartmentId().equals("0")){
//               sql = sql + " and d.departmentId= " + emp.getDepartmentId();
//           }
//           if(!emp.getRoleId().equals("0")){
//               sql = sql + " and r.roleId= " + emp.getRoleId();
//           }
           
           
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, firstName + "%");
            preparedStatement.setString(2, lastName + "%");
            preparedStatement.setString(3,gender+"%");
//            if(departmentId.equals("0")){
//                preparedStatement.setString(4, "%");
//            }
//            else{
                preparedStatement.setString(4, departmentId+"%");
            
//            if(roleId.equals("0")){
//                preparedStatement.setString(5, "%");
//            }
//            else{
                preparedStatement.setString(5,roleId+"%");
            
            
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();


            while(rs.next())
            {
                Employee emp1 = new Employee();
                
                emp1.setEmployeeId(rs.getString("employeeId"));
                emp1.setFirstName(rs.getString("firstName"));
                emp1.setLastName(rs.getString("lastName"));
                emp1.setPhone(rs.getString("phone"));
                emp1.setAddress(rs.getString("address"));
                emp1.setGender(rs.getString("gender"));
                emp1.setAge(rs.getString("age"));
                emp1.setBasicSalary(rs.getString("basicSalary"));
                emp1.setCarAllowance(rs.getString("carAllowance"));
                emp1.setDepartmentName(rs.getString("departmentName"));
                emp1.setRoleName(rs.getString("roleName"));

                empList.add(emp1);

            }


        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        System.out.println("Number of employees = "+empList.size());
        
        return empList;
    }

    public static boolean AddEmployee(Employee emp) {
        boolean result = false;
        try {

            Connection con = JDBCConnectionManager.getConnection();
            String sql = "INSERT INTO employees (firstName,lastName,phone,address,gender,age,departmentId,roleId,basicSalary,carAllowance)"
                    + "VALUES(?, ? ,? ,? ,? ,? ,? ,? ,? ,?)";

            PreparedStatement preparedStatement = con.prepareStatement(sql);

            int totalRows = 0;
            
                preparedStatement.setString(1, emp.getFirstName());
                preparedStatement.setString(2, emp.getLastName());
                preparedStatement.setString(3, emp.getPhone());
                preparedStatement.setString(4, emp.getAddress());
                preparedStatement.setString(5, emp.getGender());
                preparedStatement.setInt(6, Integer.parseInt(emp.getAge()));
                preparedStatement.setInt(7, Integer.parseInt(emp.getDepartmentId()));
                preparedStatement.setInt(8, Integer.parseInt(emp.getRoleId()));
                preparedStatement.setDouble(9, Double.parseDouble(emp.getBasicSalary()));
                preparedStatement.setDouble(10,Double.parseDouble(emp.getCarAllowance()));

                int row = preparedStatement.executeUpdate();

                if (row == 1) {
                    result = true;
                }

        } catch (SQLException e) {
			e.printStackTrace();
            }
        return result;
  
    }
    public static boolean saveEmployee(Employee emp, String employeeId) {
        
        boolean result = false;
        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "UPDATE employees\n"
                    + "SET firstName = ? , lastName = ? , phone = ? , address = ? ,\n"
                    + "gender = ? , age = ? , basicSalary = ?,carAllowance = ?, departmentId=?, roleId=?\n"
                    + "WHERE employeeId = ?";

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            
            preparedStatement.setString(1, emp.getFirstName());
            preparedStatement.setString(2, emp.getLastName());
            preparedStatement.setString(3, emp.getPhone());
            preparedStatement.setString(4, emp.getAddress());
            preparedStatement.setString(5, emp.getGender());
            preparedStatement.setString(6, emp.getAge());
            preparedStatement.setDouble(7, Double.parseDouble(emp.getBasicSalary()));
            preparedStatement.setDouble(8, Double.parseDouble(emp.getCarAllowance()));
            preparedStatement.setString(9, emp.getDepartmentId());
            preparedStatement.setString(10, emp.getRoleId());
            
                       
            preparedStatement.setString(11, employeeId);
            
            int row = preparedStatement.executeUpdate();

            if(row==1)
            {
                result = true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return result;
    }
    public static boolean deleteEmployee(String employeeId){
        boolean result=false;
        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "UPDATE employees\n"
                    + "SET status =0\n"
                    + "WHERE employeeId = ?";

            PreparedStatement preparedStatement = con.prepareStatement(sql);
          
            
                       
            preparedStatement.setString(1, employeeId);
            
            int row = preparedStatement.executeUpdate();

            if(row==1)
            {
                result = true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return result;
    }

}
