package blog.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import blog.dao.UserDao;
import blog.db.C3P0Connection;
import blog.model.User;
import blog.utils.DBUtils;

/**
 * 用户服务的具体实现类
 *
 */
public class UserDaoImpl implements UserDao {

	private Connection conn;

	

	private static UserDao instance;

	public static final UserDao getInstance() {
		if (instance == null) {
			try {
				instance = new UserDaoImpl();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return instance;
	}

	/* (non-Javadoc)
	 * @see blog.daoImpl.UserDao#register(java.lang.String, java.lang.String)
	 */
	@Override
	public boolean register(String username, String password) {
		conn = C3P0Connection.getInstance().getConnection();
		String sql = "INSERT INTO t_user(user_name,user_password,POWER) VALUES(?,?,2)";
		PreparedStatement ps =null;
		boolean rs =false;
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			rs = ps.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
		
		// todo
		
	}

	/* (non-Javadoc)
	 * @see blog.daoImpl.UserDao#login(java.lang.String, java.lang.String)
	 */
	@Override
	public User login(String username, String password) {
		conn = C3P0Connection.getInstance().getConnection();

		User user = null;

		String sql = "select * from t_user where user_name=? and user_password=? ";
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			// bean导入
			if (rs.next()) {
				Map<String, String> map = new HashMap<String, String>();
				user = new User();
				map.put("user_name", rs.getString("user_name"));
				map.put("user_password", rs.getString("user_name"));
				map.put("user_id", rs.getString("user_id"));
				map.put("user_power", rs.getString("power"));
				try {
					BeanUtils.populate(user, map);
				} catch (Exception e) {
					throw new RuntimeException();
				}
			}
			DBUtils.Close(conn,ps, rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
}
