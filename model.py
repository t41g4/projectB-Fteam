from flask_sqlalchemy import SQLAlchemy

def init_db(app):
    app.config['SQLALCHEMY_DATABASE_URI'] = \
        "{db}://{user}:{password}@{host}/{dbName}?charset=utf8".format(
            db = "mysql",
            user = "probc2025",
            password = "probc2025",
            host = "localhost",
            dbName = "probc2025"
        )
    db.init_app(app)
    return db

db = SQLAlchemy()
class ユーザ(db.Model):
    __tablename__ = "ユーザ"
    ID = db.Column(db.Integer, primary_key = True)
    氏名 = db.Column(db.String(50))
    所属ID = db.Column(db.Integer)
    電話番号 = db.Column(db.String(50))
    メールアドレス = db.Column(db.String(100))
    #住所= db.Column(db.String(100))
class 所属(db.Model):
    __tablename__ = "所属"
    ID = db.Column(db.Integer, primary_key = True)
    所属分類 = db.Column(db.String(50))
    所属名 = db.Column(db.String(100))
class 拾得物(db.Model):
    __tablename__ = "拾得物"
    ID = db.Column(db.Integer, primary_key = True)
    拾得物分類ID = db.Column(db.Integer)
    拾得場所 = db.Column(db.String(100))
    色 = db.Column(db.String(50))
    特徴 = db.Column(db.String(100))
    その他の物品 = db.Column(db.String(50))
    画像 = db.Column(db.String(100))
    拾得日 = db.Column(db.DateTime)
    保管期間 = db.Column(db.DateTime)
class 拾得物分類(db.Model):
    __tablename__ = "拾得物分類"
    ID = db.Column(db.Integer, primary_key = True)
    大分類 = db.Column(db.String(50))
    物品名 = db.Column(db.String(100))
    頭１ = db.Column(db.String(50))
    頭２ = db.Column(db.String(50))
    五十音 = db.Column(db.String(50))
    貴重品 = db.Column(db.Integer)
class 拾得物管理状況(db.Model):
    __tablename__ = "拾得物管理状況"
    ID = db.Column(db.Integer, primary_key = True)
    管理者ID = db.Column(db.Integer)
    拾得物ID = db.Column(db.Integer)
    変更日時 = db.Column(db.DateTime)
    変更内容 = db.Column(db.String(100))
class 遺失物捜索依頼(db.Model):
    __tablename__ = "遺失物捜索依頼"
    ID = db.Column(db.Integer, primary_key=True)
    氏名 = db.Column(db.String(50), nullable=False)
    所属ID = db.Column(db.Integer, nullable=False)
    電話番号 = db.Column(db.String(15), nullable=False)
    メールアドレス = db.Column(db.String(50), nullable=False)
    特徴 = db.Column(db.String(100), nullable=False)
