package com.tka.dao;

import java.sql.*;
import java.util.*;

import com.tka.db.DBConnection;
import com.tka.model.Employee;

public class EmployeeDao {

	public List<Employee> getAllEmployees() {

		List<Employee> list = new ArrayList<>();

		try {

			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select * from employees");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Employee emp = new Employee();

				emp.setId(rs.getInt("id"));
				emp.setName(rs.getString("name"));
				emp.setEmail(rs.getString("email"));
				emp.setDepartment(rs.getString("department"));
				emp.setSalary(rs.getDouble("salary"));

				list.add(emp);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}