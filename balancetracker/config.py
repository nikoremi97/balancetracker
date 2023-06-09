class Config(object):
    DEBUG = False
    TESTING = False
    CSRF_ENABLED = True
    #Database URL
    #TO DO USE A SECRET env var
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://admin:K2J4vFbk7AosgctcdDMUqJx4H@balancetracker-clients.cluster-cx71efueaba7.us-east-1.rds.amazonaws.com:3306/clients'


class DevelopmentConfig(Config):
    DEVELOPMENT = True
    DEBUG = True
