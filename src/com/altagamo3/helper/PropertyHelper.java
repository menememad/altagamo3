package com.altagamo3.helper;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.altagamo3.to.Image;
import com.altagamo3.to.Location;
import com.altagamo3.to.Property;
import com.altagamo3.to.PropertySearch;
import com.altagamo3.to.PropertyType;
import com.altagamo3.to.SearchConditions;
import com.altagamo3.to.User;
import com.altagamo3.utils.Constants;
import com.altagamo3.utils.DBConnection;

public class PropertyHelper {

	private static PropertyHelper propHelper;
	private PropertyHelper(){}
	public static PropertyHelper getInstance(){
		if(propHelper==null)
			propHelper = new PropertyHelper();
		return propHelper;
	}

	/**
	 *
	 * @param p
	 * @return propertyID
	 */
	public int addProperty(Property p){
		DBConnection dbcon = new DBConnection();
		Connection conn = dbcon.getConnection();
		int propertyID = 0;
		try {
			System.out.println("Property: "+p);
			System.out.println("Desc: "+p.getDescription());
			String strSQL = "INSERT INTO property(property_type_id,title,description,country_id,state_id,city_id,district_id,compound_id,zone_id,subarea_id,prp_for,price," +
					"rental_period,pay_type,pay_in_advance,inst_total_duration,created_by,finish_status,furn_status," +
					"area,subtype,floorNo,bedroomsNo,hallroomsNo,bathroomsNo,video_link, c_name,c_phone,c_email,c_address)" +
					"VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
					//CURRENT_TIMESTAMP
			PreparedStatement pst = conn.prepareStatement(strSQL);
			pst.setInt(1, p.getPropertyType().getId());
			pst.setString(2, p.getTitle());
			pst.setString(3, p.getDescription());
			pst.setInt(4, p.getCountry().getId());
			pst.setInt(5, p.getState().getId());
			pst.setInt(6, p.getCity().getId());
			if(p.getDistrict().getId()<=0)
				pst.setNull(7, Types.INTEGER);
			else
				pst.setInt(7, p.getDistrict().getId());
			if(p.getCompound().getId()<=0)
				pst.setNull(8, Types.INTEGER);
			else
				pst.setInt(8, p.getCompound().getId());
			if(p.getZone().getId()<=0)
				pst.setNull(9, Types.INTEGER);
			else
				pst.setInt(9, p.getZone().getId());
			if(p.getSubarea().getId()<=0)
				pst.setNull(10, Types.VARCHAR);
			else
				pst.setInt(10, p.getSubarea().getId());

			pst.setInt(11, p.getPropertyFor());
			if(p.getPrice()==null)
				pst.setNull(12, Types.INTEGER);
			else
				pst.setInt(12, p.getPrice());
			if(p.getRentalPeriod()==null)
				pst.setNull(13, Types.INTEGER);
			else
				pst.setInt(13, p.getRentalPeriod());
			pst.setInt(14, p.getPaymentType());
			if(p.getPaymentInAdvance()==null)
				pst.setNull(15, Types.INTEGER);
			else
				pst.setInt(15, p.getPaymentInAdvance());
			if(p.getInstallmentTotalDuration()==null)
				pst.setNull(16, Types.INTEGER);
			else
				pst.setInt(16, p.getInstallmentTotalDuration());
			pst.setInt(17, p.getCreatedBy().getId());
			if(p.getFinishingStatus()==null)
				pst.setNull(18, Types.INTEGER);
			else
				pst.setInt(18, p.getFinishingStatus());
			if(p.getFurnitureStatus()==null)
				pst.setNull(19, Types.INTEGER);
			else
				pst.setInt(19, p.getFurnitureStatus());
			if(p.getArea()==null)
				pst.setNull(20, Types.INTEGER);
			else
				pst.setInt(20, p.getArea());
			if(p.getSubtype()==null)
				pst.setNull(21, Types.INTEGER);
			else
				pst.setInt(21, p.getSubtype());
			if(p.getFloorNo()==null)
				pst.setNull(22, Types.INTEGER);
			else
				pst.setInt(22, p.getFloorNo());
			if(p.getNoOfBedRooms()==null)
				pst.setNull(23, Types.INTEGER);
			else
				pst.setInt(23, p.getNoOfBedRooms());
			if(p.getNoOfHallRooms()==null)
				pst.setNull(24, Types.INTEGER);
			else
				pst.setInt(24, p.getNoOfHallRooms());
			if(p.getNoOfBathRooms()==null)
				pst.setNull(25, Types.INTEGER);
			else
				pst.setInt(25, p.getNoOfBathRooms());
			pst.setString(26, p.getVideoLink());
			//pst.setInt(26, p.getCreatedBy().getId());
			pst.setString(27, p.getClient().getUsername());
			pst.setString(28, p.getClient().getMobile());
			pst.setString(29, p.getClient().getEmail());
			pst.setString(30, p.getClient().getAddress());

			pst.executeUpdate();
			// Get the newly generated property ID..
			String strSqlQuery = "SELECT LAST_INSERT_ID() FROM property;";
			pst = conn.prepareStatement(strSqlQuery);
			ResultSet rs = pst.executeQuery();
			if(rs.next()){
				propertyID = rs.getInt(1);
			}
			//Second Statement
			strSQL = "INSERT INTO prop_status (id,status,changed_by) VALUES(?,?,?)";
			pst = conn.prepareStatement(strSQL);
			pst.setInt(1, propertyID);
			pst.setInt(2, p.getStatus());
			pst.setInt(3, p.getCreatedBy().getId());
			pst.executeUpdate();	

			if(rs !=null && !rs.isClosed())	rs.close();
			if(pst !=null && !pst.isClosed())	pst.close();
			if(conn !=null && !conn.isClosed())	conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			propertyID = 0;
		}
		return propertyID;
	}

	public int addPropertyImage(int propertyID, List<Image> imagesList){
		DBConnection dbcon = new DBConnection();
		Connection conn = dbcon.getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement("INSERT INTO prop_images(prp_id,image,imageContentType) VALUES(?,?,?)");
			for (Image image : imagesList) {
				pst.setInt(1, propertyID);
				pst.setBlob(2, new FileInputStream(image.getFile()), (int)(image.getFile().length()));
				pst.setString(3, image.getContentType());
				pst.addBatch();
			}
			pst.executeBatch();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}finally{
			try {
				if(pst !=null && !pst.isClosed())	pst.close();
				if(conn !=null && !conn.isClosed())	conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public Property getProperty(int propertyID){
		DBConnection dbcon = new DBConnection();
		Connection conn = dbcon.getConnection();
		PreparedStatement pst = null;
		Property p = null;
		try {
			String sqlStr = "SELECT property.* ,country.*, state.*, city.*, compound.*, district.*, zone.*, subarea.*, prop_type.*, creator.*, approver.* " +
			"FROM property " +
			"LEFT OUTER JOIN users AS creator ON property.created_by = creator.id " +
			"LEFT OUTER JOIN users AS approver ON property.approved_by = approver.id " +
			"LEFT OUTER JOIN prop_type ON property.property_type_id = prop_type.id " +
			"LEFT OUTER JOIN country ON property.country_id = country.id " +
			"LEFT OUTER JOIN state ON property.state_id = state.id " +
			"LEFT OUTER JOIN city ON property.city_id = city.id " +
			"LEFT OUTER JOIN district ON property.district_id = district.id " +
			"LEFT OUTER JOIN compound ON property.compound_id = compound.id " +
			"LEFT OUTER JOIN zone ON property.zone_id = zone.id " +
			"LEFT OUTER JOIN subarea ON property.subarea_id = subarea.id " +
			"WHERE property.id=? ";
			pst = conn.prepareStatement(sqlStr);
			pst.setInt(1, propertyID);
			ResultSet rs = pst.executeQuery();
			if(rs.next()){
				p = new Property();
				p.setId(rs.getInt("property.id"));
				p.setDescription(rs.getString("description"));
				p.setStatus(rs.getInt("property.status"));
				p.setPropertyFor(rs.getInt("property.prp_for"));
				p.setPrice(rs.getInt("property.price"));
				p.setArea(rs.getInt("property.area"));
				p.setNoOfBedRooms(rs.getInt("property.bedroomsNo"));
				p.setNoOfHallRooms(rs.getInt("property.hallroomsNo"));
				p.setNoOfBathRooms(rs.getInt("property.bathroomsNo"));
				p.setFloorNo(rs.getInt("property.floorNo"));
				p.setSubtype(rs.getInt("property.subtype"));
				p.setFurnitureStatus(rs.getInt("property.furn_status"));
				p.setFinishingStatus(rs.getInt("property.finish_status"));
				p.setRentalPeriod(rs.getInt("property.rental_period"));
				p.setPaymentType(rs.getInt("property.pay_type"));
				p.setPaymentInAdvance(rs.getInt("property.pay_in_advance"));
				p.setInstallmentTotalDuration(rs.getInt("property.inst_total_duration"));
				p.setRentStartDate(rs.getDate("property.rent_start"));
				p.setRentEndDate(rs.getDate("property.rent_end"));
				p.setVideoLink(rs.getString("property.video_link"));
				p.setImageCount(rs.getInt("property.img_count"));
				p.setPropertyType(new PropertyType(rs.getInt("prop_type.id"), rs.getString("prop_type.name_ar"), rs.getString("prop_type.name_en")));
				p.setCountry(new Location(rs.getInt("country.id"),rs.getString("country.name_ar"),rs.getString("country.name_en")));
				p.setState(new Location(rs.getInt("state.id"),rs.getString("state.name_ar"),rs.getString("state.name_en")));
				p.setCity(new Location(rs.getInt("city.id"),rs.getString("city.name_ar"),rs.getString("city.name_en")));
				Location noLocation = new Location();
				if(rs.getInt("property.compound_id")>0)
					p.setCompound(new Location(rs.getInt("compound.id"),rs.getString("compound.name_ar"),rs.getString("compound.name_en")));
				else
					p.setCompound(noLocation);
				if(rs.getInt("property.district_id")>0)
					p.setDistrict(new Location(rs.getInt("district.id"),rs.getString("district.name_ar"),rs.getString("district.name_en")));
				else
					p.setDistrict(noLocation);
				if(rs.getInt("property.zone_id")>0)
					p.setZone(new Location(rs.getInt("zone.id"),rs.getString("zone.name_ar"),rs.getString("zone.name_en")));
				else
					p.setZone(noLocation);
				if(rs.getInt("property.subarea_id")>0)
					p.setSubarea(new Location(rs.getInt("subarea.id"),rs.getString("subarea.name_ar"),rs.getString("subarea.name_en")));
				else
					p.setSubarea(noLocation);
					
				p.setCreatedBy(new User(rs.getInt("creator.id"),rs.getString("creator.firstname"),rs.getString("creator.lastname"),rs.getString("creator.email"),rs.getString("creator.mobile")));
				p.setApprovedBy(new User(rs.getInt("approver.id"),rs.getString("approver.firstname"),rs.getString("approver.lastname"),rs.getString("approver.email"),rs.getString("approver.mobile")));
				User client = new User();
				client.setUsername(rs.getString("c_name"));
				client.setMobile(rs.getString("c_phone"));
				client.setEmail(rs.getString("c_email"));
				client.setAddress(rs.getString("c_address"));
				p.setClient(client);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(pst !=null && !pst.isClosed())	pst.close();
				if(conn !=null && !conn.isClosed())	conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return p;
	}

	public Image getPropertyImage(int propertyID, int imageNo){
		DBConnection dbcon = new DBConnection();
		Connection conn = dbcon.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		Image image = null;
		try {
			pst = conn.prepareStatement("select image, imageContentType from prop_images where prp_id = ?");
			pst.setInt(1, propertyID);
			rs = pst.executeQuery();
			int index=1;
			while(rs.next()){
				if(index==imageNo){
					image = new Image();
					image.setContentType(rs.getString("imageContentType"));
					Blob blob = rs.getBlob("image");
					if(blob!=null){
						image.setFileBytes(blob.getBytes(1, (int)blob.length()));
					}else{
						image.setFileBytes(null);
					}
					break;
				}else{
					index++;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				if(rs !=null && !rs.isClosed())	rs.close();
				if(pst !=null && !pst.isClosed())	pst.close();
				if(conn !=null && !conn.isClosed())	conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return image;
	}

	/**
	 * approve the property by changing its status in the database from 1 to 2
	 * @param p
	 */
	public int approveProperty(Property p){
		DBConnection dbcon = new DBConnection();
		Connection conn = dbcon.getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			String strSQL = "UPDATE property SET status=2, approved_at=CURRENT_TIMESTAMP, approved_by= ? WHERE id= ?";
			System.out.println("SQL: "+strSQL);
			pst = conn.prepareStatement(strSQL);
			pst.setInt(1, p.getApprovedBy().getId());
			pst.setInt(2, p.getId());
			result = pst.executeUpdate();
			//Second Statement
			strSQL = "INSERT INTO prop_status (id,status,changed_by) VALUES(?,?,?)";
			pst = conn.prepareStatement(strSQL);
			pst.setInt(1, p.getId());
			pst.setInt(2, Constants.PROPERTY_STATUS_AVAILABLE);
			pst.setInt(3, p.getApprovedBy().getId());
			pst.executeUpdate();		
		} catch (SQLException e) {
			e.printStackTrace();
			result = 0;
		} finally{
			try {
				if(pst !=null && !pst.isClosed())	pst.close();
				if(conn !=null && !conn.isClosed())	conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	/**
	 * change the status of the property in the database
	 * @param p
	 */
	public int changePropertyStatus(Property p){
		DBConnection dbcon = new DBConnection();
		Connection conn = dbcon.getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			//conn.setAutoCommit(false);
			String strSQL = "UPDATE property SET status=? WHERE id=?";
			System.out.println("SQL: "+strSQL);
			pst = conn.prepareStatement(strSQL);
			pst.setInt(1, p.getStatus());
			pst.setInt(2, p.getId());
			result = pst.executeUpdate();
			//Second Statement
			strSQL = "INSERT INTO prop_status (id,status,changed_by) VALUES(?,?,?)";
			pst = conn.prepareStatement(strSQL);
			pst.setInt(1, p.getId());
			pst.setInt(2, p.getStatus());
			pst.setInt(3, p.getApprovedBy().getId());
			pst.executeUpdate();	
			//conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			result = 0;
			//conn.rollback();
		} finally{
			try {
				if(pst !=null && !pst.isClosed())	pst.close();
				if(conn !=null && !conn.isClosed())	conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	/**
	 * change the status of the property in the database
	 * @param p
	 */
	public int changePropertyStatus(String[] PropertyIDs, int newStatus, int userID){
		DBConnection dbcon = new DBConnection();
		Connection conn = dbcon.getConnection();
		Statement st = null;
		PreparedStatement pst = null;
		int result = 0;
		try {
			String PropertyIDsStr = "";
			for (String s : PropertyIDs) {
				PropertyIDsStr+=s+",";
			}
			PropertyIDsStr = PropertyIDsStr.substring(0, PropertyIDsStr.length()-1);
			String approveStr = "";
			String currentStatuses = "";
			if(newStatus==1){
				currentStatuses = "3,4,5";
			}else if(newStatus==2){
				currentStatuses = "1";
				approveStr = ",approved_by="+userID+",approved_at=CURRENT_TIMESTAMP";
			}else if(newStatus==3||newStatus==4){
				currentStatuses = "2";
			}else if(newStatus==5){
				currentStatuses = "1,2,3,4";
			}
			String strSQL = "UPDATE property SET status="+newStatus+approveStr+" WHERE id IN("+PropertyIDsStr+") AND status IN("+currentStatuses+")";
			st = conn.createStatement();
			System.out.println("SQL: "+strSQL);
			st.executeUpdate(strSQL);
			//Second Statement
			strSQL = "INSERT INTO prop_status (id,status,changed_by) VALUES(?,?,?)";
			System.out.println("SQL: "+strSQL);
			pst = conn.prepareStatement(strSQL);
			for (String s: PropertyIDs) {
				pst.setInt(1, Integer.parseInt(s));
				pst.setInt(2, newStatus);
				pst.setInt(3, userID);
				pst.addBatch();
			}
			pst.executeBatch();
			//conn.commit();
			result++;
		} catch (SQLException e) {
			e.printStackTrace();
			result = 0;
			//conn.rollback();
		} finally{
			try {
				if(st !=null && !st.isClosed())	st.close();
				if(pst !=null && !pst.isClosed())	pst.close();
				if(conn !=null && !conn.isClosed())	conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	/**
	 * change the status of the property in the database
	 * @param p
	 */
	public int rentProperty(Property p){
		DBConnection dbcon = new DBConnection();
		Connection conn = dbcon.getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			//conn.setAutoCommit(false);
			String strSQL = "UPDATE property SET status=?, rent_start=?, rent_end=? WHERE id=?";
			System.out.println("SQL: "+strSQL);
			pst = conn.prepareStatement(strSQL);
			pst.setInt(1, p.getStatus());
			pst.setDate(2, p.getRentStartDate());
			pst.setDate(3, p.getRentEndDate());
			pst.setInt(4, p.getId());
			result = pst.executeUpdate();
			//Second Statement
			strSQL = "INSERT INTO prop_status (id,status,changed_by) VALUES(?,?,?)";
			pst = conn.prepareStatement(strSQL);
			pst.setInt(1, p.getId());
			pst.setInt(2, p.getStatus());
			pst.setInt(3, p.getApprovedBy().getId());
			pst.executeUpdate();	
			//conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			result = 0;
			//conn.rollback();
		} finally{
			try {
				if(pst !=null && !pst.isClosed())	pst.close();
				if(conn !=null && !conn.isClosed())	conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	/**
	 * update the given property data into the database
	 * @param p
	 */
	public int editProperty(Property p){
		DBConnection dbcon = new DBConnection();
		Connection conn = dbcon.getConnection();
		PreparedStatement pst = null;
		int propertyID = 0;
		try {
			System.out.println("Property: "+p);
			System.out.println("Desc: "+p.getDescription());
			String strSQL = "UPDATE property SET property_type_id = ?, title = ?, description=?, " +
			"country_id=?, state_id=?, city_id=?, district_id=?, compound_id=?, zone_id=? ,subarea_id=?, " +
			"prp_for=?, price=?, rental_period=?, pay_type=?, pay_in_advance=?, inst_total_duration=?, " +
			"finish_status=?, furn_status=?, area=?, subtype=?, floorNo=?, bedroomsNo=?, hallroomsNo=?, bathroomsNo=?, " +
			"video_link=?, c_name=?, c_phone=?, c_email=?, c_address=? WHERE id=?";
			pst = conn.prepareStatement(strSQL);
			pst.setInt(1, p.getPropertyType().getId());
			pst.setString(2, p.getDescription());
			pst.setString(3, p.getDescription());
			pst.setInt(4, p.getCountry().getId());
			pst.setInt(5, p.getState().getId());
			pst.setInt(6, p.getCity().getId());
			if(p.getDistrict().getId()<=0)
				pst.setNull(7, Types.INTEGER);
			else
				pst.setInt(7, p.getDistrict().getId());
			if(p.getCompound().getId()<=0)
				pst.setNull(8, Types.INTEGER);
			else
				pst.setInt(8, p.getCompound().getId());
			if(p.getZone().getId()<=0)
				pst.setNull(9, Types.INTEGER);
			else
				pst.setInt(9, p.getZone().getId());
			if(p.getSubarea().getId()<=0)
				pst.setNull(10, Types.INTEGER);
			else
				pst.setInt(10, p.getSubarea().getId());

			pst.setInt(11, p.getPropertyFor());
			if(p.getPrice()==null)
				pst.setNull(12, Types.INTEGER);
			else
				pst.setInt(12, p.getPrice());
			if(p.getRentalPeriod()==null)
				pst.setNull(13, Types.INTEGER);
			else
				pst.setInt(13, p.getRentalPeriod());
			pst.setInt(14, p.getPaymentType());
			if(p.getPaymentInAdvance()==null)
				pst.setNull(15, Types.INTEGER);
			else
				pst.setInt(15, p.getPaymentInAdvance());
			if(p.getInstallmentTotalDuration()==null)
				pst.setNull(16, Types.INTEGER);
			else
				pst.setInt(16, p.getInstallmentTotalDuration());
			if(p.getFinishingStatus()==null)
				pst.setNull(17, Types.INTEGER);
			else
				pst.setInt(17, p.getFinishingStatus());
			if(p.getFurnitureStatus()==null)
				pst.setNull(18, Types.INTEGER);
			else
				pst.setInt(18, p.getFurnitureStatus());
			if(p.getArea()==null)
				pst.setNull(19, Types.INTEGER);
			else
				pst.setInt(19, p.getArea());
			if(p.getSubtype()==null)
				pst.setNull(20, Types.INTEGER);
			else
				pst.setInt(20, p.getSubtype());
			if(p.getFloorNo()==null)
				pst.setNull(21, Types.INTEGER);
			else
				pst.setInt(21, p.getFloorNo());
			if(p.getNoOfBedRooms()==null)
				pst.setNull(22, Types.INTEGER);
			else
				pst.setInt(22, p.getNoOfBedRooms());
			if(p.getNoOfHallRooms()==null)
				pst.setNull(23, Types.INTEGER);
			else
				pst.setInt(23, p.getNoOfHallRooms());
			if(p.getNoOfBathRooms()==null)
				pst.setNull(24, Types.INTEGER);
			else
				pst.setInt(24, p.getNoOfBathRooms());
			pst.setString(25, p.getVideoLink());
			//pst.setInt(26, p.getCreatedBy().getId());
			pst.setString(26, p.getClient().getUsername());
			pst.setString(27, p.getClient().getMobile());
			pst.setString(28, p.getClient().getEmail());
			pst.setString(29, p.getClient().getAddress());
			pst.setInt(30, p.getId());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			propertyID = 0;
		} finally{
			try {
				if(pst !=null && !pst.isClosed())	pst.close();
				if(conn !=null && !conn.isClosed())	conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		propertyID =p.getId();
		return propertyID;
	}

	public int editPropertyImage(int propertyID, List<Image> imagesList){
		DBConnection dbcon = new DBConnection();
		Connection conn = dbcon.getConnection();
		Statement st = null;
		int result = 0;
		try {
			st = conn.createStatement();
			st.executeUpdate("DELETE FROM prop_images where prp_id="+propertyID);
			addPropertyImage(propertyID, imagesList);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(st !=null && !st.isClosed())	st.close();
				if(conn !=null && !conn.isClosed())	conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
/**
	 * get the user image from the database as byte[] with the content type
	 * @param username
	 * @return
	 */
	public List<Object[]> getPropertyImages(int PropertyID){
		DBConnection dbcon = new DBConnection();
		Connection conn = dbcon.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<Object[]> imageslist = null;
		Object[] imagesAry = null;
		try {
			pst = conn.prepareStatement("select image, imageContentType from prop_images where prp_id = ?");
			pst.setInt(1, PropertyID);
			rs = pst.executeQuery();
			imageslist = new ArrayList<Object[]>();
			while(rs.next()){
				imagesAry = new Object[2];
				String photoContentType = rs.getString("imageContentType");
				imagesAry[0] = photoContentType;
				Blob blob = rs.getBlob("image");
				if(blob!=null){
					byte[] photo = blob.getBytes(1, (int)blob.length());
					imagesAry[1] = photo;
					imageslist.add(imagesAry);
				}else{
					imagesAry = null;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				if(rs !=null && !rs.isClosed())	rs.close();
				if(pst !=null && !pst.isClosed())	pst.close();
				if(conn !=null && !conn.isClosed())	conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return imageslist;
	}

	/**
	 * get the user image from the database as byte[] with the content type
	 * @param username
	 * @return
	 */
	public int getPropertyImagesCount(int PropertyID){
		DBConnection dbcon = new DBConnection();
		Connection conn = dbcon.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		int imageCount = 0;
		try {
			pst = conn.prepareStatement("select count(*) as imageCount from prop_images where prp_id = ?");
			pst.setInt(1, PropertyID);
			rs = pst.executeQuery();
			if(rs.next()){
				imageCount = rs.getInt("imageCount");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				if(rs !=null && !rs.isClosed())	rs.close();
				if(pst !=null && !pst.isClosed())	pst.close();
				if(conn !=null && !conn.isClosed())	conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return imageCount;
	}

	public HashMap<Integer, String> listPropertyTypes() {
		DBConnection dbcon = new DBConnection();
		Connection conn = dbcon.getConnection();
		PreparedStatement pst= null;
		ResultSet rs = null;
		HashMap<Integer, String> propertyTypesMap = new HashMap<Integer, String>();
		try {
			pst= conn.prepareStatement("SELECT id, name_en, name_ar FROM prop_type where active_flag =\'1\' order by name_en");
			rs = pst.executeQuery();
			while(rs.next()){
				propertyTypesMap.put(rs.getInt("id"), rs.getString("name_en") + " - " + rs.getString("name_ar"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try{
				if(rs !=null && !rs.isClosed())	rs.close();
				if(pst !=null && !pst.isClosed())	pst.close();
				if(conn !=null && !conn.isClosed())	conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return propertyTypesMap;
	}
	public List<Property> searchProperties(PropertySearch prpSrch, SearchConditions cond, User loggedInUser) {
		DBConnection dbcon = new DBConnection();
		Connection conn = dbcon.getConnection();
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Property> pal = new ArrayList<Property>();
		StringBuffer sqlStrBfr = new StringBuffer( 
"SELECT property.* ,country.*, state.*, prop_type.*, users.* " +
"FROM property " +
"LEFT OUTER JOIN users ON property.created_by = users.id " +
"LEFT OUTER JOIN prop_type ON property.property_type_id = prop_type.id " +
"LEFT OUTER JOIN country ON property.country_id = country.id " +
"LEFT OUTER JOIN state ON property.state_id = state.id " +
"LEFT OUTER JOIN city ON property.city_id = city.id " +
"LEFT OUTER JOIN district ON property.district_id = district.id " +
"LEFT OUTER JOIN compound ON property.compound_id = compound.id " +
"LEFT OUTER JOIN zone ON property.zone_id = zone.id " +
"LEFT OUTER JOIN subarea ON property.subarea_id = subarea.id " +
"WHERE 1=1 ");
		if(prpSrch.getStatus()!=null && prpSrch.getStatus().length>0)
			sqlStrBfr.append(" AND property.status IN ("+prpSrch.getStatusesAsString()+") ");
		else if(loggedInUser==null || loggedInUser.getRoleID()==Constants.ROLE_VISITOR)
			sqlStrBfr.append(" AND property.status = '"+Constants.PROPERTY_STATUS_AVAILABLE+"' ");
		if(prpSrch.getDescription()!=null)
			sqlStrBfr.append(" AND property.description LIKE '%"+prpSrch.getDescription()+"%' ");
		if(prpSrch.getPropertyID()!=null && prpSrch.getPropertyID().length > 0)
			sqlStrBfr.append(" AND property.id IN ("+prpSrch.getPropertyIDsAsString()+") ");
		if(prpSrch.getPropertyTypeID()!=null && prpSrch.getPropertyTypeID().length > 0)
			sqlStrBfr.append(" AND property.property_type_id IN ("+prpSrch.getPropertyTypeIDsAsString()+") ");
		if(prpSrch.getPropertyFor()!=null) 
			sqlStrBfr.append(" AND property.prp_for IN("+prpSrch.getPropertyFor()+",3)");
		if(prpSrch.getRentalPeriod()!=null && prpSrch.getRentalPeriod().length > 0){
			sqlStrBfr.append(" AND property.rental_period IN("+prpSrch.getRentalPeriodsAsString()+") ");
		}if(prpSrch.getMinPrice()!=null && prpSrch.getMaxPrice()!=null && prpSrch.getMaxPrice() > 0 )
			sqlStrBfr.append(" AND property.price BETWEEN "+prpSrch.getMinPrice()+" AND "+prpSrch.getMaxPrice()+" ");
		else if(prpSrch.getMinPrice()==null && prpSrch.getMaxPrice()!=null)
			sqlStrBfr.append(" AND property.price =< "+prpSrch.getMaxPrice());
		else if(prpSrch.getMaxPrice()==null && prpSrch.getMinPrice()!=null)
			sqlStrBfr.append(" AND property.price >= "+prpSrch.getMinPrice());
		if(prpSrch.getMinArea()!=null && prpSrch.getMaxArea()!=null && prpSrch.getMaxArea() > 0 )
			sqlStrBfr.append(" AND property.area BETWEEN "+prpSrch.getMinArea()+" AND "+prpSrch.getMaxArea()+" ");
		else if(prpSrch.getMinArea()==null && prpSrch.getMaxArea()!=null)
			sqlStrBfr.append(" AND property.area =< "+prpSrch.getMaxArea());
		else if(prpSrch.getMaxArea()==null && prpSrch.getMinArea()!=null)
			sqlStrBfr.append(" AND property.area >= "+prpSrch.getMinArea());
		if(prpSrch.getCountryID()!=null && prpSrch.getCountryID()>0)
			sqlStrBfr.append(" AND property.country_id = "+prpSrch.getCountryID());
		if(prpSrch.getStateID()!=null && prpSrch.getStateID()>0)
			sqlStrBfr.append(" AND property.state_id = "+prpSrch.getStateID());
		if(prpSrch.getCityID()!=null && prpSrch.getCityID()>0)
			sqlStrBfr.append(" AND property.city_id = "+prpSrch.getCityID());
		if(prpSrch.getDistrictID()!=null && prpSrch.getDistrictID()>0)
			sqlStrBfr.append(" AND property.district_id = "+prpSrch.getDistrictID());
		if(prpSrch.getCompoundID()!=null && prpSrch.getCompoundID()>0)
			sqlStrBfr.append(" AND property.compound_id = "+prpSrch.getCompoundID());
		if(prpSrch.getZoneID()!=null && prpSrch.getZoneID()>0)
			sqlStrBfr.append(" AND property.zone_id = "+prpSrch.getZoneID());
		if(prpSrch.getSubareaID()!=null && prpSrch.getSubareaID()>0)
			sqlStrBfr.append(" AND property.subarea_id = "+prpSrch.getSubareaID());
		if(prpSrch.getMinRentStart()!=null && prpSrch.getMaxRentStart()!=null)
			sqlStrBfr.append(" AND property.rent_start BETWEEN "+prpSrch.getMinRentStart()+" AND "+prpSrch.getMaxRentStart()+" ");
		else if(prpSrch.getMinRentStart()==null && prpSrch.getMaxRentStart()!=null)
			sqlStrBfr.append(" AND property.rent_start =< "+prpSrch.getMaxRentStart());
		else if(prpSrch.getMaxRentStart()==null && prpSrch.getMinRentStart()!=null)
			sqlStrBfr.append(" AND property.rent_start >= "+prpSrch.getMinRentStart());
		if(prpSrch.getMinRentEnd()!=null && prpSrch.getMaxRentEnd()!=null)
			sqlStrBfr.append(" AND property.rent_end BETWEEN "+prpSrch.getMinRentEnd()+" AND "+prpSrch.getMaxRentEnd()+" ");
		else if(prpSrch.getMinRentEnd()==null && prpSrch.getMaxRentEnd()!=null)
			sqlStrBfr.append(" AND property.rent_end =< "+prpSrch.getMaxRentEnd());
		else if(prpSrch.getMaxRentEnd()==null && prpSrch.getMinRentEnd()!=null)
			sqlStrBfr.append(" AND property.rent_end >= "+prpSrch.getMinRentEnd());
		if(prpSrch.getCreatedFrom()!=null && prpSrch.getCreatedTo()!=null)
			sqlStrBfr.append(" AND property.created_at BETWEEN "+prpSrch.getCreatedFrom()+" AND "+prpSrch.getCreatedTo()+" ");
		else if(prpSrch.getCreatedFrom()==null && prpSrch.getCreatedTo()!=null)
			sqlStrBfr.append(" AND property.created_at =< "+prpSrch.getCreatedTo());
		else if(prpSrch.getCreatedTo()==null && prpSrch.getCreatedFrom()!=null)
			sqlStrBfr.append(" AND property.created_at >= "+prpSrch.getCreatedFrom());
	    if(prpSrch.getCreatedBy()!=null)
			sqlStrBfr.append(" AND property.created_by IN("+prpSrch.getCreatedByAsString()+")");
		if(prpSrch.getApprovedFrom()!=null && prpSrch.getApprovedTo()!=null)
			sqlStrBfr.append(" AND property.approved_at BETWEEN "+prpSrch.getApprovedFrom()+" AND "+prpSrch.getApprovedTo()+" ");
		else if(prpSrch.getApprovedFrom()==null && prpSrch.getApprovedTo()!=null)
			sqlStrBfr.append(" AND property.approved_at =< "+prpSrch.getApprovedTo());
		else if(prpSrch.getApprovedTo()==null && prpSrch.getApprovedFrom()!=null)
			sqlStrBfr.append(" AND property.approved_at >= "+prpSrch.getApprovedFrom());
		if(prpSrch.getMinNoOfBedRooms()!=null && prpSrch.getMaxNoOfBedRooms()!=null)
			sqlStrBfr.append(" AND property.bedroomsNo BETWEEN "+prpSrch.getMinNoOfBedRooms()+" AND "+prpSrch.getMaxNoOfBedRooms()+" ");
		else if(prpSrch.getMinNoOfBedRooms()==null && prpSrch.getMaxNoOfBedRooms()!=null)
			sqlStrBfr.append(" AND property.bedroomsNo =< "+prpSrch.getMaxNoOfBedRooms());
		else if(prpSrch.getMaxNoOfBedRooms()==null && prpSrch.getMinNoOfBedRooms()!=null)
			sqlStrBfr.append(" AND property.bedroomsNo >= "+prpSrch.getMinNoOfBedRooms());
		if(prpSrch.getMinNoOfHallRooms()!=null && prpSrch.getMaxNoOfHallRooms()!=null)
			sqlStrBfr.append(" AND property.hallroomsNo BETWEEN "+prpSrch.getMinNoOfHallRooms()+" AND "+prpSrch.getMaxNoOfHallRooms()+" ");
		else if(prpSrch.getMinNoOfHallRooms()==null && prpSrch.getMaxNoOfHallRooms()!=null)
			sqlStrBfr.append(" AND property.hallroomsNo =< "+prpSrch.getMaxNoOfHallRooms());
		else if(prpSrch.getMaxNoOfHallRooms()==null && prpSrch.getMinNoOfHallRooms()!=null)
			sqlStrBfr.append(" AND property.hallroomsNo >= "+prpSrch.getMinNoOfHallRooms());
		if(prpSrch.getMinNoOfBathRooms()!=null && prpSrch.getMaxNoOfBathRooms()!=null)
			sqlStrBfr.append(" AND property.bathroomsNo BETWEEN "+prpSrch.getMinNoOfBathRooms()+" AND "+prpSrch.getMaxNoOfBathRooms()+" ");
		else if(prpSrch.getMinNoOfBathRooms()==null && prpSrch.getMaxNoOfBathRooms()!=null)
			sqlStrBfr.append(" AND property.bathroomsNo =< "+prpSrch.getMaxNoOfBathRooms());
		else if(prpSrch.getMaxNoOfBathRooms()==null && prpSrch.getMinNoOfBathRooms()!=null)
			sqlStrBfr.append(" AND property.bathroomsNo >= "+prpSrch.getMinNoOfBathRooms());
		if(prpSrch.getMinFloorNo()!=null && prpSrch.getMaxFloorNo()!=null)
			sqlStrBfr.append(" AND property.floorNo BETWEEN "+prpSrch.getMinFloorNo()+" AND "+prpSrch.getMaxFloorNo()+" ");
		else if(prpSrch.getMinFloorNo()==null && prpSrch.getMaxFloorNo()!=null)
			sqlStrBfr.append(" AND property.floorNo =< "+prpSrch.getMaxFloorNo());
		else if(prpSrch.getMaxFloorNo()==null && prpSrch.getMinFloorNo()!=null)
			sqlStrBfr.append(" AND property.floorNo >= "+prpSrch.getMinFloorNo());
		if(prpSrch.getSubtype()!=null && prpSrch.getSubtype().length>0)
			sqlStrBfr.append(" AND property.subtype IN ("+prpSrch.getSubTypeAsString()+") ");
		if(prpSrch.getFurnitureStatus()!=null && prpSrch.getFurnitureStatus().length>0)
			sqlStrBfr.append(" AND property.furn_status IN ("+prpSrch.getFurnitureStatusAsString()+") ");
		if(prpSrch.getFinishingStatus()!=null && prpSrch.getFinishingStatus().length>0)
			sqlStrBfr.append(" AND property.finish_status IN ("+prpSrch.getFinishingStatusAsString()+") ");
		if(prpSrch.getPaymentType()!=null && prpSrch.getPaymentType().length>0)
			sqlStrBfr.append(" AND property.pay_type IN ("+prpSrch.getPaymentTypesAsString()+") ");
		if(prpSrch.getRentalPeriod()!=null && prpSrch.getRentalPeriod().length>0)
			sqlStrBfr.append(" AND property.rental_period IN ("+prpSrch.getRentalPeriodsAsString()+") ");
		// Paging Conditions...
		if(cond!=null){
			sqlStrBfr.append(cond.getOrderByStatement());// ORDER BY property.id DESC
			sqlStrBfr.append(cond.getLimitStatement());// LIMIT 0,20
		}
		System.out.println("Search SQL: "+sqlStrBfr.toString());
		try {
			st= conn.createStatement();
			rs = st.executeQuery(sqlStrBfr.toString());
			while(rs.next()){
				Property p = new Property();
				p.setId(rs.getInt("property.id"));
				p.setDescription(rs.getString("description"));
				p.setStatus(rs.getInt("property.status"));
				p.setPropertyFor(rs.getInt("property.prp_for"));
				p.setPrice(rs.getInt("property.price"));
				p.setArea(rs.getInt("property.area"));
				p.setNoOfBedRooms(rs.getInt("property.bedroomsNo"));
				p.setNoOfHallRooms(rs.getInt("property.hallroomsNo"));
				p.setNoOfBathRooms(rs.getInt("property.bathroomsNo"));
				p.setFloorNo(rs.getInt("property.floorNo"));
				p.setImageCount(rs.getInt("property.img_count"));
				System.out.println("CCCCCCCCCCCCCCC"+rs.getInt("property.img_count")); 
				p.setSubtype(rs.getInt("property.subtype"));
				p.setPropertyType(new PropertyType(rs.getInt("prop_type.id"), rs.getString("prop_type.name_ar"), rs.getString("prop_type.name_en")));
				p.setCountry(new Location(rs.getInt("country.id"),rs.getString("country.name_ar"),rs.getString("country.name_en")));
				p.setState(new Location(rs.getInt("state.id"),rs.getString("state.name_ar"),rs.getString("state.name_en")));
				// Seller Info
				p.setCreatedBy(new User(rs.getInt("users.id"),rs.getString("users.firstname"),rs.getString("users.lastname"),rs.getString("users.email"),rs.getString("users.mobile")));
				pal.add(p);
			}
			System.out.println("Results: "+pal.size());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try{
				if(rs !=null && !rs.isClosed())	rs.close();
				if(st !=null && !st.isClosed())	st.close();
				if(conn !=null && !conn.isClosed())	conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return pal;
	}

	public int addToFavorites(int userID, String[] propertyIDs){
		DBConnection dbcon = new DBConnection();
		Connection conn = dbcon.getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement("INSERT INTO favorites values(?,?)");
			for (String s: propertyIDs) {
				pst.setInt(1, userID);
				pst.setInt(2, Integer.parseInt(s));
				pst.addBatch();
			}
			pst.executeBatch();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(pst !=null && !pst.isClosed())	pst.close();
				if(conn !=null && !conn.isClosed())	conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public Integer[] getFavoritesPropertyIDs(int userID) {
		DBConnection dbcon = new DBConnection();
		Connection conn = dbcon.getConnection();
		PreparedStatement pst= null;
		ResultSet rs = null;
		Integer[] propertyIDs = new Integer[]{};
		try {
			pst= conn.prepareStatement("SELECT property_id FROM favorites WHERE user_id =?");
			pst.setInt(1, userID);
			rs = pst.executeQuery();
			int i=0;
			while(rs.next()){
				propertyIDs[i] = rs.getInt(1);
				i++;
			}
			if(propertyIDs.length==0)
				propertyIDs[0]=0;
			System.out.println("Fav length: "+propertyIDs.length);
			System.out.println("Fav propertyID: "+propertyIDs[0]);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try{
				if(rs !=null && !rs.isClosed())	rs.close();
				if(pst !=null && !pst.isClosed())	pst.close();
				if(conn !=null && !conn.isClosed())	conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return propertyIDs;
	}
	public void updatePropertyImagesCount(int propertyID, int imageCount) {
		DBConnection dbcon = new DBConnection();
		Connection conn = dbcon.getConnection();
		PreparedStatement pst = null;
		try {
			String strSQL = "UPDATE property SET img_count=? WHERE id=?";
			pst = conn.prepareStatement(strSQL);
			pst.setInt(1, imageCount);
			pst.setInt(2, propertyID);
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				if(pst !=null && !pst.isClosed())	pst.close();
				if(conn !=null && !conn.isClosed())	conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * delete the property from the database
	 * @param p
	 */
	public int deleteProperty(int propertyID){
		DBConnection dbcon = new DBConnection();
		Connection conn = dbcon.getConnection();
		PreparedStatement pst = null;
		int result = 0;
		try {
			String strSQL = "DELETE FROM property WHERE id= ?";
			System.out.println("SQL: "+strSQL);
			pst = conn.prepareStatement(strSQL);
			pst.setInt(1, propertyID);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			result = 0;
		} finally{
			try {
				if(pst !=null && !pst.isClosed())	pst.close();
				if(conn !=null && !conn.isClosed())	conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
}
