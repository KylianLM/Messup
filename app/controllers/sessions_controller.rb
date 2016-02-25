class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # Si l'utilisateur existe et que le mot est correcte
    if user && user.authenticate(params[:password])
      # On sauvegarde l'utilisateur pour qu'il soit connecté
      # lorsqu'il navigue sur le site
      session[:user_id] = user.id
      redirect_to '/'
    else
      # Si l'utilisateur n'est pas trouvé ou alors
      # Si son mot de passe est incorrecte
      # On le redirige vers la page login
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end