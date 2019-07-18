require 'sinatra'

get "/" do
	"Hello, world!"
end

def get_todos
    @@todos ||= {} 
end 

get "/todos" do
    @todos = get_todos()
    erb :todos
end

def add_todo(todo, date)
    if(Date.today.to_s <= date)
        get_todos()[todo]=date
    end
end

post "/todos" do
    add_todo(params[:title], params[:date])
    redirect "/todos"
end

def get_todo
    get_todos()[@todo]
end

get "/todos/:todo" do
    @todo = params[:todo]
    @date = get_todo()
    erb :todo
end

def update_todo(todo, date)
    if(Date.today.to_s <= date)
        get_todos().delete(@todo)
        get_todos()[todo] = date
    end
end
    
put "/todos/:todo" do
    @todo = params[:todo]
	update_todo(params[:title], params[:date])
    redirect "/todos"
end

def delete_todo
    get_todos().delete(@todo)
end
    
delete "/todos/:todo" do
    @todo = params[:todo]
    delete_todo()
 	redirect "/todos"
end
    