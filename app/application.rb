class Application

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
     
        if req.path.match(/items/)
 
            search_item = req.path.split("/items/").last
            item = @@items.find{|i| i.name == search_item}
            if item == nil
                resp.write "Item not found"
                resp.status = 400
            else
                resp.write item.price
            end
        else
          resp.write "Route not found"
          resp.status = 404
        end
        resp.finish
    end
    # def return_price(requested_item)
    #     if  Item.exists?(name: requested_item)
    #        Item.find_by(name: requested_item).price
    #     else
    #         "item not foudn"
    #     end
    # end
end