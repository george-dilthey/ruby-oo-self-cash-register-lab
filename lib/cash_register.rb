require 'pry'

class CashRegister
    
    attr_accessor :total, :last_item_price
    attr_reader :discount, :items 

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end
    
    def add_item(title, price, quantity = 1)
        @total += price * quantity
        quantity.times do items << title end
        @last_item_price = price * quantity
    end

    def apply_discount
        if @discount == 0 
            "There is no discount to apply."
        else 
            @total = @total - ((@discount.to_f * @total) /100)
            "After the discount, the total comes to $#{@total.to_int}."
        end
    end

    def void_last_transaction
        @items.pop()
        @total -= @last_item_price
    end

end

gcr = CashRegister.new

# binding.pry