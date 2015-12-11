

Nodo = Struct.new(:value, :next, :prev)
     


class Lista
    
    include Enumerable

    attr_accessor :cabeza ,:cola, :nodo_actual
    
    def initialize(cabeza,cola)
        @cabeza = cabeza
        @cola=cola
    end 
    
    def insert(x)
        
      
        node = Nodo.new(x,nil,nil)
        
        if @cabeza==nil && @cola ==nil
            
            node.prev=@cola
            node.next=@cabeza
            @nodo_actual = node
            @cabeza=node
            @cola =node
            
        else
            node.prev=@cabeza
            node.next=nil
            @cabeza.next =node
            @cabeza.next =node
            @cabeza=node
            
        end
        
    end 
    
    def insert_varios(nodos)
        
        nodos.each do |nd|
            
        insert(nd)
        
        end
 
    end
        
    def get_nodo()
            return @cabeza.value
    end
    
    def extraer_inicio()
            @cola=@cola.next

    end
    
    def extraer_final()
       @cabeza=@cabeza.prev
        
    end
    
    def to_s
       while @cabeza != @cola
             "#{@cabeza.value}"
            @cabeza=@cabeza.prev
       end
        
        if @cabeza == @cola
           if @cabeza == nil 
            nil 
           else
            "#{@cola.value}"
           end
        end
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
