# neu für #02 to access the path (i.e. the URL) of the "new author" page
class AuthorsController < ApplicationController
    def new
        @author = Author.new # 03: war davor noch nicht da - jetzt neue Instanz erstellen?!
      end

      def edit
        @author = Author.find(params[:id])
      end
  
      def show # 03: ich glaub, das brauch ich nicht - in #07 aber schon?!
        @author = Author.find(params[:id])
      end
  
      def index # 03 - damit kann man alle Autoren adressieren?!
        @authors = Author.all
      end
  
      def create
        @author = Author.new(author_params)
        if @author.save
            redirect_to root_path, notice: 'Success!'
        else 
          render 'edit' # vor der #09 war es ":new" und vor der #10 ein 'new'
        end
      end

      def update
        @author = Author.find(params[:id])
       
        if @author.update(author_params)
          redirect_to @author
        else
          render 'edit'
        end
      end

      def destroy
        @author = Author.find(params[:id])
        @author.destroy

        redirect_to authors_path
      end
  
      private # 03
      def author_params
        params.require(:author).permit(:first_name, :last_name, :homepage)
      end
end