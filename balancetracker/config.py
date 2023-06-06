class Config(object):
    DEBUG = False
    TESTING = False
    CSRF_ENABLED = True
    #Database URL
    #TO DO USE A SECRET
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:secret@mysql:3306/clients'


class DevelopmentConfig(Config):
    DEVELOPMENT = True
    DEBUG = True
