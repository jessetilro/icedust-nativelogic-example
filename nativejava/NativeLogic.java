package nativejava;

import java.net.URL;
import java.net.MalformedURLException;
import java.net.URLDecoder;

public class NativeLogic {	
	public static float computePrice(String transporter, float weight) {
		if (transporter == "PostNL") {
			if (weight < 2) {
				return 6.75f;
			} else {
				return 8.45f;
			}
		} else if (transporter == "DHL") {
			if (weight < 10) {
				return 5.75f;
			} else {
				return 8.75f;
			}
		} else {
			return 0.0f;
		}
	}
	
	public static String determineTransporter(String code) {
		if (code == null) { return "Unknown"; }
		
		if (code.substring(0,2).equals("3S")) {
			return "PostNL";
		} else if (code.substring(0,2).equals("1Z")) {
			return "DHL";
		} else {
			return "Unknown";
		}
	}
	
	public static String parseTrackAndTraceCode(String url) {
		try {
			URL urlObject = new URL(url);
			String query = urlObject.getQuery();
			for (String pair : query.split("&")) {
				String[] keyValue = pair.split("=");
				if (keyValue[0].equals("code")) {
					return keyValue[1];
				}
			}
			
			return null;
		} catch(MalformedURLException e) {
			return null;
		}
	}
}