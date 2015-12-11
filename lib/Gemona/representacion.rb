class APA
require "Gemona/lista"
require "Gemona/biblio"

    attr_accessor :lista1 , :lista2
    
    def initialize(lista)
       @lista1=Lista.new(nil,nil)
       @lista1=lista
       @lista2=Lista.new(nil,nil)
       @lista3=Lista.new(nil,nil)
        
    end
    
    def ordeno(autore)
            
                contador = 0
                nombres = []
                   autore.each do |parte|
                   autor=parte.split(' ')
                   
                   nombres[contador]=autor[1]+" "+autor[0]
                 
                   contador += 1
                   end
                
            return nombres
    end
    def ordenar_autores
        while (@lista1.cabeza != nil ) && (@lista1.cola != nil)
            nodo=@lista1.get_nodo()
            nodo.autores=ordeno(nodo.autores)
            @lista2.insertar(nodo)
            @lista1.extraer_final()
          
        end
    end
    
    def poner_ampersan(autore)
            nombres =[]
            nombres=autore.join(" & ")
            return nombres
    end
    def ordenar_ampersan
        while (@lista2.cabeza != nil ) && (@lista2.cola != nil)
            nodo=@lista2.get_nodo()
            nodo.autores=poner_ampersan(nodo.autores)
            @lista3.insertar(nodo)
            @lista2.extraer_final()
          
        end
    end
    def mayus(titulo)
 
                   
                   autor=titulo.split(' ').capitalize
                   autor.capitalize
        return autor.capitalize
        
    end
    def ordenar_lista
     
        @lista2.sort
    end

    def to_s
       "#{@lista3.cabeza.value.autores.rjust(13)}"
       
    end
   
end


