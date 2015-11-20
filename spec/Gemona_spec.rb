require 'spec_helper'
require 'Gemona/biblio'
require 'Gemona/lista'
describe Gemona do


  it 'Es la version correcta' do
    expect(Gemona::VERSION).not_to be nil
  end
 
 
 context Biblio do 
    before :each do
       @bibliografia = Biblio.new(["Dave Thomas, Andy Hunt, Chad Fowler"],"Programming Ruby 1.9 & 2.0: The Pragmatic Programmers","(July 7, 2013)","1")
    end
    
   it 'Iniciamos Bibliografia' do
     expect(@bibliografia.to_s).to eq("Dave Thomas, Andy Hunt, Chad Fowler\nProgramming Ruby 1.9 & 2.0: The Pragmatic Programmers\n(July 7, 2013)\n1")
   end
   
   it 'Bibliografia de la clase padre' do
     expect(@bibliografia.is_a? Biblio).to eq true
   end
   it 'No pertenece a la clase hija' do
     expect(@bibliografia.is_a? Libro).to eq false
   end
   it 'No pertence a libro' do
     expect(@bibliografia.respond_to? "Libro").to eq false
   end
   it 'Comprueba que pertenece a bibliografia' do
     expect(@bibliografia.class).to eq(Biblio)
    end

  end
  
  context Libro do
  before :each do
      @libraso = Libro.new(["Dave Thomas, Andy Hunt, Chad Fowler"],"Programming Ruby 1.9 & 2.0: The Pragmatic Programmers","Guide. (The Facets of Ruby).","Pragmatic Bookshelf","4 edition","(July 7, 2013)",["ISBN-13: 978-1937785499,ISBN-10: 1937785491."],1)
    end
    
    it 'Prueba Libro' do
     expect(@libraso.to_s).to eq("Dave Thomas, Andy Hunt, Chad Fowler\nProgramming Ruby 1.9 & 2.0: The Pragmatic Programmers\nGuide. (The Facets of Ruby).\nPragmatic Bookshelf\n4 edition\n(July 7, 2013)\nISBN-13: 978-1937785499,ISBN-10: 1937785491.\n1")
    end
     it 'Bibliografia de la clase madre' do
     expect(@libraso.is_a? Biblio).to eq true
   end
   it 'Bibliografia no es instancia de la clase madre' do
     expect(@libraso.instance_of? Biblio).to eq false
   end
   it 'La clase de Libro' do
     expect(@libraso.class).to eq(Libro)
   end
    it 'Clase madre Bibliografia' do
     expect(@libraso.class.superclass).to eq(Biblio)
   end
   it 'Pertenece a clase hija' do
     expect(@libraso.is_a? Libro).to eq true
   end
    it 'pertenece a clase hija (documento electronico)' do
     expect(@libraso.is_a? DocumentoElectronico).to eq false
   end
   it 'No pertenece a DocumentoElectronico' do
     expect(@libraso.respond_to? "DocumentoElectronico").to eq false
   end
  end 
  
  context DocumentoElectronico do
  before :each do
    
    @documentoe= DocumentoElectronico.new(["informaticahack.es"],"Aprende paso a paso los fundamentos de ruby","25 Febrero 2015",47,"http://www.informaticahack.es/videcurso-aprende-paso-a-paso-los-fundamentos-de-ruby/#more-1081")
   end
   it 'Prueba documento electronico' do
      expect( @documentoe.to_s).to eq("informaticahack.es\nAprende paso a paso los fundamentos de ruby\n25 Febrero 2015\n47\nhttp://www.informaticahack.es/videcurso-aprende-paso-a-paso-los-fundamentos-de-ruby/#more-1081")
    end
     it 'Pertenece a Bibliografia' do
     expect( @documentoe.is_a? Biblio).to eq true
   end
   it 'Pertenece a documento electronico' do
     expect( @documentoe.is_a? DocumentoElectronico).to eq true
   end
   it 'No pertenece a libro' do
     expect( @documentoe.is_a? Libro).to eq false
   end
   it 'No pertenece a libro 2' do
     expect( @documentoe.respond_to? "Libro").to eq false
   end
   it 'Pertenece a Bibliografia' do
     expect( @documentoe.class.superclass).to eq(Biblio)
   end
  end
  
  context Revista do
    before :each do
      @revista=Revista.new(["Antonio Pérez, Lucas Fernandez"],"Pc facil Ruby Version 1.2","16 de Noviembre de 2015",74,"ISSN-123456789101112")
    end
    
    it 'Prueba Revista'do
      expect(@revista.to_s).to eq("Antonio Pérez, Lucas Fernandez\nPc facil Ruby Version 1.2\n16 de Noviembre de 2015\n74\nISSN-123456789101112")
    end
      it 'Pertenece a Bibliografia' do
     expect(@revista.is_a? Biblio).to eq true
   end
   it 'Pertenece a revista' do
     expect(@revista.is_a? Revista).to eq true
   end
   it 'No pertence a libro' do
     expect(@revista.is_a? Libro).to eq false
   end
   it 'No pertenece a libro 2' do
     expect(@revista.respond_to? "Libro").to eq false
   end
   it 'Pertenece a Bibliografia' do
     expect(@revista.class.superclass).to eq(Biblio)
   end
  end
  context Nodo do
    
    before :each do 
      @libraso = Libro.new(["Dave Thomas, Andy Hunt, Chad Fowler"],"Programming Ruby 1.9 & 2.0: The Pragmatic Programmers","Guide. (The Facets of Ruby).","Pragmatic Bookshelf","4 edition","(July 7, 2013)",["ISBN-13: 978-1937785499,ISBN-10: 1937785491."],1)
      @nodo1=Nodo.new(@libraso,nil)
    end
    
    it 'Valor del nodo ok' do
      expect(@nodo1.value).to eq(@libraso)
    end 
    
    it 'Siguiente apunta A NIL' do
      expect(@nodo1.next).to equal(nil)
    end 
    
  end
  
  context Lista do
    
    before :each do 
      #Libros
      @libraso = Libro.new(["Dave Thomas, Andy Hunt, Chad Fowler"],"Programming Ruby 1.9 & 2.0: The Pragmatic Programmers","Guide. (The Facets of Ruby).","Pragmatic Bookshelf","4 edition","(July 7, 2013)",["ISBN-13: 978-1937785499,ISBN-10: 1937785491."],1)
      @libraso2 = Libro.new(["Scott Chacon"],"Pro Git 2009th Edition"," (Pro). ","Apress","2009 edition","(August 27, 2009)",["ISBN-13: 978-1430218333. ISBN-10: 1430218339."],2)
      @libraso3 = Libro.new(["David Flanagan, Yukihiro Matsumoto"],"The Ruby Programming Language","","O’Reilly Media", "1 edition","February 4, 2008",["ISBN-10: 0596516177. ISBN-13: 978-0596516178."],3)
      @libraso4 = Libro.new(["David Chelimsky, Dave Astels, Bryan Helmkamp, Dan North, Zach Dennis, Aslak Hellesoy"],"The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends (The Facets of Ruby).","","Pragmatic Bookshelf", "1 edition","December 25, 2010",["ISBN-10: 1934356379. ISBN-13: 978-1934356371."],4)
      @libraso5 = Libro.new(["Richard E."],"Silverman Git Pocket Guide"," "," O’Reilly Media","1 edition","August 2, 2013",["ISBN-10: 1449325866,ISBN-13: 978-1449325862."],5)
      
      #creamos lista
      
      @lista = Lista.new(nil,nil)
 
    end
    it 'Hay cabeza' do
      @lista.insert(@libraso)
        expect(@lista.cabeza.value).to equal(@libraso)
    end 
    it 'Hay cola' do
      @lista.insert(@libraso)
        expect(@lista.cola.value).to equal(@libraso)
    end 
      it 'Insertando por la cabeza ' do 
        @lista.insert(@libraso)
        expect(x = @lista.cabeza.value).to equal(@libraso)

    end 
      it 'Insertar varios por la cabeza' do
      @lista.insert_varios([@libraso,@libraso2,@libraso3,@libraso4,@libraso5])
      expect(x =@lista.cabeza.value).to equal(@libraso5)
      end
      
       it 'Comprueba que se inserta por la cola correctamente' do
      @lista.insert_varios([@libraso,@libraso2,@libraso3,@libraso4,@libraso5])
      expect(x =@lista.cola.value).to equal(@libraso)
      end
      
      it 'Comprueba que se extrae del inicio' do
        @lista.insert_varios([@libraso,@libraso2,@libraso3,@libraso4,@libraso5])
        @lista.extraer_inicio()
        expect(x =@lista.cola.value).to equal(@libraso2)
      end
      
       it 'Comprueba que se extrae del final' do
        @lista.insert_varios([@libraso,@libraso2,@libraso3,@libraso4,@libraso5])
        @lista.extraer_final()
        expect(x =@lista.cabeza.value).to equal(@libraso4)
      end

  end
  

  
  
end
 
