require 'sinatra'

get '/messages' do
    "<h1 style=\"background-color:DodgerBlue;\">Hello World!</h1>"
end

get '/messages/:name' do
    name = params['name']
    color = params['color'] ? params['color'] : 'DodgerBlue'
    erb :message, locals: {
        color: color,
        name: name
    }
end

get '/login' do
    erb :login
end

post '/login' do
    if params['username'] == 'admin' && params['password'] == 'admin'
        return 'Logged in!'
    else
        redirect '/login'
    end
end

get '/items' do
    items = ["Pencil", "Eraser", "Ruler"]
    erb :item, locals: {
        items: items
    }
end

get '/items/add' do
    erb :add_item
end

post '/items/add' do
    return params['item_name'] + ' telah ditambahkan'
    
end
items_arr = []

get '/item-list' do
    erb :item_list, locals: {
        items: items_arr
                
    }

end

post '/item-list' do
    items_arr << params['item']

    redirect '/item-list'
end