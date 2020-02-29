class Pokemon
  
  attr_accessor :id, :name, :type, :db 
  
  def initialize(name:, type:, id:, db:)
    @name = name
    @type = type
    @id = id
    @db = db
  end
  
  def self.save
    if self.id
      self.update
    else
      sql = <<-SQL 
        INSERT INTO pokemon (name, type)
        VALUES (?,?)
      SQL

      DB[:conn].execute(sql, self.name, self.type)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
    end
  end
  
end
