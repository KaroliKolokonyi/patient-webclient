class Patient

  attr_accessor :id, :first_name, :last_name, :birthdate, :email

  def initialize(hash)

    @id = hash['id']
    @first_name = hash['first_name']
    @last_name = hash['last_name']
    @birthdate = hash['birthdate']
    @email = hash['email']
  end


  def self.find(id)
    patient_hash = Unirest.get("http://localhost:3000/api/v2/patients/#{id}.json").body
   Patient.new(patient_hash)

  end

  def self.all 
     patient_hashes = Unirest.get("http://localhost:3000/api/v2/patients.json").body

    patients = []
    patient_hashes.each do |patient_hash|
    patients << Patient.new(patient_hash)
  end 
   return patients 


   def self.delete(id)
      Unirest.delete("http://localhost:3000/api/v2/patients.json").body
    end

def self.create(first_name, last_name, email, birthdate)

      Unirest.post("http://localhost:3000/api/v2/patients.json", :headers => {"Accept"=> "application/json"}, :parameters => {:first_name => first_name, :last_name => last_name, :email,=> email, :birthdate}).body
    end

  def self.update(id, first_name, last_name, birthdate, email)
      Unirest.patch("http://localhost:3000/api/v2/patients/#{id}.json", :headers => {"Accept"=> "application/json"}, :parameters => {:first_name=> first_name, :last_name => last_name, :birthdate=> birthdate, :email => email}).body
    end


end