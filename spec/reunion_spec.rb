require './lib/reunion'
require './lib/activity'

 RSpec.describe Reunion do
 	before(:each) do
    @activity_1 = Activity.new("Brunch")
    @activity_2 = Activity.new("Drinks")
    @reunion = Reunion.new("1406 BE")
 	end

    context 'Iteration 2' do

     	it 'exists' do
     		expect(@reunion).to be_a(Reunion)
     	end

     	it 'has attributes' do
     		expect(@reunion.name).to eq("1406 BE")
     		expect(@reunion.activities).to eq([])
     	end

      it 'can add activities' do
        @reunion.add_activity(@activity_1)
        expect(@reunion.activities).to eq([@activity_1])
      end

    end

    context 'Iteration 3' do

      it 'can add participants to additional activities' do
        expect(@reunion.total_cost).to eq(0)
        @activity_1.add_participant("Maria", 20)
        @activity_1.add_participant("Luther", 40)
        @reunion.add_activity(@activity_1)
        expect(@reunion.total_cost).to eq(60)
      end

      it 'can add participants and find total cost in 1st two activities' do
        @activity_1.add_participant("Maria", 20)
        @activity_1.add_participant("Luther", 40)
        @activity_2.add_participant("Maria", 60)
        @activity_2.add_participant("Luther", 60)
        @activity_2.add_participant("Louis", 0)
        @reunion.add_activity(@activity_1)
        @reunion.add_activity(@activity_2)

        expect(@reunion.total_cost).to eq(180)
      end

      it 'can generate breakout of costs in a hash' do
        @activity_1.add_participant("Maria", 20)
        @activity_1.add_participant("Luther", 40)
        @activity_2.add_participant("Maria", 60)
        @activity_2.add_participant("Luther", 60)
        @activity_2.add_participant("Louis", 0)
        @reunion.add_activity(@activity_1)
        @reunion.add_activity(@activity_2)

        expect(@reunion.breakout).to eq({"Maria" => -10, "Luther" => -30, "Louis" => 40})
      end

      it 'can return a summary string of who is owed/owes' do
        @activity_1.add_participant("Maria", 20)
        @activity_1.add_participant("Luther", 40)
        @reunion.add_activity(@activity_1)
        @activity_2.add_participant("Maria", 60)
        @activity_2.add_participant("Luther", 60)
        @activity_2.add_participant("Louis", 0)
        @reunion.add_activity(@activity_2)

        expect(@reunion.summary).to eq("Maria: -10\nLuther: -30\nLouis: 40")
      end


    end

 end
