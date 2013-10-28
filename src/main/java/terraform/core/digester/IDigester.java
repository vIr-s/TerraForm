package terraform.core.digester;

import java.util.List;

import terraform.common.fbtypes.UserLike;

public interface IDigester {
	public List<String> getSearchTerms(List<UserLike> data);
}
