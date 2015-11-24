include Enumerable

Nodo = Struct.new(:value, :next, :prev)
     


class Lista
    


    attr_accessor :cabeza ,:cola
    
    def initialize(cabeza,cola)
        @cabeza = cabeza
        @cola=cola
    end 
    
    def insert(x)
        
      
        node = Nodo.new(x,nil,nil)
        
        if @cabeza==nil && @cola ==nil
            
            node.prev=@cola
            node.next=@cabeza
            @cabeza=node
            @cola =node
            
        else
            node.prev=@cabeza
            node.next=nil
            @cabeza.next =node
            @cabeza=node
            
        end
        
    end 
    
    def insert_varios(nodos)
        
        nodos.each do |nd|
            
        insert(nd)
        
        end
 
    end
        
 
    def extraer_inicio()
            @cola=@cola.next

    end
    
    def extraer_final()
       @cabeza=@cabeza.prev
        
    end
    
    def to_s
         @cabeza.to_s 
    end
    
    def each
        while @cabeza != @cola
            yield @cabeza.value
            @cabeza=@cabeza.prev
        end
        
       if @cabeza == @cola
           if @cabeza == nil 
            nil 
           else
            yield @cola.value
           end
           
       end
    end

end 
