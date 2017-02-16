class PatientWebclientsController < ApplicationController


def show 
  @patient = Unirest.get("http://localhost:3000/api/v2/patients/#{params[:id]}.json").body
end 

def index
  @patients = Unirest.get("http://localhost:3000/api/v2/patients.json").body
end

def create
  @patient = Unirest.post("http://localhost:3000/api/v2/patients.json", :headers => {"Accept"=> "application/json"}, :parameters => {:first_name => params[:first_name], :last_name => params[:last_name], :email=> params[:email], :birthdate => params[:birthdate]}).body

  redirect_to "/patient/#{@patient['id']}"
end

def new

end


end
