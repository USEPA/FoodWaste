from typing import Optional, List, Mapping

METADATA_URL1 = "https://testserver1.com/saml/sso/metadata"
METADATA_URL2 = "https://testserver2.com/saml/sso/metadata"


def get_metadata_auto_conf_urls(user_id: Optional[str] = None) -> List[Optional[Mapping[str, str]]]:  # noqa: E501
    """Fixture for returning metadata autoconf URL(s) based on the user_id.

    Args:
        user_id (str, optional): User identifier: username or email. Defaults to None.  # noqa: E501

    Returns:
        list: Either an empty list or a list of valid metadata URL(s)
    """
    if user_id == "nonexistent_user@example.com":
        return []
    if user_id == "test@example.com":
        return [{"url": METADATA_URL1}]
    return [{"url": METADATA_URL1}, {"url": METADATA_URL2}]
