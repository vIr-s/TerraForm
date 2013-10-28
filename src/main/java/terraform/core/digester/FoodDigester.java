package terraform.core.digester;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import terraform.common.fbtypes.UserLike;

public class FoodDigester implements IDigester {

	private static final FoodDigester instance = new FoodDigester();

	private static final HashSet<String> SEARCH_TERMS = new HashSet<String>();

	static {
		SEARCH_TERMS.add("food");
		SEARCH_TERMS.add("beverages");
		SEARCH_TERMS.add("grocery");
		SEARCH_TERMS.add("drink");
		SEARCH_TERMS.add("restaurant");
		SEARCH_TERMS.add("cafe");
		SEARCH_TERMS.add("bar");
		SEARCH_TERMS.add("cooking");
		SEARCH_TERMS.add("kitchen");
	}

	private FoodDigester() {
	}

	public static FoodDigester getInstance() {
		return instance;
	}

	@Override
	public List<String> getSearchTerms(List<UserLike> data) {
		List<String> searchTerms = new ArrayList<String>();

		for (UserLike ul : data) {
			String pageType = ul.type.toLowerCase();
			for (String key : SEARCH_TERMS) {
				if (pageType.indexOf(key) != -1) {
					searchTerms.add(ul.name);
					break;
				}
			}
		}

		return searchTerms;
	}
}
