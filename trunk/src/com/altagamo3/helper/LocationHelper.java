package com.altagamo3.helper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.altagamo3.to.Location;
import com.altagamo3.utils.DBConnection;

public class LocationHelper {

	private static LocationHelper locHelper;

	private static String LOC_COUNTRY = "country";
	private static String LOC_STATE = "state";
	private static String LOC_CITY = "city";
	private static String LOC_DISTRICT = "district";
	private static String LOC_COMPOUND = "compound";
	private static String LOC_ZONE = "zone";
	private static String LOC_SUBAREA = "subarea";
	private static Integer STATUS_ACTIVE = 1;

	private LocationHelper(){}
	public static LocationHelper getInstance(){
		if(locHelper==null)
			locHelper = new LocationHelper();
		return locHelper;
	}

	/**
	 * list all locations whatever their parent is
	 * @param locationType
	 * @param activityStatus 1 for Active, 0 for Inactive, null for All
	 * @return
	 */
	public ArrayList<Location> listLocations(String locationType, Integer activityStatus){
		DBConnection dbcon = new DBConnection();
		Connection conn = dbcon.getConnection();
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Location> lal = new ArrayList<Location>();
		String sqlStr = "select * from "+locationType;
		if(activityStatus!=null)
			sqlStr+=" where active_flag=\'"+activityStatus+"\'";
		System.out.println("SQL: "+sqlStr);
		try {
			st= conn.createStatement();
			rs = st.executeQuery(sqlStr);
			while(rs.next()){
				Location l = new Location();
				l.setId(rs.getInt("id"));
				l.setArabicName(rs.getString("name_ar"));
				l.setEnglishName(rs.getString("name_en"));

				lal.add(l);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				if(rs !=null && !rs.isClosed())	rs.close();
				if(st !=null && !st.isClosed())	st.close();
				if(conn !=null && !conn.isClosed())	conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return lal;
	}

	public ArrayList<Location> listCountries(){
		return listLocations(LOC_COUNTRY,STATUS_ACTIVE);
	}

	public ArrayList<Location> listLocations(String locationType, Integer parentID, Integer activityStatus){
		String parentType = "";
		if(LOC_SUBAREA.equalsIgnoreCase(locationType))
			parentType = LOC_ZONE;
		if(LOC_ZONE.equalsIgnoreCase(locationType))
			parentType = LOC_DISTRICT;
		if(LOC_DISTRICT.equalsIgnoreCase(locationType) || LOC_COMPOUND.equalsIgnoreCase(locationType))
			parentType = LOC_CITY;
		if(LOC_CITY.equalsIgnoreCase(locationType))
			parentType = LOC_STATE;
		if(LOC_STATE.equalsIgnoreCase(locationType))
			parentType = LOC_COUNTRY;

		DBConnection dbcon = new DBConnection();
		Connection conn = dbcon.getConnection();
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Location> lal = new ArrayList<Location>();
		String sqlStr = "SELECT "+locationType+".*, "+parentType+".id AS parent_id, "+parentType+".name_ar AS parent_name_ar, "+parentType+".name_en AS parent_name_en FROM "+locationType+", "+parentType+" WHERE "+locationType+"."+parentType+"_id = "+parentType+".id";
		if(parentID!=null && parentID >=0){
			sqlStr+= " AND "+parentType+"_id = "+parentID;
		}
		if(activityStatus!=null)
			sqlStr+=" AND "+locationType+".active_flag=\'"+activityStatus+"\' AND "+parentType+".active_flag=\'"+activityStatus+"\'";
		System.out.println("SQL: "+sqlStr);
		try {
			st= conn.createStatement();
			rs = st.executeQuery(sqlStr);
			while(rs.next()){
				Location l = new Location();
				l.setId(rs.getInt("id"));
				l.setArabicName(rs.getString("name_ar"));
				l.setEnglishName(rs.getString("name_en"));
				l.setActive(rs.getString("active_flag").equalsIgnoreCase("1")?true:false);
				Location parent = new Location();
				parent.setId(rs.getInt("parent_id"));
				parent.setArabicName(rs.getString("parent_name_ar"));
				parent.setEnglishName(rs.getString("parent_name_en"));
				l.setParentLocation(parent);

				lal.add(l);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				if(rs !=null && !rs.isClosed())	rs.close();
				if(st !=null && !st.isClosed())	st.close();
				if(conn !=null && !conn.isClosed())	conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return lal;
	}

/* List ACTIVE Locations By Parent ID */
	public ArrayList<Location> listActiveCountries(){
		return listLocations(LOC_COUNTRY, 1);
	}
	public ArrayList<Location> listActiveStatesByCountry(int countryID){
		return listLocations(LOC_STATE, countryID, 1);
	}
	public List<Location> listActiveCitiesByState(int stateID) {
		return listLocations(LOC_CITY, stateID, 1);
	}
	public List<Location> listActiveCompoundsByCity(int cityID) {
		return listLocations(LOC_COMPOUND, cityID, 1);
	}
	public List<Location> listActiveDistrictsByCity(int cityID) {
		return listLocations(LOC_DISTRICT, cityID, 1);
	}
	public List<Location> listActiveZonesByDistrict(int dsitrictID) {
		return listLocations(LOC_ZONE, dsitrictID, 1);
	}
	public List<Location> listActiveSubareasByZone(int zoneID) {
		return listLocations(LOC_SUBAREA, zoneID, 1);
	}
/* List All Locations */
	public ArrayList<Location> listAllCountries(){
		return listLocations(LOC_COUNTRY, null);
	}
	public ArrayList<Location> listAllStates(){
		return listLocations(LOC_STATE, null);
	}
	public List<Location> listAllCities() {
		return listLocations(LOC_CITY, null);
	}
	public List<Location> listAllCompounds() {
		return listLocations(LOC_COMPOUND, null);
	}
	public List<Location> listAllDistricts() {
		return listLocations(LOC_DISTRICT, null);
	}
	public List<Location> listAllZones() {
		return listLocations(LOC_ZONE, null);
	}
	public List<Location> listAllSubareas() {
		return listLocations(LOC_SUBAREA, null);
	}
/* List All Locations */
	public ArrayList<Location> listAllStatesByCountry(Integer countryID){
		return listLocations(LOC_STATE, countryID, null);
	}
	public List<Location> listAllCitiesByState(Integer stateID) {
		return listLocations(LOC_CITY, stateID, null);
	}
	public List<Location> listAllCompoundsByCity(Integer cityID) {
		return listLocations(LOC_COMPOUND, cityID, null);
	}
	public List<Location> listAllDistrictsByCity(Integer cityID) {
		return listLocations(LOC_DISTRICT, cityID, null);
	}
	public List<Location> listAllZonesByDistrict(Integer districtID) {
		return listLocations(LOC_ZONE, districtID, null);
	}
	public List<Location> listAllSubareasByZone(Integer zoneID) {
		return listLocations(LOC_SUBAREA, zoneID, null);
	}
}