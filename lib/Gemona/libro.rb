class Libro

  attr_reader :autores, :titulo, :serie, :editorial, :edicion, :fecha, :isbn, :id

  def initialize(autores, titulo, serie, editorial, edicion, fecha, isbn, id)

    @autores, @titulo, @serie, @editorial, @edicion, @fecha, @isbn, @id = autores, titulo, serie, editorial, edicion, fecha, isbn, id

  end

  def tamano_autores

    @autores.length

  end

  def to_s
      "#{@autores.join(",")}\n#{@titulo}\n#{@serie}\n#{@editorial}\n#{@edicion}\n#{@fecha}\n#{@isbn.join(",")}\n#{@id}"
  end

end

