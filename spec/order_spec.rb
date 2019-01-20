require 'order'

describe Order do
    before(:each) do
        @dish = double('dish')
        @quantity = double('quantity')
        # @total = double('price')
        @order = Order.new

    end

    describe '#view_menu'do
         it  {is_expected.to respond_to(:view_menu)}
         it 'prints a menu' do
             expect(subject.view_menu).to eq (subject.menu)
         end
     end

    describe '#add_food' do
        it {is_expected.to respond_to(:add_food).with(2).arguments}
        it 'is expected to add an item, and quantity to your order' do
            expect(@order.add_food(@dish, @quantity)).to eq (@quantity)
        end
    end



    describe '#calculate_balance' do
        it {is_expected.to respond_to(:calculate_balance)}
        it 'calculates the total balance of your basket' do
            @order.add_food('shrimp', 3)
            expect{@order.calculate_balance}.to change{@order.balance}.by(@order.menu['shrimp'].to_f * 3.to_f)
        end
    end

    describe '#add_balance' do
        it {is_expected.to respond_to(:add_balance).with(1).arguments}
        it 'changes balance by the correct amount' do
            expect{@order.add_balance(4)}.to change{@order.balance}.by(4)
        end
    end

    describe '#check_out' do
        it {is_expected.to respond_to(:check_out).with(1).argument}
        it 'raises an error if the total input is incorrect' do
            expect{@order.check_out(@order.balance + 1)}.to raise_error "Incorrect amount"
        end
    end



end
