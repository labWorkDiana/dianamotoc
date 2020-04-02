package modelDAO;

import java.util.logging.Logger;

public class Bug {
	private int idBug;
	private String name;
	private String descpription;
	private int prioriry;
	private int status;
	private int idProduct;
	private int BugFixer;
	private int idAccount;
	protected static final Logger LOGGER = Logger.getLogger(Product.class.getName());
	private static final String insertStatementString = "INSERT INTO bug (name, desciption, priority, status, idProduct, BugFixer, idAccout) VALUE (?,?,?,?,?,?,?)"; 
	private static final String readStatementString   = "SELECT * from product WHERE idProduct = ?"; 
	
	public int getIdBug() {
		return idBug;
	}
	public void setIdBug(int idBug) {
		this.idBug = idBug;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescpription() {
		return descpription;
	}
	public void setDescpription(String descpription) {
		this.descpription = descpription;
	}
	public int getPrioriry() {
		return prioriry;
	}
	public void setPrioriry(int prioriry) {
		this.prioriry = prioriry;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getIdProduct() {
		return idProduct;
	}
	public void setIdProduct(int idProduct) {
		this.idProduct = idProduct;
	}
	public int getBugFixer() {
		return BugFixer;
	}
	public void setBugFixer(int bugFixer) {
		BugFixer = bugFixer;
	}
	public int getIdAccount() {
		return idAccount;
	}
	public void setIdAccount(int idAccount) {
		this.idAccount = idAccount;
	}
}
