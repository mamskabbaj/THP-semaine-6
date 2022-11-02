class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  def show
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
  end

  def new
    @gossips = Gossip.new
  end

  def create
    user = User.find(1)
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: user.id)

    if @gossip.save
      redirect_to gossips_path
    
    end
  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end

  private

  def gossips_params
    params.require(:gossip).permit(:title, :content)
  end
end
