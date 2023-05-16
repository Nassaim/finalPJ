//package kr.or.ddit.common.sheet;
//
//import com.google.api.client.auth.oauth2.Credential;
//import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
//import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
//import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
//import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
//import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
//import com.google.api.client.http.HttpTransport;
//import com.google.api.client.http.javanet.NetHttpTransport;
//import com.google.api.client.json.JsonFactory;
//import com.google.api.client.json.jackson2.JacksonFactory;
//import com.google.api.client.util.store.FileDataStoreFactory;
//import com.google.api.services.sheets.v4.Sheets;
//import com.google.api.services.sheets.v4.SheetsScopes;
//import com.google.api.services.sheets.v4.model.ValueRange;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import java.io.IOException;
//import java.io.InputStream;
//import java.io.InputStreamReader;
//import java.security.GeneralSecurityException;
//import java.util.Collections;
//import java.util.List;
//import javax.inject.Inject;
//
//@Controller
//public class SheetController {
//	
//	@Inject
//	private SheetService sheetsService;
//
//    private static final String APPLICATION_NAME = "Google Sheets API";
//    private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();
//    private static final String TOKENS_DIRECTORY_PATH = "tokens";
//    
//
//    @GetMapping("/getData")
//    public void getData(Model model, @RequestParam String spreadsheetId, @RequestParam String range) throws IOException {
//        ValueRange data = sheetsService.getData(spreadsheetId, range);
//        // View에 데이터 전달
//        model.addAttribute("data", data);
//    }
//
//    @PostMapping("/updateData")
//    public void updateData(Model model, @RequestParam String spreadsheetId, @RequestParam String range,
//            @RequestBody String json) throws IOException {
//        sheetsService.updateData(spreadsheetId, range, json);
//    }
//	
//	
//}
//
//
//	
//	
///*
//	@Inject
//    private SheetService sheetService;
//	
//	@GetMapping("/newSheet")
//	public String connect() {
//		return "admins/statistics/sheetTest";
//	}
//	
//    @RequestMapping(value = "/createsheet", method = RequestMethod.POST)
//    public String createSheet(HttpServletRequest request, HttpServletResponse response, Model model) {
//    	try {
//            sheetService.createSpreadsheet("새로운 스프레드시트");
//            model.addAttribute("message", "새로운 스프레드시트가 생성되었습니다.");
//        } catch (Exception e) {
//            model.addAttribute("message", "스프레드시트 생성에 실패했습니다.");
//            e.printStackTrace();
//        }
//        return "result";
//    }
// 
//    @GetMapping("/temp")
//    public String tempController() {
//    	return "admins/statistics/temp";
//    }
//*/    
//
//
//	/* 계정 정보 */
////	private String clientId = "454479238611-2v90rdqh2morriaalsuaaorucsn1knog.apps.googleusercontent.com";
////	private String clientSecret = "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";
////	private String APPLICATION_NAME = "CodeCove";
//	
//	/*  OAuth 2.0 스코프 (Google Sheets API 사용 권한) */
////	private List<String> scopes = Collections.singletonList(SheetsScopes.SPREADSHEETS);
//
//	
//	/* GoogleAuthorizationCodeFlow 객체 생성 */
////	private GoogleAuthorizationCodeFlow flow;
////	
////	public SheetController() {
////		try {
////			flow = new GoogleAuthorizationCodeFlow.Builder(new NetHttpTransport(), new JacksonFactory(),
////				clientId, clientSecret, scopes)
////				.setDataStoreFactory(new FileDataStoreFactory(new java.io.File("D:\\FinalProject\\sheet")))
////				.setAccessType("offline")
////				.build();
////		} catch (IOException e) {
////			e.printStackTrace();
////		}
////	
//		/* 로컬 서버 리시버 생성 */
////        LocalServerReceiver receiver = new LocalServerReceiver.Builder().setPort(80).build();
//        
//        /* 인증 코드 요청 생성 */
////        AuthorizationCodeRequestUrl authorizationUrl = flow.newAuthorizationUrl().setRedirectUri("http://localhost:80/Callback");
//        
//        /* 사용자에게 인증 코드를 받을 수 있는 URL 제공 */
////        System.out.println("다음 URL을 브라우저에 입력하세요:");
////        System.out.println(authorizationUrl);
//        
//        /* 사용자가 인증 코드를 입력하고 앱에서 사용할 수 있는 Credential 객체 생성 */
////        try {
////        	System.out.print("인증 코드를 입력하세요: ");
////        	String code = new BufferedReader(new InputStreamReader(System.in)).readLine();
////        	TokenResponse response = flow.newTokenRequest(code).setRedirectUri("http://localhost:80/Callback").execute();
////        	Credential credential = flow.createAndStoreCredential(response, "user");
////        	
////        	HttpTransport httpTransport = new NetHttpTransport();
////        	JsonFactory jsonFactory = new JacksonFactory();
////        	Sheets service = new Sheets.Builder(httpTransport, jsonFactory, credential)
////        			.setApplicationName(APPLICATION_NAME)
////        			.build();
////        } catch (IOException e) {
////        	e.printStackTrace();
////		}
////	}
//	
//	
//
//
//
//
//
//
//
//
//
//
//
