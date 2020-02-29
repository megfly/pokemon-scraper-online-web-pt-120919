class Pokemon
  
  attr_accessor :id, :name, :type, :db 
  
  def initialize(name:, type:, id:, db:)
    @name = name
    @type = type
    @id = id
    @db = db
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id_num, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).first
    Pokemon.new(pokemon_info, db)
  end
  
  
end
