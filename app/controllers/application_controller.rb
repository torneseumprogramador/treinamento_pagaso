class ApplicationController < ActionController::Base
    before_action :validar_login


    private
    def validar_login
        if request.cookies["treinamento_logado"].blank?
            return redirect_to "/login"
        end

        token = request.cookies["treinamento_logado"]
        adm_hash = JwtTransform::decode(token)
        if adm_hash.blank?
            return redirect_to "/login"
        end

        @adm = Administrador.new(adm_hash)
    rescue
        redirect_to "/login"
    end
end