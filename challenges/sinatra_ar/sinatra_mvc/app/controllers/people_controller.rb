
get '/people/' do
    @people = Person.all
    erb :"/people/index"
end

get '/' do
    @people = Person.all
    erb :"/people/index"
end

get '/new' do
    erb :"/people/new"
end

get '/people/new' do
    erb :"/people/new"
end

post '/people/new' do
    if params[:birthdate].include?("-")
        birthdate = params[:birthdate]
    else
        birthdate = Date.strptime(params[:birthdate], "%m%d%Y")
    end
    person = Person.create(first_name: params[:first_name], last_name: params[:last_name], birthdate: birthdate)
    redirect "/people/#{person.id}"
end

get '/:id' do
    @person = Person.find(params[:id])
    erb :"/people/show"
end

get '/people/:id' do
    @person = Person.find(params[:id])
    birthdate_string = @person.birthdate.strftime("%m%d%Y")
    birthpath_num = Person.get_birthpath_num(birthdate_string)
    @message = Person.get_message(birthpath_num)
    erb :"/people/show"
end
