package modelDAO;

import static org.junit.Assert.*;

import org.junit.Test;

import connection.ConnectionFactory;
import junit.framework.Assert;

public class ProductTest {

	@Test
	public void test(){
		  Product myProduct1 = new Product();
		  myProduct1.setIdCompany(2);
		  myProduct1.setName("CompanyX");
		  myProduct1.insert();
		  
		  Product myProduct2 = new Product();
			myProduct2.setName("CompanyY");
			myProduct2.setIdCompany(1);
			myProduct2.insert();
		    assertEquals("CompanyY", Product.read(2));
		    assertEquals("CompanyX", Product.read(1));


		    myProduct1.update(myProduct2);
		   
		    assertEquals("CompanyY", Product.read(1));
		   
		    myProduct1.delete();
		    myProduct2.delete();

		    assertNull(Product.read(1));
		    assertNull(Product.read(2));

		    
		  } 
}
