class GossipsController < ApplicationController
  
  def index
    @gossips = Gossip.all
  end

  def show
  
   @gossip = Gossip.find(params["id"])
  end

  def new
    @gossips = Gossip.new
  end 

  def create
    user = User.find(1)
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: user.id)

    if @gossip.save
      redirect_to(root_path, notice: 'Le potin a été correctement enregistré')
    else
      flash.now[:alert] = 'mauvaises entrées de formulaire'
      render(action: 'new')
    end
  end



  


  def edit
    @gossips = Gossip.find(params["id"])
     # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
     @gossips = Gossip.find(params["id"])
     @gossips.update(gossips_params)
     redirect_to gossips_path
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end

  def destroy
    @gossips = Gossip.find(params["id"])
    @gossips.destroy
    redirect_to_gossip_path
  end

  private

  def gossips_params
    params.require(:gossip).permit(:title, :content)
  end
end
