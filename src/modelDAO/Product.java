package modelDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import connection.ConnectionFactory;

public class Product {
	private int idProduct;
	private int idCompany;
	private String name;
	
	protected static final Logger LOGGER = Logger.getLogger(Product.class.getName());
	private static final String insertStatementString = "INSERT INTO product (name, idCompany) VALUE (?,?)";  //create
	private static final String readStatementString   = "SELECT * from product WHERE idProduct = ?";   //read
	private static final String updateStatementString = "UPDATE product SET name = ?, idCompany = ? WHERE idProduct = ?";  //update
	private static final String deleteStatementString = "DELETE FROM product WHERE idProduct = ?";   // delete
	
	public Product() {
		super();
	}

	public Product(String name, int idCompany, int idProduct) {
		super();
		this.name = name;
		this.idCompany= idCompany;
		this.idProduct= idProduct;
	}

	public int getIdProduct() {
		return idProduct;
	}

	public void setIdProduct(int idProduct) {
		this.idProduct = idProduct;
	}

	public int getIdCompany() {
		return idCompany;
	}

	public void setIdCompany(int idCompany) {
		this.idCompany = idCompany;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public int insert() {
		Connection dbConnection = ConnectionFactory.getConnection();

		PreparedStatement insertStatement = null;
		int insertedId = -1;
		try {
			insertStatement = dbConnection.prepareStatement(insertStatementString, Statement.RETURN_GENERATED_KEYS);
			insertStatement.setString(1, this.getName());
			insertStatement.setInt(2, this.getIdCompany());

			insertStatement.executeUpdate();

			ResultSet rs = insertStatement.getGeneratedKeys();
			if (rs.next()) {
				insertedId = rs.getInt(1);
			}
		} catch (SQLException e) {
			LOGGER.log(Level.WARNING, "ProductDAO:insert " + e.getMessage());
		} finally {
			ConnectionFactory.close(insertStatement);
			ConnectionFactory.close(dbConnection);
		}
		return insertedId;
	}
	
	public void delete() {
		Connection dbConnection = ConnectionFactory.getConnection();

		PreparedStatement deleteStatement = null;
		try {
			deleteStatement = dbConnection.prepareStatement(deleteStatementString, Statement.RETURN_GENERATED_KEYS);
			deleteStatement.setInt(1, this.idProduct);
			deleteStatement.executeUpdate();

		} catch (SQLException e) {
			LOGGER.log(Level.WARNING, "ProductDAO:delete " + e.getMessage());
		} finally {
			ConnectionFactory.close(deleteStatement);
			ConnectionFactory.close(dbConnection);
		}
	}
	
	public void update(Product product) {
		Connection dbConnection = ConnectionFactory.getConnection();

		PreparedStatement updateStatement = null;
		int insertedId = -1;
		try {
			updateStatement = dbConnection.prepareStatement(updateStatementString, Statement.RETURN_GENERATED_KEYS);
			updateStatement.setString(1, product.getName());
			updateStatement.setInt(2, product.getIdCompany());
			updateStatement.setInt(3, this.getIdProduct());
			
			updateStatement.executeUpdate();

			
		} catch (SQLException e) {
			LOGGER.log(Level.WARNING, "ProductDAO:update " + e.getMessage());
		} finally {
			ConnectionFactory.close(updateStatement);
			ConnectionFactory.close(dbConnection);
		}
	}

	public static Product read(int id) {
		
		Connection dbConnection = ConnectionFactory.getConnection();
	    ResultSet rs = null;
	    PreparedStatement readStatement = null;
	    Product product = new Product();
	    try {
	            readStatement = dbConnection.prepareStatement(readStatementString, Statement.RETURN_GENERATED_KEYS);
	            rs = readStatement.executeQuery(readStatementString);
	            readStatement.setInt(1, id);
	            if(rs.next()){
	                product.setName(rs.getString("name"));
	                product.setIdProduct(rs.getInt("idProduct"));
	                product.setIdCompany(rs.getInt("idCompany"));
	                System.out.println("SALUT2");
	                return product;
	               
	            }
	            
	        }
	        catch(SQLException e){
	        	LOGGER.log(Level.WARNING, "ProductDAO:update " + e.getMessage());
	        }
	        finally {
	            ConnectionFactory.close(readStatement);
	            ConnectionFactory.close(dbConnection);
	        }
	        return null;
	        
	        
	        
	        /*Product result = (Product) Registry.getIdProduct(id);
			if (result != null) return result;
			PreparedStatement findStatement = null;
			ResultSet rs = null;
			try {
				findStatement = dbConnection.prepare(findStatementString);
				findStatement.setLong(1, id.longValue());
				rs = findStatement.executeQuery();
				rs.next();
				result = load(rs);
				return result;
				} 
				catch (SQLException e) {
					throw new SQLException(e);
				}
				finally {
					ConnectionFactory.close(findStatement);
					ConnectionFactory.close(dbConnection);
				}
				}
				public static Person find(long id) {
				return find(new Long(id));
				}
				public static Person load(ResultSet rs) throws SQLException {
				Long id = new Long(rs.getLong(1));
				Person result = (Person) Registry.getPerson(id);
				if (result != null) return result;
				String lastNameArg = rs.getString(2);
				String firstNameArg = rs.getString(3);
				int numDependentsArg = rs.getInt(4);
				result = new Person(id, lastNameArg, firstNameArg, numDependentsArg);
				Registry.addPerson(result);
				return result;
				}
		*/
	    }
}