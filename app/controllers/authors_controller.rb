# neu für #02 to access the path (i.e. the URL) of the "new author" page
class AuthorsController < ApplicationController
    def new
        @author = Author.new # 03: war davor noch nicht da - jetzt neue Instanz erstellen?!
      end
  
      def show # 03: ich glaub, das brauch ich nicht
        @author = Author.find(params[:id])
      end
  
      def index # 03 - damit kann man alle Autoren adressieren?!
        @authors = Author.all
      end
  
      def create
        @author = Author.new(author_params)
        if @author.save
          redirect_to @author
        else 
          render :new
        end
      end
  
      private # 03
      def author_params
        params.require(:author).permit(:first_name, :last_name, :homepage)
      end
end
