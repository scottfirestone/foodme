class GiverResponder < Bitbot::Responder
  category "Foodit"
  help 'recommend', description: 'adds a recommended restaurant to the db'

  route :recommend, /^ recommend (.*)/i do |restaurant|
    #do cool stuff here...
    respond_with "I just recommended your #{restaurant}"
  end

end
