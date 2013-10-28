package terraform.core.digester;

import java.util.ArrayList;
import java.util.List;

import terraform.common.fbtypes.UserLike;

public class SportsDigester implements IDigester {

	private static SportsDigester instance = new SportsDigester();

	private SportsDigester() {
	}

	public static SportsDigester getInstance() {
		return instance;
	}

	@Override
	public List<String> getSearchTerms(List<UserLike> data) {
		List<String> terms = new ArrayList<String>();

		return terms;
	}
}
