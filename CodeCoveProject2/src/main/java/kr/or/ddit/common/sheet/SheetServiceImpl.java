//package kr.or.ddit.common.sheet;
//
//import java.io.FileInputStream;
//import java.io.IOException;
//import java.security.GeneralSecurityException;
//import java.util.ArrayList;
//import java.util.Collections;
//import java.util.List;
//import org.springframework.stereotype.Service;
//import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
//import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
//import com.google.api.client.googleapis.util.Utils;
//import com.google.api.client.http.HttpTransport;
//import com.google.api.client.json.JsonFactory;
//import com.google.api.client.json.jackson2.JacksonFactory;
//import com.google.api.services.sheets.v4.Sheets;
//import com.google.api.services.sheets.v4.SheetsScopes;
//import com.google.api.services.sheets.v4.model.ValueRange;
//import com.google.gson.JsonArray;
//import com.google.gson.JsonObject;
//import com.google.gson.JsonParser;
//
//
//@Service
//public class SheetServiceImpl implements SheetService {
//	
//	private Sheets sheets;
//	
//	public SheetServiceImpl() throws IOException, GeneralSecurityException {
//        HttpTransport httpTransport = GoogleNetHttpTransport.newTrustedTransport();
//        JsonFactory jsonFactory = JacksonFactory.getDefaultInstance();
//
//        // 구글 인증 정보 설정
//        GoogleCredential credential = GoogleCredential.fromStream(new FileInputStream("client_secret.json"))
//                .createScoped(Collections.singleton(SheetsScopes.SPREADSHEETS));
//
//        // Sheets 객체 생성
//        sheets = new Sheets.Builder(httpTransport, jsonFactory, credential)
//                .setApplicationName("Google Sheets API Example")
//                .build();
//    }
//	
//    @Override
//    public ValueRange getData(String spreadsheetId, String range) throws IOException {
//        // 데이터 조회 요청
//        return sheets.spreadsheets().values().get(spreadsheetId, range).execute();
//    }
//    
//    @Override
//    public void updateData(String spreadsheetId, String range, String json) throws IOException {
//        // JSON 데이터 파싱
//        JsonParser parser = new JsonParser();
//        JsonObject jsonObject = parser.parse(json).getAsJsonObject();
//
//        // ValueRange 객체 생성
//        List<List<Object>> values = new ArrayList<>();
//        JsonArray rows = jsonObject.getAsJsonArray("rows");
//        for (int i = 0; i < rows.size(); i++) {
//            List<Object> row = new ArrayList<>();
//            JsonArray cols = rows.get(i).getAsJsonArray();
//            for (int j = 0; j < cols.size(); j++) {
//                row.add(cols.get(j).getAsString());
//            }
//            values.add(row);
//        }
//        ValueRange data = new ValueRange().setValues(values);
//
//        // 데이터 업데이트 요청
//        sheets.spreadsheets().values().update(spreadsheetId, range, data).setValueInputOption("RAW").execute();
//    }
//
//	
////
////	@Inject
////	private SheetMapper sheetMapper;
////
////	private static final String APPLICATION_NAME = "CodeCove";
////	private static final java.io.File DATA_STORE_DIR = new java.io.File(System.getProperty("user.home"), ".credentials/sheets.googleapis.CodeCove");
////
////	/**
////	 * Global instance of the {@link FileDataStoreFactory}.
////	 */
////	private static FileDataStoreFactory DATA_STORE_FACTORY;
////
////	/**
////	 * Global instance of the JSON factory.
////	 */
////	private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();
////
////	/**
////	 * Global instance of the HTTP transport.
////	 */
////	private static HttpTransport HTTP_TRANSPORT;
////
////	/**
////	 * Google Sheet API 권한을 SCOPE로 지정
////	 */
////	private static final List<String> SCOPES = Arrays.asList(SheetsScopes.SPREADSHEETS);
////
////	/**
////	 * HTTP_TRANSPORT, DATA_STORE_FACTORY 초기화
////	 */
////	static {
////		try {
////			HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
////			DATA_STORE_FACTORY = new FileDataStoreFactory(DATA_STORE_DIR);
////		} catch (Throwable t) {
////			t.printStackTrace();
////			System.exit(1);
////		}
////	}
////
////	/**
////	 * OAUTH 2.0 연동시 사용될 callback용 local receiver 포트 지정
////	 */
////	private static final int LOCAL_SERVER_RECEIVER_PORT = 80;
////
////	/**
////	 * 인증 모드 2개
////	 */
////	private enum AuthMode {
////		OAUTH20, SERVICE_ACCOUNT
////	}
////
////	/**
////	 * OAUTH 2.0용 credential 생성
////	 *
////	 * @return Credential object.
////	 * @throws IOException
////	 */
////    public static Credential getOauth2Authorize() throws IOException {
////    	 // OAUTH 2.0용 secret josn 로드
//////        InputStream in = Quickstart.class.getResourceAsStream("/client_secret.json");
//////        GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(JSON_FACTORY, new InputStreamReader(in));
////    	return null;
////    }
////
////	@Override
////	public SheetVO createSpreadsheet(String title) throws IOException {
////		// TODO Auto-generated method stub
////		return null;
////	}
////
////	@Override
////	public SheetVO getSpreadsheet(String id) {
////		// TODO Auto-generated method stub
////		return null;
////	}
////
////}
////
////// @Override
////// public SheetVO createSpreadsheet(String title) throws IOException {
////// Spreadsheet spreadsheet = new Spreadsheet().setProperties(
////// new SpreadsheetProperties().setTitle(title)
////// );
////// spreadsheet = sheets.spreadsheets().create(spreadsheet).execute();
//////
////// SheetVO sheetVO = new SheetVO();
////// sheetVO.setId(spreadsheet.getSpreadsheetId());
////// sheetVO.setTitle(spreadsheet.getProperties().getTitle());
////// sheetVO.setUrl(spreadsheet.getSpreadsheetUrl());
//////
////// return sheetVO;
////// }
//////
////// @Override
////// public SheetVO getSpreadsheet(String id) {
////// return sheetMapper.selectSpreadsheetById(id);
// }
