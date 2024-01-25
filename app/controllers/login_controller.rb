class LoginController < ApplicationController
    layout "login_layout"
    skip_before_action :validar_login

    def index
    end

    def sair
        cookies["treinamento_logado"] = { value: nil, expires: -1.year.from_now }
        redirect_to "/login"
    end

    def esqueci
    end

    def recuperar
        adm = Administrador.where(email: params[:email]).first
        if adm.blank?
            @erro = "Email não cadastrado em nossa base de dados!"
            return render :esqueci
        end

        flash["success"] = "Email foi enviado para troca de senha #{adm.email}"

        token = TokenAcesso.create(token: SecureRandom.uuid, key: adm.email)
        url = "http://localhost:3000/troca-senha?token=#{token.token}"

        # EnviaEmail.troca_senha(url)
        redirect_to "/login"
    end

    def troca_senha
        token = TokenAcesso.where(token: params[:token]).first
        if token.blank?
            flash[:error] = "Token inválido!"
            return redirect_to "/login"
        end
    end

    def altera_senha
        token = TokenAcesso.where(token: params[:token]).first
        if token.blank?
            flash[:error] = "Token inválido!"
            return redirect_to "/login"
        end
        token.destroy

        if params["senha"] != params["csenha"]
            flash[:error] = "Senha não é igual a confirmação de senha"
            return redirect_to "/login"
        end

        adm = Administrador.where(email: token.key).first
        adm.senha = params[:senha]
        adm.save

        flash[:success] = "Senha alterada com sucesso !"
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
