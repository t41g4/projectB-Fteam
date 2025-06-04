from flask import request, render_template, redirect
import controller

def create_route(app):

    @app.route("/json", methods=["GET","POST"])
    def json():
        if "data" in request.args:
            d = request.args.get("data")
            if d in ["user","item","category","dept"]:
                return controller.json(d)
        return("GETパラメータを指定してください")

    @app.route("/")
    def top():
        return render_template("top.html")

    @app.route("/item_list")
    def item_list():
        return render_template("item_list.html")

    @app.route("/item_detail")
    def item_detail():
        return render_template("syousai.html")

    @app.route("/reg_user")
    def reg_user():
        return render_template("reg_user.html")

    @app.route("/reg_item")
    def reg_item():
        return render_template("reg_item.html")

    @app.route("/req_item")
    def req_item():
        return render_template("req_item.html")

    @app.route("/req_list")
    def req_list():
        return render_template("req_list.html")

    @app.route("/dl")
    def dl():
        return render_template("dl.html")

    @app.route("/dlp", methods=["POST"])
    def dlp():
        return "帳票を出力しました（仮）"
