class LoginController < ApplicationController
    layout "login_layout"
    skip_before_action :validar_login

    def index
    end

    def sair
        cookies["treinamento_logado"] = { value: nil, expires: -1.year.from_now }
        redirect_to "/login"
    end

    def login
        adm = Administrador.where(email: params[:email]).first
        if adm.blank?
            @erro = "Login ou senha inválidos"
            return render :index
        end

        unless CryptoTransform::senha_igual?(params[:senha], adm.senha)
            @erro = "Login ou senha inválidos"
            return render :index
        end

        time = params[:logado].present? ? 1.year.from_now : 1.hour.from_now

        token = JwtTransform::encode({
            id:  adm.id,
            nome: adm.nome,
            email: adm.email
        })

        cookies["treinamento_logado"] = { value: token, expires: time, httponly: true }

        redirect_to "/pedidos"
    end
end
