require './lib/activity'
require './lib/reunion'

 RSpec.describe Activity do

 	before(:each) do
 		@activity = Activity.new("Brunch")
 	end

    context 'Iteration 1' do

     	it 'exists' do
     		expect(@activity).to be_a(Activity)
     	end

     	it 'has attributes' do
     		expect(@activity.name).to eq("Brunch")
     		expect(@activity.participants).to eq({})
     	end

      it 'can add participants' do
        @activity.add_participant("Maria", 20)
        expect(@activity.participants).to eq({"Maria" => 20})
        @activity.add_participant("Luther", 40)
        expect(@activity.participants).to eq({"Maria" => 20, "Luther" => 40})
      end

      it 'can determine the total cost' do
        @activity.add_participant("Maria", 20)
        @activity.add_participant("Luther", 40)
        expect(@activity.total_cost).to eq(60)
      end

    end

    context 'Iteration 2' do

      it 'can split the total cost' do
        @activity.add_participant("Maria", 20)
        @activity.add_participant("Luther", 40)
        expect(@activity.split).to eq(30)
      end

      it 'can calculate what each person is owed' do
        @activity.add_participant("Maria", 20)
        @activity.add_participant("Luther", 40)

        expect(@activity.total_cost).to eq(60)
        expect(@activity.split).to eq(30)
        expect(@activity.owed).to eq({"Maria" => 10, "Luther" => -10})
      end

    end

    context 'Iteration 3' do


    end
 end
