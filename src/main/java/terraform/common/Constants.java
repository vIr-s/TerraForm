package terraform.common;

public interface Constants {
	public interface CookieName {
		String ID = "tfid";
	}

	public interface FB {
		public interface ParamName {
			String CODE = "code";
		}
	}

	public interface RequestAttrName {
		String SEARCH_TERM = "searchTerm";
		String LOCATION = "location";
	}

    public interface URL{
        String DEFAULT_IMAGE_URL = "https://si0.twimg.com/profile_images/2730930329/fa574a41aa80b8c5333e21086a1d5f4b.jpeg";
    }
}
