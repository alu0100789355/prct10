

class Biblio

include Comparable
    
     attr_accessor :autores, :titulo, :fecha, :id

  def initialize(autores, titulo,  fecha, id)

    @autores, @titulo,  @fecha, @id = autores, titulo, fecha, id

  end
  
   def to_s
      "#{@autores.join(",")}\n#{@titulo}\n#{@fecha}\n#{@id}"
   end

    def <=>(otro)
        id<=>otro.id
    end
    
end

class Libro < Biblio

  attr_accessor :serie, :editorial, :edicion, :isbn
  
  def initialize(autores, titulo, serie, editorial, edicion, fecha, isbn, id)
    super(autores, titulo,  fecha, id)
    @serie, @editorial, @edicion, @isbn =  serie, editorial, edicion, isbn

  end


  def to_s
     "#{@autores.join(",")}\n#{@titulo}\n#{@serie}\n#{@editorial}\n#{@edicion}\n#{@fecha}\n#{@isbn.join(",")}\n#{@id}"
  end

end


class DocumentoElectronico < Biblio

attr_accessor :url

    def initialize(autores, titulo,  fecha, id, url)
        super(autores, titulo,  fecha, id)
        @url =url
    end
    
    def to_s
       "#{@autores.join(",")}\n#{@titulo}\n#{@fecha}\n#{@id}\n#{@url}" 
    end
end

class Revista < Biblio

attr_accessor :issn

    def initialize(autores, titulo,  fecha, id, issn)
        super(autores, titulo,  fecha, id)
        @issn    =issn
    end
    
    def to_s
       "#{@autores.join(",")}\n#{@titulo}\n#{@fecha}\n#{@id}\n#{@issn}" 
    end
    
end