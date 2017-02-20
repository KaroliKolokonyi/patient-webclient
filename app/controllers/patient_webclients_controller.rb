class PatientWebclientsController < ApplicationController


def show 
  @patient = Patient.find(params[:id])

end 

def index
 @patient = Patient.all 

  end 

def new

end

def create
  @patient = Unirest.post("http://localhost:3000/api/v2/patients.json", :headers => {"Accept"=> "application/json"}, :parameters => {:first_name => params[:first_name], :last_name => params[:last_name], :email=> params[:email], :birthdate => params[:birthdate]}).body

  redirect_to "/patients/#{@patient['id']}"
end




def edit
    @patient = Unirest.get("http://localhost:3000/api/v2/patients/#{params[:id]}.json").body
  end


  def update
      Patient.update(params[:id], params[:first_name], params[:last_name], params[:email], params[:birthdate])

    redirect_to "/patients/#{params[:id]}"
  end


  def destroy
    Unirest.delete(params[:id])
  
    redirect_to "/patients"
  end

end
