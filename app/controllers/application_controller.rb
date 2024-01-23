class ApplicationController < ActionController::Base
    before_action :validar_login


    private
    def validar_login
        if request.cookies["treinamento_logado"].blank?
            return redirect_to "/login"
        end

        @adm = Administrador.new(JSON.parse(request.cookies["treinamento_logado"]))
    rescue
        redirect_to "/login"
    end
end