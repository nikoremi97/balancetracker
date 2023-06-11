class Config(object):
    DEBUG = False
    TESTING = False
    CSRF_ENABLED = True


class DevelopmentConfig(Config):
    DEVELOPMENT = True
    DEBUG = True
