class Account < ActiveRecord::Base
  def self.get_saml_settings(url_base)
    # this is just for testing purposes.
    # should retrieve SAML-settings based on subdomain, IP-address, NameID or similar
    settings = OneLogin::RubySaml::Settings.new

    #url_base ||= "http://localhost:3000"
    url_base ||= "http://xx.xx.xx.xx:3000"

    # Example settings data, replace this values!

    # When disabled, saml validation errors will raise an exception.
    settings.soft = true

    #SP section
    settings.issuer                         = url_base + "/saml/metadata"
    settings.assertion_consumer_service_url = url_base + "/saml/acs"
    settings.assertion_consumer_logout_service_url = url_base + "/saml/logout"

    #onelogin_app_id = "<onelogin-app-id>"

    # IdP section
    settings.idp_entity_id                  = "https://dev-api.kuuga.services"
    settings.idp_sso_target_url             = "https://dev-api.kuuga.services"
    settings.idp_slo_target_url             = "https://dev-api.kuuga.services"
    settings.idp_cert                       = "MIIC4DCCAcigAwIBAgIUW6jgs6LIRewNrbznleCci2uF37QwDQYJKoZIhvcNAQELBQAwKjEoMCYGA1UEAwwfS3V1Z2EgRmVkZXJhdGVkIFNTTyBDZXJ0aWZpY2F0ZTAeFw0yMDAxMjQwNjExMDVaFw0yMzAxMjMwNjExMDVaMCoxKDAmBgNVBAMMH0t1dWdhIEZlZGVyYXRlZCBTU08gQ2VydGlmaWNhdGUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDCRNGtr1/o/VEezzJhtJC/A2/5MdwtN8e5V0W7m5nL4TD++S6CqQQT+QA/oqP6+V/0CiPamigQwXV6wF8aD6AJmlkukh7L7HHqJord/6duZop9MnEVPVKLDIc5VGhFWWFnROMD5CK1a5yabL3ViXiffFzXVU+qhEBi+e7Cphi0TtRn/+3Avkxh8PkIyGj9Fd38ee1N5GUdshzwRbqYRCVttjHrI3RgLDU2zxCJRB1awD2A4R7tPRU6/ixjuCV1RB/PpUZ6p4XpBB20NLv+XkdZ5Ld/MKVFkvpVV120nit9ra4EQWstooaWTPbItMUaUpIj3aYO6rl0+YcIo05yPiVZAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAH7cUEkx2+510nJ8GRj3wjHkGOaZe8xtZeZaMiO0/XK/QQLRGrFno03gCytABD2YVKtpQz49u2zUlozTdDOeN78JGEpPVFtF/6jqRdNKPtwLwYLw8H68WudF3+U/gwvv8kpFEHVNM62xW9M6Co3IAkeihYB4WOkhNnkTN5LPvjxvA/XQJYkmmjGmhBQ37KhvnJ+yvWmFV1zSQ2/VSsp9AOICyS6oUadND4EpF9VQ3/wegoX5OXu6qXT4zHUB4dV6j5JPkUPnt6zJFaXjORk+QVoNfnrI6rvZ0Invz4bILRVeKqvtYXXNu1yRsCVZnOMYTldBQGSq9jNmzYXnbZThzb8="



    # or settings.idp_cert_fingerprint           = ""
    #    settings.idp_cert_fingerprint_algorithm = XMLSecurity::Document::SHA1

    settings.name_identifier_format         = "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"

    # Security section
    settings.security[:authn_requests_signed] = false
    settings.security[:logout_requests_signed] = false
    settings.security[:logout_responses_signed] = false
    settings.security[:metadata_signed] = false
    settings.security[:digest_method] = XMLSecurity::Document::SHA1
    settings.security[:signature_method] = XMLSecurity::Document::RSA_SHA1

    settings
  end
end
