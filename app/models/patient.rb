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
     patient_hashes = Unirest.get("http://localhost:3000/api/v2/patients.json", header => {"Accept" =>"application/json", "X-User-Email" => "test@test.com", "Authorization" => "Token token =actual-api-key"}).body

    patients = []
    patient_hashes.each do |patient_hash|
    patients << Patient.new(patient_hash)
  end 
   return patients 

  
end