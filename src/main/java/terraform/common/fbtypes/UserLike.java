package terraform.common.fbtypes;

import com.restfb.Facebook;

public class UserLike {
	@Facebook
	public String type;

	@Facebook
	public String name;

	@Override
	public String toString() {
		return String.format("%s (%s)", name, type);
	}
}
