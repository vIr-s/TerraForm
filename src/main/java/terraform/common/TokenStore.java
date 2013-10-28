package terraform.common;

import java.util.HashMap;

public class TokenStore {
	private TokenStore() {
	}

	private static final HashMap<String, String> store = new HashMap<String, String>();

	public static void addToken(String id, String token) {
		store.put(id, token);
	}

	public static String getToken(String id) {
		return store.get(id);
	}
}
